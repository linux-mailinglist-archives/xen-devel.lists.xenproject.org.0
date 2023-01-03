Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869A65BFF1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 13:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470604.730156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgV1-0004Nt-U4; Tue, 03 Jan 2023 12:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470604.730156; Tue, 03 Jan 2023 12:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgV1-0004Kx-PW; Tue, 03 Jan 2023 12:34:35 +0000
Received: by outflank-mailman (input) for mailman id 470604;
 Tue, 03 Jan 2023 12:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMp5=5A=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pCgUz-0004Kr-Qq
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 12:34:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f898d381-8b62-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 13:34:31 +0100 (CET)
Received: from DB8PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:10:100::46)
 by DB5PR08MB9998.eurprd08.prod.outlook.com (2603:10a6:10:489::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Tue, 3 Jan
 2023 12:34:28 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::bb) by DB8PR06CA0033.outlook.office365.com
 (2603:10a6:10:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 12:34:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.18 via Frontend Transport; Tue, 3 Jan 2023 12:34:28 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Tue, 03 Jan 2023 12:34:28 +0000
Received: from c3ea07c5858d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B79D49D-969C-46E7-8BC8-BCB82A3C1FFD.1; 
 Tue, 03 Jan 2023 12:34:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3ea07c5858d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Jan 2023 12:34:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB9254.eurprd08.prod.outlook.com (2603:10a6:150:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Tue, 3 Jan
 2023 12:34:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1909:220b:70ee:a5c3]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1909:220b:70ee:a5c3%7]) with mapi id 15.20.5986.009; Tue, 3 Jan 2023
 12:34:12 +0000
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
X-Inumbo-ID: f898d381-8b62-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+pfp5dyoybtMDi34WVwk5cS65qgk7w5i6y4Bj/H1fk=;
 b=HH2QYVWclhr8Zi1UnQOnHd37puEZQsT3yPr+SNs437Z6pj8WoMh2t91ThJNMPS7klO/kM+mGQpEpTmdlCp/VZuldeSk+reCU5Fgkp939KagBGXJbup2o78MVfhzWHoKByKF0RQI3m36eesYaU0pRd9VZm3HqT5CXXc9IYjpDNRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9841ea2b83a4b58
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGyWvN1Jxz7/JdAk8PoMjPF5jyp4NFdHW7iCHXDj9iHzfv8ozcfcfjktSwPEl/5y2nzdhNrvlRs9xK+KpXxSKovDR2nJUgJDkBb6cUIHx674IEv52CBUzio3Yt9NEmHHzAGCgAJr+y6k1dBi1kY1BSAZBpaw29TAGwku+uGsSHAIOyxDi80X2TLhD/GbnrSmBh4MAXEgeDffaZ0RSpEuyCnIVuMQIwNBHHQthRX/u+jjjZUzjHSD5z0fIrU7db1Bc5qy++pJEpLeBJlH273H58FyUyGZmPNn/FILatWQWI0vbuYd+6XmnGyYwg0sAnUurLc4dvCzBm2zEbtWgWpsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+pfp5dyoybtMDi34WVwk5cS65qgk7w5i6y4Bj/H1fk=;
 b=Sl2CjsljSdXzfel8aHYM+p46t4PfxwenM1RGXVdYwhb+lf3CZxlnkVLJEJHVxChH1JbmpZ7PbaoTAIVOLruyVRAegCNO+0txtRLCAvg6GtqfntBmaQF95ESemAKRvUU7Z9Z4amJTDbu+6Ox4SnmJVClmX0kbLLtRwWYOfuTgR5MtYsGCJcKfP+RADmfT3iDaTtZKqh+xSkNpER3qGX4oc3jgaSttWpCvkWUKGUGbOLOzljvrJdmtbGvo1LVEcv7k/CWXL8lrgbYWm+ZqRGxaNN5xD99Adt64uVNx75uQS1lNyf6hB0UP+i7xXzLMky6p0N9k9yCreQrZyX7CHQ2Hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+pfp5dyoybtMDi34WVwk5cS65qgk7w5i6y4Bj/H1fk=;
 b=HH2QYVWclhr8Zi1UnQOnHd37puEZQsT3yPr+SNs437Z6pj8WoMh2t91ThJNMPS7klO/kM+mGQpEpTmdlCp/VZuldeSk+reCU5Fgkp939KagBGXJbup2o78MVfhzWHoKByKF0RQI3m36eesYaU0pRd9VZm3HqT5CXXc9IYjpDNRc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RTFiJSG85qSUCZzK4infnuWq4NsO2AgAANc4CAAYyLAIBUWeeAgAKahgCAADe5AIAmqQKA
