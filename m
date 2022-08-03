Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA16588C71
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379916.613807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDsV-0006H6-MH; Wed, 03 Aug 2022 12:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379916.613807; Wed, 03 Aug 2022 12:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDsV-0006F9-JV; Wed, 03 Aug 2022 12:53:35 +0000
Received: by outflank-mailman (input) for mailman id 379916;
 Wed, 03 Aug 2022 12:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJDsU-0006F3-21
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:53:34 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00079.outbound.protection.outlook.com [40.107.0.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47a6f831-132b-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 14:53:32 +0200 (CEST)
Received: from AS8P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::10)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 12:53:30 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::70) by AS8P251CA0005.outlook.office365.com
 (2603:10a6:20b:2f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 12:53:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 12:53:30 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 03 Aug 2022 12:53:29 +0000
Received: from 61f8965c087d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 933F515E-A2E8-42BA-A4DC-39863B38FC77.1; 
 Wed, 03 Aug 2022 12:53:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61f8965c087d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 12:53:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0802MB2410.eurprd08.prod.outlook.com (2603:10a6:3:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 12:53:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 12:53:20 +0000
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
X-Inumbo-ID: 47a6f831-132b-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ngeNuAgFpVPcvjy0dLbAvbxTOsKGQkxiX1aYoQJuFOJvjS4wKebRcpoITXDEj09YaalF+r6G94NXhrezBBiKdDDR1VZJ5Re7PEaz5Y+bLfPSsyzjUnUZXvwzyPnD/TWyZ5TFBbekBssB6ZGfXEbWclRgN7jBQhfCyHRq/zJQ/N1b4hW0GM5olFOU4oOXGvbhuNxk21FBUyoEYsoU+n3RRJO1znEOjmQzLzR2S3TNA6XlIfA9e76+mze+uJML+e+MT2WdYViA1JVdEb7eM85shMJUx6hz/EfewqV5AtWlbFq0ZUl/RcsB7WBBtNoZM2Gpx4GF43HWvLrrmJj3OgiMpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9lS/Oj8WUCXYUYnObHvqYZjMhQQ9GgrUJYvmekS7VQ=;
 b=cKXy7QLP6Tjhtn42C5TN2pdgBv0KJGethnDRTRn59nIl96WfI4Zx3rcrJyBpOuS1mpWnQ0/vnmMp7MbneT/Pexa+2B7zviz/08GJfEIU4NkYCg1QA1g2sLFmHXcdvocm3HqzU0ewTtSbP63SMFSfuAv/MxXPsjzdHI4l0eADt+8Nz/sNNB7s5JcWhcCXJUYUEnl9u+fUPbeLctuaexPPIk8e7vXEeoesiwB5BbqOOoM5p8aU5QGdaqgrbbtlpxYdJRWNZrmCenIbpgyVQQrreDYPy/uZCntUdxjftLVrBHgjT9daWDN/LY54l1OB/zJtCBBXshwhtzMqo2emh1CXeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9lS/Oj8WUCXYUYnObHvqYZjMhQQ9GgrUJYvmekS7VQ=;
 b=bmf2GZX44D/VVo8Sct71I+ScdWLeN2Rd0zOdREhPbK2Vw/xD+jO/cNUxhMhgGNaxhROBHnvGhpyXhXkcfntuO+AXy+/Gw6K/Xg8Z1MNurq2T1/FhXhWxDAm+UtuparR4QmK+y6Hbgpmt8FL7/JZw4+qQdPknitQ90OvXpRI6ltE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0f667329e234f38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm5+pHPtRxSlBPNB5HNIkG19jmix4xfXZPx8iEbeOJtildkv8WgqFnixNeObGrk/PbYpXvXovnoNmUOksv/EmPonbMzD0DYI3EzzkPEIaKc5zkwSDiajKF/wbpC6kTHMFjKc5OhhJBz8LJRV7vMOrLM8VJT7X80ap6VfbPqjquzWQPNx2PhumXCylqG/MnCdUPDIKpJA4IHU6hEvdnkRAhCZs/yRi7IKCyKhM2mFBu9cEPLnTgxqx+9pwqXnz7lUKMGqCp1jlY54euLqH3e/SuMPXiaoRmJ2SPhqXb0Rr9mXs1BtM+yCpIsPtSyVAgnJMjXPwVxpsKLCvb7ZwsA8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9lS/Oj8WUCXYUYnObHvqYZjMhQQ9GgrUJYvmekS7VQ=;
 b=j/DO8Lx9B94pivTlwHb1ZXsEMZjNfyyG7db6luGkq/D2YfCObqquPwLaBA7yd5tpxwOzAZG6QPVHtjjmNKf9vVj2Dnv+1c40LZJ/GYZAZWHEMlQjObfxgAOOBamUWnd1DfA1/X7c01l4R1ZPPW8zGlXTTftZlNURpyErMBCj7R5lv8uObaNiTjvOiX9QddxQ8lj8A4zcG8nxZiGpvGY7bxDF1WLsCf9y6+hnuA5qwBl6mVjBSWewBJgXt/uNen62RTmaj2WC5Sm1MK3uTHF21ZS0Lm9ygJBIotMTMEW44kZmDN66FNo2Ai3gaTw5oUHteA9/J+brrricnX/XG9vI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9lS/Oj8WUCXYUYnObHvqYZjMhQQ9GgrUJYvmekS7VQ=;
 b=bmf2GZX44D/VVo8Sct71I+ScdWLeN2Rd0zOdREhPbK2Vw/xD+jO/cNUxhMhgGNaxhROBHnvGhpyXhXkcfntuO+AXy+/Gw6K/Xg8Z1MNurq2T1/FhXhWxDAm+UtuparR4QmK+y6Hbgpmt8FL7/JZw4+qQdPknitQ90OvXpRI6ltE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Topic: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Index: AQHYpzA5Sq+ptI31i02cWAL8jJ4SLa2dFF0AgAANRgA=
Date: Wed, 3 Aug 2022 12:53:20 +0000
Message-ID: <2F1BAE77-3129-438D-BF33-6AC39A0787B1@arm.com>
References:
 <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
In-Reply-To: <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa47ffda-4d3c-48ab-2c9a-08da754f2a71
x-ms-traffictypediagnostic:
	HE1PR0802MB2410:EE_|VE1EUR03FT015:EE_|AS8PR08MB6278:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CMjbQowyrZeM1F1acgnxmeOORax//ctSH8zpzr0s4F0JswVSjg9MI7p3zdjRYhfgoSjy6Vh/GRatMebXk0WdlvZWLQxATiNh0jluUpYUBDAQGzQgnwg33ALtipHJdAV21ayWSjECQwN5s/08frOnO75BoZP5DOCxpYFToz0nqyEyguIKTlrsoGmAklOoMzNS5BtOBC3+hw7LTzLFFL4gL5hKhkyOro3yo7qaKF6dySPjYciKLuZcMmizFp4frchrigMXEMuh/+52rOLOtvVJUetJKsUj9wgVK9baZ1MXS6h3dqrg3o2Sr6JkiJeR1eDtzL2U0iS+aWDBUVyoF8mdHWjhW0GePTOcasxl5qHlO7H2W15A5uGnnY02oOLU3wpUFct7wfhfz186hO4YTr5UcNgTxQTN0c8FaEOm9L7F60f4dpiXXjeY/rb71fRI7ItwanZ12Ol2/5vAh5NASkv0qJhsO/cbpgl4Kk9BidUVmKTOeuuBtQEud7OC4VwO7e75QVUK8oCoBU22KefHLNFYpNsR8pvXSrY+3unxd36b+n3GDc6j8Xes6oc+2/pqQPW8vqhBlnZZEmMmX/rG9vZBQ1M3+DaTUECivcQBvIQKOHRdxnnCJbVOFHcoF8J1lNfeA7KUiKby6Wjx4WYjH8qURgc1ecKucldRfu8y1bqp0vEPHiA7P3NMGjfr7Q2fQ1CkR8ZxAbX7lmvmNOvjRelEbe8A2zB6zggS/YL1mzLV1lVqGGz0LVfC9shqZaRP4wQACgKFZz1vdI7QnQzBXJovGenMnvocbZHSc5yHKm6HEWuyYm099eZc9PxNNtbliNMNF4Le2XtLFJJX3IP6GB7aEQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(33656002)(53546011)(6506007)(38100700002)(6512007)(4744005)(76116006)(38070700005)(71200400001)(5660300002)(66556008)(8936002)(66476007)(66446008)(41300700001)(316002)(66946007)(54906003)(4326008)(122000001)(8676002)(2906002)(186003)(64756008)(6916009)(91956017)(36756003)(2616005)(478600001)(26005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E25036295443A44CB4A74D48A2FFEF2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73ad93a2-9fed-4161-b651-08da754f24c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CibKXqL6Y9rp9aey2BYMbdLYX8K9thQLI08W68SyAtI0fIDZ5rV8Dbcojz47llMjuSUgB3Vwk87ilPA6O4gZ2ZNFOA5v/WO+yoiXSPgLyuy9MZ65ORZZ7PvB81jMwjHhSI9WLbjNrInFZ/KgRrwneva5znH2xM/a8mEMY7VLUQTBcftTYKS05xdKt2QWWZMQR2Ug2knoCu+PZfWxY9Ab6fVRZMFiqWRRTn4Z5iHbrxADvGWrYZtj0g602c8X+4pBTJjac+71W9klBRK7Mk+iea7c1kwnUcr/0KHhRVmNwboS79hFuK7OZyFr779jIfQmfwq6Lf6dZu/rgbC74XpCiw4kHguJ27XwP3UtHYD1hq1kGKUHlr5wKebBo9BVevKNkZscmK3tZyRlhfVFoeYDSly0dtOaopleYdzto82Y90q+PVz2QvPv+CMTl1cot0cXoF0TR99ZYQP+243j0wXb+zZCjNdmziM5osY8W0ZQqZdPlqx2WcbNZmmxME7X4uKefJOtVDyHkNgoNXwaL8r1czez3BOZV8zefsi0NkXtsloqCLNe2PdiPe7WSVEgrB/vVTVymUpzMyMAjSbd5vCsjdRVtDxeXWqEdhf8ZpTz4DLBfnuIm0pNBdQ1+XFcE6mmkvh+W/hxQn7Qx3lZ7zYbEb7CM4aFDGdffDJy7bOCqk9foogwmJScIVD5rBMUpMXWovwzocAPAmPrv6huwKiJJyT8NfpX7RB7QesFZY1qe0IuyHhnehDNhDKxN2SgXFJuYpnbWfCWtkYnRd8vd/paI2I5WOLx0nI6qSbeh+X6awlGZ2QLDHsMOaeLnZzH/N3C
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(40470700004)(36840700001)(46966006)(4744005)(82740400003)(40460700003)(33656002)(5660300002)(86362001)(6862004)(6486002)(70586007)(4326008)(70206006)(356005)(316002)(54906003)(40480700001)(81166007)(8936002)(26005)(36860700001)(6512007)(186003)(8676002)(47076005)(336012)(2616005)(53546011)(36756003)(82310400005)(2906002)(478600001)(41300700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:53:30.0022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa47ffda-4d3c-48ab-2c9a-08da754f2a71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278



> On 3 Aug 2022, at 13:05, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.08.2022 13:57, Bertrand Marquis wrote:
>> When calling python tools to convert misra documentation or merge
>> cppcheck xml files, use $(PYTHON).
>> While there fix misra document conversion script to be executable.
>>=20
>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
>=20
> Nit: These two titles would want expressing consistently. If I
> end up committing this, I'll try to remember to adjust.

Right I forgot the () here.
>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20

Thanks

> Jan


