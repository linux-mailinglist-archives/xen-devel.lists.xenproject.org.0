Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5167BC32D
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 02:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613857.954690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qouj3-0000c8-I5; Fri, 06 Oct 2023 23:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613857.954690; Fri, 06 Oct 2023 23:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qouj3-0000ZR-Ez; Fri, 06 Oct 2023 23:59:21 +0000
Received: by outflank-mailman (input) for mailman id 613857;
 Fri, 06 Oct 2023 23:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qouj1-0000YN-CS
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 23:59:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bbece42-64a4-11ee-98d3-6d05b1d4d9a1;
 Sat, 07 Oct 2023 01:59:17 +0200 (CEST)
Received: from AM6PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:92::15)
 by DU0PR08MB8953.eurprd08.prod.outlook.com (2603:10a6:10:464::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Fri, 6 Oct
 2023 23:59:05 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::e1) by AM6PR04CA0002.outlook.office365.com
 (2603:10a6:20b:92::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.30 via Frontend
 Transport; Fri, 6 Oct 2023 23:59:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 23:59:04 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 06 Oct 2023 23:59:03 +0000
Received: from d9fdb36b343a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7098A23B-E5E6-47EA-A6E9-4164005190C2.1; 
 Fri, 06 Oct 2023 23:58:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9fdb36b343a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 23:58:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 23:58:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.040; Fri, 6 Oct 2023
 23:58:55 +0000
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
X-Inumbo-ID: 5bbece42-64a4-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDXCvUPkeaup1b5gu9nPPdYP3fyl6kClTr38z+v5/Yk=;
 b=ev2S3w49lgTXz8ebOX7OtgaW+wNHqCRdQ7Iyf5kR9M33K8oHAhkcR9iih0rxzAhCVq+iFQVRcYBbeJLZpXzlTNnZ2FrbxltLTsvqunsvy9EFvxrbPvdgq98FSug4M9JN+qyUZU8sDaEZtBDgHE0JGL/x4/ydV23utz5acrsaXLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f9675d73e597d9a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOPueBEvplnLoL1KzJ7+eOs1UOzmjBpiAAPPf9jOOl1ICyMwUNNd0OQ9CGYwzLB9EirZ2zGymabSvUi0M9F62rD+x44UJLDlRBu/vhB7iEgfi0s7MDSR2KE9zAR8u73TG0BlEJ/vjeEHxYZJGEh2C70UOYrmYKhJTkmaDzhEMfr2pguG8eOVVvssh6krWZjbrGwb9yEZ+z8YiTNLfbg2P94iNvYEFn9l/Su1OlFoG9GjqB0pT+vvYe3OSvjlDR4r54va81gz+/LCgdS7xd0SKjVDdkBFhaKOTRxYhF33jo5q9CtHU5VrFRh04xZoNj20ZrL1IzanlxEeuzUKDK2QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDXCvUPkeaup1b5gu9nPPdYP3fyl6kClTr38z+v5/Yk=;
 b=kTuEqRuv2aAif/+HTfT0oE+a8I35TbjiyK1+MrjWc4KtQ0Cp99uL6ct7Dfzearzk+s8oVwvx99izU5L6HnVsNvcue9YEgQb3MRmTciqm4uScoZU/Ngme6PnsSrwqq60aIdRZP01Owh1Tgzjlzfu/OlyWN9mzvw8vQ8VCzYaFYzVYYq6YxVrToviBc6xjjEhckL9wIQDMRCPpNl4XWDW0zHUoVmPYjony08QAqUjXFCRINnE4H2wPxM6jHYKEj7lTNXcHB9OPHfLGqgSmNsA7OeeeHaO+4pcJIF/R1O8cahtD5If1zdAO8gMopT78d6pmEBxbRH3kZsWzvQxSch4jLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDXCvUPkeaup1b5gu9nPPdYP3fyl6kClTr38z+v5/Yk=;
 b=ev2S3w49lgTXz8ebOX7OtgaW+wNHqCRdQ7Iyf5kR9M33K8oHAhkcR9iih0rxzAhCVq+iFQVRcYBbeJLZpXzlTNnZ2FrbxltLTsvqunsvy9EFvxrbPvdgq98FSug4M9JN+qyUZU8sDaEZtBDgHE0JGL/x4/ydV23utz5acrsaXLc=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.18 v2 2/2] x86: Clarify that only 5 hypercall
 parameters are supported
Thread-Topic: [PATCH for-4.18 v2 2/2] x86: Clarify that only 5 hypercall
 parameters are supported
Thread-Index: AQHZ+IaJFU7NfyVjOkmfZ+oclxtwaLA9cQeA
Date: Fri, 6 Oct 2023 23:58:55 +0000
Message-ID: <E381997A-820F-4041-A528-E906843E9811@arm.com>
References: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
 <20231006185402.1098400-3-andrew.cooper3@citrix.com>