Date: Tue, 3 Jan 2023 12:34:12 +0000
Message-ID: <A52E1C09-40F1-416C-A085-2F2320EE69EA@arm.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
 <alpine.DEB.2.22.394.2212091409020.3075842@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2212091409020.3075842@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB9254:EE_|DBAEUR03FT053:EE_|DB5PR08MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: 56858e94-17c4-4f85-73fd-08daed86dafa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 adYc2ewzfsaYEgPg+LmehYT9Rz03VERxxxR2J8DWj2ZTEuCNtZDv6ow95LqpEwmhDFEx7NplCOeE5XCUI8uO4IeUqOWmpzJ7Zr2QOD6xcnCONqxHWqgVwFBWBKL69BNuswteTXO0KOgQYsdr9JRy1ivSGKRulf/xAFSKoZCEZOjbAa5uLB/F0IvKoTN1Y8J4YoUNi1lkkNO6rU4p2TubsHSsvcCJvxwG+1zQVOMinRG2j/Jr/ZtecjGa4HOErPJ83QZ/Co7VDZIGY9aFoFRHrS3V5XEdj1XgPdg0Rwds7HELxQmknLsf9iWZAP4SDVpFSLF21rCMdyMYtFCRuTWIjDbv4tnHOWF4Z7G9Cp0Pc09dDJxqd+y0QTn7fND6/mVFlE8m94SImAjtThMxL/zv0CeSE41bJVCPSz97dtNsobcNg8rdeHy+UcG/FIif/YRd9QGNoDkwIbl6zp8eAmxioTclVZQurz9bWUrpPDo6okY9Rg64oLP5rbU83xbivB9mR9zyU1gFOm7ZYBRt/24mdGRfM4CoXlCnw/3k/tgaQawraRCF1ujaIR0Zmzgk3wtDq7sGjS2KGRB27Up6ZQg5RXAijwCclbHUCqv3ZMrbAEkNAo0CUExpWLAFSMnLir9laHINaVCjURkIsLvAW0xOlp+Yb+mf7OSVnpRx6d6XnJgWuQmUeQRFtbB8ZkPCK+UhFh8hnMn/1jUSbaZjAxMdcCd0e6koR6w8iC+E0FLrzKVipSPAa3Y16nFheJe73dqHHaweTbuECglF8yLlcz3TUw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(66899015)(36756003)(86362001)(4326008)(6916009)(41300700001)(54906003)(91956017)(66946007)(38070700005)(66556008)(66446008)(66476007)(8676002)(76116006)(64756008)(38100700002)(122000001)(33656002)(26005)(53546011)(6486002)(186003)(71200400001)(6512007)(478600001)(2906002)(8936002)(5660300002)(6506007)(316002)(83380400001)(2616005)(22166006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_A52E1C0940F1416CA0852F2320EE69EAarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9254
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d182304-f1a0-42ba-c491-08daed86d187
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sfnrfhc6gvWXsK4ic9EbnnT7yLcF1t4OC4TvZluKsAbrNy3EwXiSaCQuTgVZv+e5HwJQY6hFqtSFs/xC1TIiRiQfsX3/hlZQ/9189LalP5oe9OcdTAcApZRoS0W/7ypw0yZmlbx8bPMdf4VVGA22DLprAjnfGX7ONylHwM5fPOHxEUMX421WV3FEebNe+E64oV0K4FEtns2MB9o2cqHy0x1oNtO4DVZsE5/sJep4nqU8Tx8vSutzxB5SbocSDq8X7NeNZPU/MNyT430u/TFhQinlaPA7dFBUlzn1f0QCZtYWZvEQGdjqDTrk4H9llW8NXpVZpVOKvadd8Przp4zPm7fyZLO7xjpKsADqltiJ2W4nPReWlDGCrz8bpzsLBPQhYFJFCvEMJ3RAKkYClzbhq4luR9qsKCMDopBOgIlAdIuK5bVSqQNxmEt46ZjL6dkwHQQ495iSlCKRe0lbkha0KvRfFikl4MRpUZlGUyXHRxD2bw58InuCDymGQVLJX1fFcDKOwdD36/Lkz2+WfEIlSAcgPaPCtPNEMSGL16F9BjYY+YhiZfVYk/vrQxbdVjrRVZgBKHSIoA3sDdy+uTQJdvBR+g62naJjfi67/g6ioB83AfIXRCgBGttWGTXe6jP3N95bWcIjoEMZgbjqklLelu9pk//JnSj/TZzbokaNFMZ/vPmSgOquDDeN94qmGz6/mVTBgpPiBijfRRCFO1JWm9Q80y2F36Zn0tldewPPow8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(33656002)(36756003)(81166007)(356005)(8936002)(82740400003)(6862004)(5660300002)(41300700001)(83380400001)(47076005)(36860700001)(86362001)(2906002)(82310400005)(6486002)(70586007)(54906003)(45080400002)(66899015)(70206006)(6506007)(53546011)(40480700001)(40460700003)(478600001)(8676002)(4326008)(316002)(336012)(2616005)(6512007)(186003)(26005)(22166006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 12:34:28.1593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56858e94-17c4-4f85-73fd-08daed86dafa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9998

--_000_A52E1C0940F1416CA0852F2320EE69EAarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the delay but I have very limited access to my mails right now.

On 9 Dec 2022, at 23:11, Stefano Stabellini <sstabellini@kernel.org<mailto:=
sstabellini@kernel.org>> wrote:

On Fri, 9 Dec 2022, Julien Grall wrote:
Hi Henry,

On 08/12/2022 03:06, Henry Wang wrote:
I am trying to work on the follow-up improvements about the Arm P2M code,
and while trying to address the comment below, I noticed there was an
unfinished
discussion between me and Julien which I would like to continue and here
opinions from all of you (if possible).

-----Original Message-----
From: Julien Grall <julien@xen.org<mailto:julien@xen.org>>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
arch_domain_create()
I also noticed that relinquish_p2m_mapping() is not called. This
should
be fine for us because arch_domain_create() should never create a
mapping that requires p2m_put_l3_page() to be called.

For the background of the discussion, this was about the failure path of
arch_domain_create(), where we only call p2m_final_teardown() which does
not call relinquish_p2m_mapping()...
So all this mess with the P2M is necessary because we are mapping the GICv2
CPU interface in arch_domain_create(). I think we should consider to defer =
the
mapping to later.

Other than it makes the code simpler, it also means we could also the P2M r=
oot
on the same numa node the domain is going to run (those information are pas=
sed
later on).

There is a couple of options:
1. Introduce a new hypercall to finish the initialization of a domain (e.g.
allocating the P2M and map the GICv2 CPU interface). This option was briefl=
y
discussed with Jan (see [2])./
2. Allocate the P2M when populate the P2M pool and defer the GICv2 CPU
interface mapping until the first access (similar to how with deal with MMI=
O
access for ACPI).

I find the second option is neater but it has the drawback that it requires=
 on
more trap to the hypervisor and we can't report any mapping failure (which
should not happen if the P2M was correctly sized). So I am leaning towards
option 2.

