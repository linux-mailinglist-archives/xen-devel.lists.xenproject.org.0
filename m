Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA97AD14C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607645.945916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkftL-0004eH-Mt; Mon, 25 Sep 2023 07:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607645.945916; Mon, 25 Sep 2023 07:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkftL-0004ap-Il; Mon, 25 Sep 2023 07:20:27 +0000
Received: by outflank-mailman (input) for mailman id 607645;
 Mon, 25 Sep 2023 07:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkftK-0004Fi-J0
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:20:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe3210bb-5b73-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 09:20:24 +0200 (CEST)
Received: from DU2PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:10:232::29)
 by VE1PR08MB5645.eurprd08.prod.outlook.com (2603:10a6:800:1a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:20:21 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::b9) by DU2PR04CA0084.outlook.office365.com
 (2603:10a6:10:232::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:20:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.17 via Frontend Transport; Mon, 25 Sep 2023 07:20:21 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Mon, 25 Sep 2023 07:20:21 +0000
Received: from f7c75751a27f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 598699A8-5C73-498E-9B5D-1223EE0D049A.1; 
 Mon, 25 Sep 2023 07:20:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7c75751a27f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:20:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:20:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:20:12 +0000
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
X-Inumbo-ID: fe3210bb-5b73-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLGGEAGY3j0Ok5hYGUEaFS9FQ2oHHaZz9jMk2Dd1tTA=;
 b=MX4Ck2ESgxi3swQD8qk71mlrfXBe/e+rSXehZKFT8WnhfWe5TZOAqHwcbzlGrXzB+jpLkrNyfPnWMYBxCPDpXeDxlbt8rfV4fXvy7HVyCSB3vFZcnG88R8dEqZLkQQACPCKT/uvMt2VS1ZXbAB5UMiTK3NrgeFRD1YKmo46R1kY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b6551a31de4663c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOZN9UWlFDBlfpxuNsVXDTvsPcYmCfnTywUSi9GguukQua5lIai3ihqUlow74V6Y8xwkv3eT08mCN3xc7UwvTtYiFJcH1HbgX2onnxVgLm5fHovArNfbO45oZFM9EsO0OstJtA4v1pq/6nlSnsxRs4aMe9PFW2WO2NC1fUo3RUCP/rvW5sS9y1OcKpijqgobIGd4j21dPq+N8b9hpjn35tfK/RD9QLp0Deat4JpE+ubvxcKwUy5YAtgIcNFlpcy7ATXuRgUPvq1nZGDNZ5HNTPbJ02uQtfKjgxF4q5PoJqRrHI635X6siYgi1z0Wmf9/sw2bItekjSum557UytYeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLGGEAGY3j0Ok5hYGUEaFS9FQ2oHHaZz9jMk2Dd1tTA=;
 b=AjAm64CwbUzdKfig+XjAAEXIygikbKfZsbiI6tabIOxKLgAI1m7ROdhXLg2RFKZLzmceCD6AiyPR5mE+oZ7xiTbvXEgxLCqSuBZ7alSnbDAgAv8zBJ2ospROPXtA9PFZ6VY4Tj/jQrmvWKolKa06D+3n075dIQqFx9CWBldSkX7qK3ThuOvRZO8EpunizVtDJLXQ5dbVxRt11aCE1201m6CmEH3HjkYYHMd0r6wYcW6lnc8KJMm3qlXLtTo89t00EC+IV6+D3WbL+adbv8J0PAH/k+Il4/8rVsTM9b9Yu3Oxj7N5+pS6lZ90sERwGiS8PBAL9g3kT5YPAht5lxwGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLGGEAGY3j0Ok5hYGUEaFS9FQ2oHHaZz9jMk2Dd1tTA=;
 b=MX4Ck2ESgxi3swQD8qk71mlrfXBe/e+rSXehZKFT8WnhfWe5TZOAqHwcbzlGrXzB+jpLkrNyfPnWMYBxCPDpXeDxlbt8rfV4fXvy7HVyCSB3vFZcnG88R8dEqZLkQQACPCKT/uvMt2VS1ZXbAB5UMiTK3NrgeFRD1YKmo46R1kY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Federico Serafini <federico.serafini@bugseng.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2] xen/emul-i8254: remove forward declarations and
 re-order functions
Thread-Topic: [XEN PATCH v2] xen/emul-i8254: remove forward declarations and
 re-order functions
Thread-Index: AQHZ7Wg4RWFhAmFg10Cbma+npgB3n7ArGxAAgAALhIA=
Date: Mon, 25 Sep 2023 07:20:12 +0000
Message-ID: <C38EC925-8F41-4A11-8BC6-228B6FA49E20@arm.com>
References:
 <b2877f0e2d867e04e806d70cc2ba175386c30d9c.1695392080.git.federico.serafini@bugseng.com>
 <8e49ae70-5e2e-e87b-f7e6-901f9a689fe1@suse.com>