In-Reply-To: <20231006185402.1098400-3-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6032:EE_|AM7EUR03FT062:EE_|DU0PR08MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: c12243d9-1bbf-4230-288e-08dbc6c83860
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uUr3p4NyPIeqEDblPOV6Yi4WU9yJAdNdBjWgyZ9EUv5PKyf4KWzpLdv4gn7Y9Wr0ocrCa03qeseEkrnj8qviSPy16rUV1Jytu8dCFLoqGD/cHuLlhXhBncINFsANiECwJI2dHvQSnH3vnTju3CH+FkGUvzQgydGYRSa/iumA/Fu4H7GyQWaLuz4jhQwhFPLC0J+Oa4YTMp++iaK9FBctASpRdHbBvzqJF+zEN1GW/EuFgB2Yf7bFalFC/xnQyZOLZkgbL4VhJ96C3xYYaWhmYuxVQ1pu2hhvCJmFnj2AlTi6GOl+FoJhJLIVaMncWzHixzixlaLE8wlPXwRRDIh4vhDtMSrF5J8hy6eF3OsJCiHNuLOs3gPqVKv8UAxVNPc39A19kYFSQZdxtlHl0ToXSg+T5iVDLOuBeUqGzRo0el1ohXHukJLUAw9uTldu7rTxB1ZamfjSr6LgJ7wsC6ne+DVkejx6GgFKOiQK7Wn0X6lf64Fojr8vg+46Z8h6cVh6PYvGijTTMXeXiI4RTNK2JN7laIV65DdHF0P74NWWDWvKSRbmcNZDz2UmBA3Li1Kzug+nUQ1rGxGwDM/XdCBcK2taLpAMNzNUbt2Qhu429WU/UYGWRsO3QV5N1PivkOvVD3L5S197yt2LTaKynogOhQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(8936002)(4326008)(86362001)(8676002)(83380400001)(33656002)(2906002)(41300700001)(54906003)(64756008)(316002)(66476007)(6916009)(66446008)(66556008)(91956017)(26005)(36756003)(6512007)(66946007)(76116006)(53546011)(6486002)(6506007)(122000001)(478600001)(38100700002)(38070700005)(2616005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A3FF03DC0B61C4B8E7E6AC6B16B1E6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eea55666-f453-4de0-a4c9-08dbc6c8332e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0vgidJbzd02vMAe1l9ZiWNb/xZ31XrpXZnqhUYieVDUMSAIZvm9LiEoPMjFYZvmq6zTWOH281NCOiB8pTuVa+CldTpUvOSGybaa1kzMvX8fUHZT/GoCRxoPVLRzvx9mmmYXWsSaoWBnmOqylSA+gnUWYLiYKWS4fFhu9dcjR9cgpkJwWaT1i/rD0GI8O0A0NOTUx4xWES5wq7rmmXFHTWkmBjzS2WjkrHl9AI53txFrnGWRd8eUz/uPoILb9ln1aikNupNHZPwrpZ0cotKQLE0QVNguF5k4jkKhVGbLKHHpmDgi1HSkqC8O1nPtN+Wor+bkJsJ+QKsxVAp4XxeD2wBAQR6JkmhMsDZ54zSltaZZOhnJ8pPdcObQFfJL6na0uW/cYBA2IKN8Trw9JmX6U2MBSgAVzFUoSwd7MS/Gu1qoA7n3LRnj4L+zLb8O7A9f+2VB98sWiepX5KtlflSoqMoYJrmWwIDwAOAbcA/MUVgPGY5rGt/g6CR9R5BVTnSycF7yferpKn3yWR4c+nGACWJyPXfXqLHMp1KfmgW28hglGlQtH3TzgijqPOw/b5ya9FsElaxNnxAdeQWiuU0tlvp6nhaJA1L1hJB7RgXq/CXLfaC7AiElHO3jNCj/WgqG8eorvGGOTd3aXdjEpEhTNv47KgI+oT3Wxo2GOURolKEevFt0CyZEpJREpYSZBnfeb+TVVScSYQC77sjh5nCofNRrXEEhDk4GIr8DHaNfDpGD00loL91mrGvxmA3FFS0Lt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(47076005)(36860700001)(40460700003)(6512007)(478600001)(70206006)(70586007)(54906003)(316002)(6506007)(53546011)(81166007)(82740400003)(356005)(6486002)(2616005)(5660300002)(26005)(41300700001)(4326008)(6862004)(8676002)(8936002)(36756003)(40480700001)(86362001)(336012)(2906002)(83380400001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 23:59:04.3704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12243d9-1bbf-4230-288e-08dbc6c83860
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8953

Hi,

> On Oct 7, 2023, at 02:54, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> The x86 hypercall ABI really used to have 6-argument hypercalls.  V4V, th=
e
> downstream predecessor to Argo did take 6th args.
>=20
> However, the 6th arg being %ebp in the 32bit ABI makes it unusable in
> practice, because that's the frame pointer in builds with frame pointers
> enabled.  Therefore Argo was altered to being a 5-arg hypercall when it w=
as
> upstreamed.
>=20
> c/s 2f531c122e95 ("x86: limit number of hypercall parameters to 5") remov=
ed
> the ability for hypercalls to take 6 arguments.
>=20
> Update the documentation to match reality.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> v2:
> * Extend with the historical context of how 6-arg hypercalls have come an=
d gone.
> ---
> docs/guest-guide/x86/hypercall-abi.rst   | 15 +++++++++++----
> xen/include/public/arch-x86/xen-x86_32.h |  2 +-
> xen/include/public/arch-x86/xen-x86_64.h |  2 +-
> 3 files changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x8=
6/hypercall-abi.rst
> index 42a820386b68..c7a11a76712f 100644
> --- a/docs/guest-guide/x86/hypercall-abi.rst
> +++ b/docs/guest-guide/x86/hypercall-abi.rst
> @@ -4,7 +4,7 @@ Hypercall ABI
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Hypercalls are system calls to Xen.  Two modes of guest operation are
> -supported, and up to 6 individual parameters are supported.
> +supported, and up to 5 individual parameters are supported.
>=20
> Hypercalls may only be issued by kernel-level software [#kern]_.
>=20
> @@ -18,17 +18,17 @@ The registers used for hypercalls depends on the oper=
ating mode of the guest.
>=20
>    * - ABI
>      - Hypercall Index
> -     - Parameters (1 - 6)
> +     - Parameters (1 - 5) [#params]_
>      - Result
>=20
>    * - 64bit
>      - RAX
> -     - RDI RSI RDX R10 R8 R9
> +     - RDI RSI RDX R10 R8
>      - RAX
>=20
>    * - 32bit
>      - EAX
> -     - EBX ECX EDX ESI EDI EBP
> +     - EBX ECX EDX ESI EDI
>      - EAX
>=20
> 32 and 64bit PV guests have an ABI fixed by their guest type.  The ABI fo=
r an
> @@ -119,6 +119,13 @@ means.
> .. [#kern] For HVM guests, ``HVMOP_guest_request_vm_event`` may be config=
ured
>    to be usable from userspace, but this behaviour is not default.
>=20
> +.. [#params] Xen's ABI used to declare support for 6 hypercall arguments=
,
> +   using ``r9`` and ``ebp``.  However, such an ABI clobbers the frame po=
inter
> +   in the 32bit code and does interact nicely with guest-side debugging.=
  The
> +   predecessor to ``HYPERCALL_argo_op`` was a 6-argument hypercall, but =
the
> +   ABI was intentionally altered when Argo was upstreamed (Xen 4.13) to =
be the
> +   5-argument hypercall it now is.
> +
> .. [#mode] While it is possible to use compatibility mode segments in a 6=
4bit
>    kernel, hypercalls issues from such a mode will be interpreted with th=
e
>    32bit ABI.  Such a setup is not expected in production scenarios.
> diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/publi=
c/arch-x86/xen-x86_32.h
> index 139438e83534..9e3bf06b121e 100644
> --- a/xen/include/public/arch-x86/xen-x86_32.h
> +++ b/xen/include/public/arch-x86/xen-x86_32.h
> @@ -12,7 +12,7 @@
>=20
> /*
>  * Hypercall interface:
> - *  Input:  %ebx, %ecx, %edx, %esi, %edi, %ebp (arguments 1-6)
> + *  Input:  %ebx, %ecx, %edx, %esi, %edi (arguments 1-5)
>  *  Output: %eax
>  * Access is via hypercall page (set up by guest loader or via a Xen MSR)=
:
>  *  call hypercall_page + hypercall-number * 32
> diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/publi=
c/arch-x86/xen-x86_64.h
> index 5d9035ed2230..43f6e3d22001 100644
> --- a/xen/include/public/arch-x86/xen-x86_64.h
> +++ b/xen/include/public/arch-x86/xen-x86_64.h
> @@ -12,7 +12,7 @@
>=20
> /*
>  * Hypercall interface:
> - *  Input:  %rdi, %rsi, %rdx, %r10, %r8, %r9 (arguments 1-6)
> + *  Input:  %rdi, %rsi, %rdx, %r10, %r8 (arguments 1-5)
>  *  Output: %rax
>  * Access is via hypercall page (set up by guest loader or via a Xen MSR)=
:
>  *  call hypercall_page + hypercall-number * 32
> --=20
> 2.30.2
>=20