Any opinions?

Option 1 is not great due to the extra hypercall. But I worry that
option 2 might make things harder for safety because the
mapping/initialization becomes "dynamic". I don't know if this is a
valid concern.

I would love to hear Bertrand's thoughts about it. Putting him in To:

How option 1 would work for dom0less ?

Option 2 would make safety more challenging but not impossible (we have a l=
ot of other use cases where we cannot map everything on boot).

I would vote for option 2 as I think we will not certify gicv2 and it is no=
t adding an other hyper call.

Cheers
Bertrand



--_000_A52E1C0940F1416CA0852F2320EE69EAarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <C3537B5D65335948995A5BE4B696560C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi,
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Sorry for the delay but I have very limited access to my ma=
ils right now.<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 9 Dec 2022, at 23:11, Stefano Stabellini &lt;<a href=3D"=
mailto:sstabellini@kernel.org" class=3D"">sstabellini@kernel.org</a>&gt; wr=
ote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">On
 Fri, 9 Dec 2022, Julien Grall wrote:</span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D"">
Hi Henry,<br class=3D"">
<br class=3D"">
On 08/12/2022 03:06, Henry Wang wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">I am trying to work on the follow-up i=
mprovements about the Arm P2M code,<br class=3D"">
and while trying to address the comment below, I noticed there was an<br cl=
ass=3D"">
unfinished<br class=3D"">
discussion between me and Julien which I would like to continue and here<br=
 class=3D"">
