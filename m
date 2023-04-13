Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D266E0C57
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520638.808440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmv07-0006Od-Uk; Thu, 13 Apr 2023 11:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520638.808440; Thu, 13 Apr 2023 11:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmv07-0006LZ-Ro; Thu, 13 Apr 2023 11:20:27 +0000
Received: by outflank-mailman (input) for mailman id 520638;
 Thu, 13 Apr 2023 11:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmv05-0006LI-Pa
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:20:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c9b8484-d9ed-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 13:20:20 +0200 (CEST)
Received: from AM3PR07CA0090.eurprd07.prod.outlook.com (2603:10a6:207:6::24)
 by DB5PR08MB10164.eurprd08.prod.outlook.com (2603:10a6:10:4a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:20:17 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:6:cafe::b7) by AM3PR07CA0090.outlook.office365.com
 (2603:10a6:207:6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.6 via Frontend
 Transport; Thu, 13 Apr 2023 11:20:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 11:20:17 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 11:20:16 +0000
Received: from ea88f1c3a20e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87783C65-DE60-4F96-BA21-B9EFE4E583E8.1; 
 Thu, 13 Apr 2023 11:20:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea88f1c3a20e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:20:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8662.eurprd08.prod.outlook.com (2603:10a6:10:402::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 11:20:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:20:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2c9b8484-d9ed-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4I0Ly3VMIqge6eo/oxfppyc3rD8Kuvq1z0VJHkg0MQ=;
 b=jPZ8wBh1dbImg2GMAhyjeoNv+YVyND/OCDHY1OMn9ZvMiopM+sysg4fAk/0UHi1l4ywow+g+QeecLObGUWJZKjwReYqJKGGkHGpU9p4KvPc+Eg4rKrjfK4I1g7k5EQ84AyisJFCXO7NW3lJZtWtG+p0GWl0Mv+FmouVk8OyU+ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNar9kSHTk9oPnDWajJWaMJ9TNcnUCxxWZb9Zw1Ln2ogobxBd0XwRMiTiHOaSK7ahBoGtWBIjHG3dkjtDzBaAQq/34V4cGp7wD9zYgxEH5QV0Xu2eHOQgx4rnQjKncr0H+WJ7SPl04Mdw98U1QfahfUHJo3Qcfb9atLPvrILW9ZRQBvFSC9LjDue6KLT08SvJEYr3rNiS9VYXjqDyTvPtocOgF0g7owfc3SakeAW/KvD/4adfsrt0q7H88hGbZU85I+1FPx2e4rqD0BS2Z7l+WHk4uxO4SJTnIFGZdzZSLPgFhF+DUJ6PK7Sk62ZJZXwOcY7RM+6ClDkVcT/41DgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4I0Ly3VMIqge6eo/oxfppyc3rD8Kuvq1z0VJHkg0MQ=;
 b=DvqLaj9v042aIvN55KGR457kqCR0qlRxbtJ+yfrgScbtnnNkP19FdF7bZbfCbKdQYd74naj4Vj9aZaHE025x/Z53fAKJ8aGxHph0LHZTdsX9v2aL2Iohe43zQk1c4FnJrm4mQHLWYgau4cEurq5EHZtulCdtnrEDEmldlGx3Pj24uKbQimiJU8v27v7JtgroM5m4Uqsen+gWyjPWTyDDBFsMmVMfXeDXP33o7wF5BDvunGHO81fSCqMuLqTCW8MCmvohz3+/e+2Ra3F0BAoJ9kAxgkOhqgqwDtMQUSkNz4FbAOpMVZulQHz5jek8Q7ONlGTERJYHiszFB/boro2B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4I0Ly3VMIqge6eo/oxfppyc3rD8Kuvq1z0VJHkg0MQ=;
 b=jPZ8wBh1dbImg2GMAhyjeoNv+YVyND/OCDHY1OMn9ZvMiopM+sysg4fAk/0UHi1l4ywow+g+QeecLObGUWJZKjwReYqJKGGkHGpU9p4KvPc+Eg4rKrjfK4I1g7k5EQ84AyisJFCXO7NW3lJZtWtG+p0GWl0Mv+FmouVk8OyU+ds=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: RE: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
Thread-Index: AQHZbdfkK4+Lpc3ia0Cwa4AcAShE7K8pF0vQ
Date: Thu, 13 Apr 2023 11:20:01 +0000
Message-ID:
 <AS8PR08MB799163D2CB5E1184FC2F978B92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-23-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-23-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D794DA9012850145B3787C7B4B253050.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8662:EE_|AM7EUR03FT046:EE_|DB5PR08MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dffd47e-076c-45ea-687c-08db3c110f43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9W7k1OX8qJTJhnSyPFJFRSNOrZMjSFgz9WCCnVPIvLLs+0PKR8pHtc2gH3qeoEMoymGcJtxfVtNkhC7qyaDrQ5RxlzstF65iRF5LYG0OKN3abk1dcRXlzEe2dRdHpk8L1Ke5cS95XVoG/uAMuqP0j4B+EKlWIYKpIGecyAXv1AxwDeAR8c7OEiM4T8INkFqQ+38F60AE+zX8XhtfB1ZRQssXvgHgAlc/Ea4P4wpLS9Djvd5muJy3wZJeg+CD3QShGvIaP65K/joE8CfQWXmOvvw+HmkeC8/G8XWVWtryoC7RSsvE83JemoI8i30Drj+zrAbcEc4QA7ZvfZ6NAkNHLQ0YmnSWmL+vqnU+mPsNZCf54zCXe2LUIkunLSonWWu5J9y5Pw1bCoidJQcoo9UBQ8cjYXLRGLGf4Tsnmbh95iDSMNOuCbhm+YNXCwRpncano6Tbbgt4kISx6YX8Ena+R6dzBQEViLYxhcl9pteqdho3Bpa7k/gjLGQAKmqs1/Jq+ZY8LvpndBrFDVaPro6bn5N+Yhrcv8mmIM7+m5Y2silYZM6eaI+gUn1KmtHLqrebJk+juV1pN2amj7kEeM+wS+Bl6pmdQ9l7IZRYVRFzC8s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(4326008)(71200400001)(41300700001)(66446008)(66946007)(54906003)(64756008)(66556008)(478600001)(8676002)(966005)(66476007)(76116006)(110136005)(316002)(33656002)(86362001)(6506007)(9686003)(83380400001)(26005)(7696005)(122000001)(2906002)(55016003)(4744005)(5660300002)(38070700005)(8936002)(38100700002)(186003)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8662
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51d9b2bd-d348-4319-58aa-08db3c1105fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2qYJAIeL4JAEMgucaI1evwoUBFcRg3dJddbjGacdhC2SBkHB4W+6c3Pn+AUCKF+DcTvM+gQgJDFtezf5ns+iFkUEH+OVwK3RQ26b7fjZwk9kY6NPlGLHGw75Gy3FzCAaXeKDyyWwv76LgfR15lRJq4mPtSSv3ldjrTwRUtimmFDc6oZelMkiKPp7l9M8PDIv978x1Ea2mM+f0ww1Jk0UFWhRVnC6aALHTGcgJMJyWnTkzVTx38mJbiSI/FWkNJjt3bsqcFoPePECeHu7IQrqnBOntLCBHXY6dPqqwdF92+grUEviqCAEM5oLWxuvruTvncXUC4y5oGEP78RYFkl3HgqlNwEgRk9Cw519nuEGejglUMN4lnxkfr/mIPEoo69CpQzyR+ag85ctP5uu4V3Tm+dW6Y1uAMHT7rbZFFxHUfGqmi7hc+6oFZdS7nUogmrsQmVorTVt5Ysj6MqcBAntPmq5opPjNi3vBY2QdSHD6Qs1WlBa+FcF5OdYkk/I6VxMoSnmNW6gpcmvf7pHU6LAcqk6WZdb3hQQKgXSuk/9QqtzAtBR8rxnZMAXi4BCbk0DIzyQ19qLw9JKdJEurhwEcy7C9TS5krwQrHTKNLPxF/gLequ6aoo4Y2WVJFL6Trz8FQ9foGx5eCwtulo7/mQWolVbC1eDCJSt3nwXtHfyo0rcbGfCroobVFcv/cSEcZK3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(110136005)(54906003)(478600001)(83380400001)(336012)(36860700001)(33656002)(6506007)(186003)(86362001)(55016003)(26005)(9686003)(107886003)(47076005)(81166007)(82740400003)(40480700001)(82310400005)(356005)(40460700003)(7696005)(966005)(2906002)(41300700001)(70206006)(316002)(70586007)(4326008)(4744005)(8676002)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:20:17.0618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dffd47e-076c-45ea-687c-08db3c110f43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10164

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
>=20
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  SUPPORT.md               |  8 ++++++++
>  docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
>
> +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partition=
s
> +(SP), default false.
> +
> +Currently is only a small subset of the FF-A specification supported. Ju=
st

I am not a native English speaker but I think this sentence would better be=
:
"Currently only a small subset of the FF-A specification is supported."

Other parts look good to me, so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


