Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A4715EB7
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541144.843573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yFg-0006Ap-IU; Tue, 30 May 2023 12:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541144.843573; Tue, 30 May 2023 12:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3yFg-00068f-FR; Tue, 30 May 2023 12:15:00 +0000
Received: by outflank-mailman (input) for mailman id 541144;
 Tue, 30 May 2023 12:14:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=478C=BT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q3yFf-00068Z-NQ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:14:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973ad878-fee3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 14:14:57 +0200 (CEST)
Received: from AS9PR06CA0309.eurprd06.prod.outlook.com (2603:10a6:20b:45b::11)
 by AS8PR08MB9600.eurprd08.prod.outlook.com (2603:10a6:20b:618::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 12:14:54 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::f3) by AS9PR06CA0309.outlook.office365.com
 (2603:10a6:20b:45b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 12:14:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 12:14:53 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 30 May 2023 12:14:53 +0000
Received: from cbeacdde2175.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9532A511-F636-4E27-9A33-0CC8AEF52799.1; 
 Tue, 30 May 2023 12:14:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbeacdde2175.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 May 2023 12:14:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9933.eurprd08.prod.outlook.com (2603:10a6:10:413::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 12:14:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::52ec:40fa:1d66:7a1b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::52ec:40fa:1d66:7a1b%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 12:14:43 +0000
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
X-Inumbo-ID: 973ad878-fee3-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBhMHAkZErx/GU6fN/DbXKC2nygE+iNDHwbGjaN4MDU=;
 b=TF6jbILyHAYe0lXoGEsPsRTbQFue9gKAfBvyuWC2h6cKPwcPa5x7+/h10K+URpzAogv1g3suVtmZWu+yoSL3CZQXo9EkCcBrzVfVh6Cr7iANAhY0uU1JHthwWMZ9kvf62jHaWpaCzoibQaYozBGMbZXZ/q1ATvtiegtFWiBbH/8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 477e7520f8b8c882
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBmsWR7NcsvJK5cB7z/XKHIlp6oh0kZRl+ZwmyBUgRDBbg5eFgJ6RuFGDVoATjrfZHu9Lu7rLlF32+n81H68V/EhxQPvkzeJni8+SKLPcBc4teu7RWMoS5NCowqvmVkOKbVn8tUbhY/sO/Lb/cXRvw+DKfO9peaC3Ee5iEleu0r3TdKGozB18k8DksHgTDwY7tRhxvlKw8pClvBWW32N9k/LJhHzJhKaXSbqc9mVSf1kbgSPJqpmX9zG5SdoMcwued4ZuGx4oniLW0FUdzaqyUODsFnXUY28Byu6QxTgkEiwHVOhZTKMTK3wmDJWvtkhDcDufW+popJUV1x4DIRz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBhMHAkZErx/GU6fN/DbXKC2nygE+iNDHwbGjaN4MDU=;
 b=VqJLJSzUVT0mU3efFUoc81k35IcdZejBuFEt+3wQ+sSaZvoLegyjj24kCJw7XsrRzqZAw+p8KKCNeQH/WtDHjK9vC8yA2/+XTAwZqz1O6eHlVeCv9ZxkDvLwTKe09r2BWsSEN49pNqYbWXD+y40QOZZzWQ7QbiSomxU2tKX/A3j/lAxj+1GsOE5pBqBb+hUkwuTLL3GaGKBRoXjh6OTlplzpoWrBKEVaARacVIjnhLOD0Uyg5rD1o+9lAHDM1apAL9AQu5YwyPDMRW0r4igHzAAKy8+L4KR8+U6AGeadhPF37qUU8C7UKlk4vjZRNCrVbPl3b9WvQcW5VyHbpagR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBhMHAkZErx/GU6fN/DbXKC2nygE+iNDHwbGjaN4MDU=;
 b=TF6jbILyHAYe0lXoGEsPsRTbQFue9gKAfBvyuWC2h6cKPwcPa5x7+/h10K+URpzAogv1g3suVtmZWu+yoSL3CZQXo9EkCcBrzVfVh6Cr7iANAhY0uU1JHthwWMZ9kvf62jHaWpaCzoibQaYozBGMbZXZ/q1ATvtiegtFWiBbH/8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: Fix latent bug
Thread-Topic: [PATCH 2/3] xen/misra: xen-analysis.py: Fix latent bug
Thread-Index: AQHZijSdR4YxdS8bIkewpmkDG4LQH69yr6OAgAAciAA=
Date: Tue, 30 May 2023 12:14:43 +0000
Message-ID: <E7BE8D97-599A-4741-9DE0-F40ECDA5095D@arm.com>
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
 <20230519093019.2131896-3-luca.fancellu@arm.com>
 <62332bdc-696c-264b-47d7-2d9bcc6af734@suse.com>
In-Reply-To: <62332bdc-696c-264b-47d7-2d9bcc6af734@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9933:EE_|AM7EUR03FT027:EE_|AS8PR08MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 954bc4c3-4adb-4d41-fef8-08db610779d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L/uMQq2oVggN2sZVZ7AdemTuYikFIFvRYZrExTMtv1OW3vluZKHr5KfCqt2lg77IAHada6VyfcKLhtlHAHQFxRgbfA5/lNEoQqkkYMaGDoQ9gujrwmJjUehiUnAbfaGH2uGaO8RHBR6cJcK0jnFpUPHk8btLqYEIMxmCBxvmiXx1T41s9pgHcrLkGqIXeyHh5ZcD54UqxbJfy81grvJ/C5p22anY9+kz4apP0Qzq3EkP72AdRzdgZT3VRuGVhmDrd82zktCv0kIbIebfJjDloPZ48j8QPyi79RxSIkQe9YPGA+aeo01/OVkucIreQsUJNUIew8M76lIWOR0+hIpRBd7Lk8fQGK5X5tuU5sCLCH5cpIg7FFXh4UtgHzKBC3z8cHIW7dmPuPkVIDGWWEMesSw6GsaCNa5NwXLVukyOd5+pLt3MchvDi+CVoNYrd0jLxxBHH2k3opC3ip3m+RNwONpZgjpePzjJRwrsUBBLkAWWxcNPKIlaFnUvhyPIuYtDTsG9/kxjvPNd/4BecY01/tMPIB+qfVv1x1Wyp2vPPSjaEQn4SUzFm7rbfAa/N4l/fcIKnw4E9ND7q50sZzwgw7c5o3xky053guh+7oNHurkT+q0dDSViWQA1wnUvypa938YZCt0BA1E5Pyt5jzhzIw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(122000001)(38100700002)(41300700001)(38070700005)(6512007)(316002)(6916009)(4326008)(33656002)(71200400001)(86362001)(4744005)(8676002)(2906002)(8936002)(6486002)(2616005)(91956017)(66946007)(76116006)(66476007)(66556008)(36756003)(53546011)(64756008)(66446008)(54906003)(6506007)(26005)(478600001)(5660300002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C8E9E82E172924F84CFA979CC4A00A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1974ca31-76ff-4809-d930-08db610773be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Go3uVjnqxJdRsbQUJZsxEqR9d4ArNnlPo5Axe4onAMsTn8dzwywrQKpNVlCktOoojh/7BlsDpK6rQzMVaCx5zXBdqxQwFmuT7k9mi4U4PXeZwKFGwRTopkEIN/EUKXvUpcqlr9MCMEB9B8L79Q2pPNn4nKXpJ+LIrCu6PaCehvJbFymVCetawAHJDorz7M+qqHfcTgy+y0pjCZzqhgOPnptEKgLrnkQWImAgDo6VYkbQTzZczk9XDqrLgKzrJYREFWlHuBs4UXEqE6LTRPWB7wgn79S/h1cHGtvNqMPYdQQUoELvYL3EjQkM6Mf/CsmV66sdzaMqcTC97sEOIjCU2CYDqgR3aayBPoOnuRgHoeRtpBpe47bEChnkjR90NFciC0E+GGFiHiJ4wzr2kc532GjwSu6D0x9k8bwLXpbgFfJ58a3DnaHBGdCPpR3PuGoiBRn7kMFgwutLCjEa8JQiC01deFUmlrR1wNbfjnbrNB3n53/FErzPxCU35EgB7vhEwf4lZbpTPxmSrT9KQNDv6h8o0cviQtcoEInJlNMXCQx3fChSjZaNXEi7MC3zHem6R3y7K/cbo4RC44sn+ty/bQI5hYnna3/fhStIv7w8ZOh8QCSvjGsRqKhoOM52/Akxmj79l2bnzv1cTkMJggMsUPBKRZazAu4RNoKbGvOSNVY5WsaoWoRPIRQSufP8tx1J/xWWJSM4wCfVlywmkgxM0IaIHbhr0K0C8uMBpidLcpWXu6bEgbMYyNVVZx3bz9vR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(186003)(2616005)(41300700001)(336012)(6506007)(6512007)(53546011)(36860700001)(26005)(6486002)(47076005)(478600001)(40460700003)(54906003)(356005)(81166007)(82740400003)(70586007)(70206006)(4326008)(40480700001)(316002)(5660300002)(8936002)(6862004)(8676002)(2906002)(4744005)(33656002)(86362001)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:14:53.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 954bc4c3-4adb-4d41-fef8-08db610779d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9600



> On 30 May 2023, at 11:32, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.05.2023 11:30, Luca Fancellu wrote:
>> Currenly there is a latent bug that is not triggered because
>> the function cppcheck_merge_txt_fragments is called with the
>> parameter strip_paths having a list of only one element.
>>=20
>> The bug is that the split function should not be in the
>> loop for strip_paths, but one level before, fix it.
>>=20
>> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis=
.py script")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Just wanted to mention it: I've committed the patch as is, but in
> the future could you please try to find slightly more specific a
> title for such a change? The way it is now, someone going over
> just the titles in the log will have no clue at all what kind of
> bug was addressed here.

Sure, I will be more specific in the future, thank you

>=20
> Jan