In-Reply-To: <8e49ae70-5e2e-e87b-f7e6-901f9a689fe1@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6032:EE_|DBAEUR03FT028:EE_|VE1PR08MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f8a6a5-f688-4b84-2b67-08dbbd97e0d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8eRZfmRFxVqgvzlkVuIg4NxlDhRYT0Ac8oNRnqcN9i7wC2o91mCyoqgA+NmMMnT5kX4Fw18DtH/Lg4+GBlZdtoX18RcCMJuKWmRx7oDlt3a5ng5CH+rg+T0skVOEDbOUA11HE/l7/+YOqIjmcsYJ3LjcGh4zJW6OaRJFFZwAJgFaaw98C+ngRvUynTJqKfWXcHilPB/9s3Cf0mllYPSJ7mVJ6dU7g/Y2ytMBBchLPEkDemP95oCUnVQDzVpBbFne/2vI5SLFjj8LQNhrTt0Gmwq4VWvizA75toiB/qr7sv6zjHiYcDBYvVUWp1hmNgS4NxBQB/3OvibZEptEoDQlUzwtViqW2agHtv6D3wu5fEbI1G5At2Y6T4pixU1vpTBzhs+JFUnh8yECRCYTS2HKNDnCzKjl0EEZI/of+u5ES8ndhwWfPdRPfdPyBravLWNbxeaQKGa4jnZAl868pd8IZwL6AR6V128+2enKvTDFConyyPeYtq6nZ4fDbszvHzarY8T2J8ZviZrUFkEigdXCdRMMUGquDAwK7Lp4PD+eBQmNTnAsBhq5WP+uM2fmoyWNBMqfS8MkoabPlhVSkj6VRAgqWu8f/07rfQKGU6V+EOv49nCiab8IIwcDsY9NWUV7STA/Syot3TWc6a8Nz1+Mum1gQQOYvKVMZO8cCr6TTQw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(316002)(41300700001)(26005)(2906002)(5660300002)(8676002)(478600001)(66556008)(6916009)(4744005)(66446008)(64756008)(54906003)(66476007)(66946007)(91956017)(76116006)(4326008)(8936002)(6486002)(6506007)(71200400001)(53546011)(6512007)(36756003)(2616005)(122000001)(38070700005)(38100700002)(86362001)(33656002)(169823001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <659149ECB8355744A82E991FDA90C414@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	276c70f0-50b4-4ea5-ba25-08dbbd97db75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBNIMRFNXDZJvbzKHeY984gDZaXMUuk41vnEarL8pTc64p9Sx+sI16ziDSImwv4gMv6itcRxcqMGEfhr2L7N7yYiUbwyJyfEDq2bB5G3eSI8rnL3Cnt0BrQ7ZJqlBc2Y+HSzO/wRSW0FlRTVlny3g6djDhYDJv0sHVn+c2PZ5T+nT1o58GLse83RC4HZy0FKLPRJbbTWohgiHwkiJHceM8qStI0GyZ58VTMDa+EK4l/8QE3JOirmPmmv3FNqv40Ip3xLdr1lxUG1YwtmRdCNqASD2ORuXi/PSCf390BUSuwrWMvcIqDM4gG0MKDrjlkA57kJtZ+7tP/z8cpbdzjHfH8ejbXzrvzSu8AJ3IYxEPdePfNzR62S4uVcXHrCfecAMLAfdQppc8ycLuvZESbDUF4WfQ5NubqeLLvnqkD7i+5HQBFZ7vidu4k8+n9NMc1qrwVTZTd/RjoD0sjA9g/0KLTPhWrJBYGNAzo62Kq4LQ36aEr8DEOOAu+JKt3KRqYPHYBMMLxZem08+2BBnJDINRXQunMv9AP7Im27MyBihmp/DLaQNtdwCrQF8m5FRo6+FSD2wvmakHl9ypNFV/T3i8CjEO6BtztNVs78OlRBURilsoQw+yoJeUBnC8GuToyL7XWqM8EYZbn41cHCyfaUCyexFFYbXgHiJgGixqj0d8IDBxMaq+4dpYjIKb3ZMof5EP0pyQxH1K6nLOKiKn3tN0krMEyYez4gjWUx7F0qmq4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39850400004)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(36756003)(33656002)(86362001)(40480700001)(53546011)(4744005)(81166007)(6512007)(2906002)(2616005)(5660300002)(478600001)(41300700001)(316002)(70586007)(70206006)(54906003)(6506007)(6486002)(47076005)(356005)(36860700001)(4326008)(6862004)(8676002)(8936002)(336012)(26005)(82740400003)(169823001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:20:21.2835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f8a6a5-f688-4b84-2b67-08dbbd97e0d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5645

Hi,

> On Sep 25, 2023, at 14:38, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.09.2023 17:19, Federico Serafini wrote:
>>=20
>> -
>> -/* the intercept action for PIT DM retval:0--not handled; 1--handled */=
 =20
>> +/* the intercept action for PIT DM retval:0--not handled; 1--handled */
>=20
> If you already touch this comment to remove trailing whitespace, it also
> wants its style corrected. Perhaps okay to do while committing, so then:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Jan
>=20