opinions from all of you (if possible).<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">-----Original Message-----<br class=3D=
"">
From: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" class=3D"">julien@=
xen.org</a>&gt;<br class=3D"">
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in<b=
r class=3D"">
arch_domain_create()<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D"">I also noticed that relinquish_p2m_map=
ping() is not called. This<br class=3D"">
should<br class=3D"">
be fine for us because arch_domain_create() should never create a<br class=
=3D"">
mapping that requires p2m_put_l3_page() to be called.<br class=3D"">
</blockquote>
</blockquote>
</blockquote>
<br class=3D"">
For the background of the discussion, this was about the failure path of<br=
 class=3D"">
arch_domain_create(), where we only call p2m_final_teardown() which does<br=
 class=3D"">
not call relinquish_p2m_mapping()...<br class=3D"">
</blockquote>
So all this mess with the P2M is necessary because we are mapping the GICv2=
<br class=3D"">
CPU interface in arch_domain_create(). I think we should consider to defer =
the<br class=3D"">
mapping to later.<br class=3D"">
<br class=3D"">
Other than it makes the code simpler, it also means we could also the P2M r=
oot<br class=3D"">
on the same numa node the domain is going to run (those information are pas=
sed<br class=3D"">
later on).<br class=3D"">
<br class=3D"">
There is a couple of options:<br class=3D"">
1. Introduce a new hypercall to finish the initialization of a domain (e.g.=
<br class=3D"">
allocating the P2M and map the GICv2 CPU interface). This option was briefl=
y<br class=3D"">
discussed with Jan (see [2])./<br class=3D"">
2. Allocate the P2M when populate the P2M pool and defer the GICv2 CPU<br c=
lass=3D"">
interface mapping until the first access (similar to how with deal with MMI=
O<br class=3D"">
access for ACPI).<br class=3D"">
<br class=3D"">
I find the second option is neater but it has the drawback that it requires=
 on<br class=3D"">
more trap to the hypervisor and we can't report any mapping failure (which<=
br class=3D"">
should not happen if the P2M was correctly sized). So I am leaning towards<=
br class=3D"">
option 2.<br class=3D"">
<br class=3D"">
Any opinions?<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">Option
 1 is not great due to the extra hypercall. But I worry that</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">option
 2 might make things harder for safety because the</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">mapping/initialization
 becomes &quot;dynamic&quot;. I don't know if this is a</span><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">valid
 concern.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">I
 would love to hear Bertrand's thoughts about it. Putting him in To:</span>=
</div>
</blockquote>
<br class=3D"">
</div>
<div>How option 1 would work for dom0less ?</div>
<div><br class=3D"">
</div>
<div>Option 2 would make safety more challenging but not impossible (we hav=
e a lot of other use cases where we cannot map everything on boot).</div>
<div><br class=3D"">
</div>
<div>I would vote for option 2 as I think we will not certify gicv2 and it =
is not adding an other hyper call.</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<div><br class=3D"">
</div>
<br class=3D"">
</div>
</body>
</html>

--_000_A52E1C0940F1416CA0852F2320EE69EAarmcom_--

