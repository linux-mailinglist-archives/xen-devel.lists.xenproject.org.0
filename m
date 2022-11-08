Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76D620B49
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 09:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439785.693833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osK4K-0004tH-SS; Tue, 08 Nov 2022 08:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439785.693833; Tue, 08 Nov 2022 08:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osK4K-0004rV-PL; Tue, 08 Nov 2022 08:34:52 +0000
Received: by outflank-mailman (input) for mailman id 439785;
 Tue, 08 Nov 2022 08:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuAS=3I=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1osK4I-0004rP-TO
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 08:34:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2055.outbound.protection.outlook.com [40.107.249.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34a716c9-5f40-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 09:34:48 +0100 (CET)
Received: from DU2PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:10:232::30)
 by GV2PR08MB8343.eurprd08.prod.outlook.com (2603:10a6:150:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 08:34:40 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::aa) by DU2PR04CA0085.outlook.office365.com
 (2603:10a6:10:232::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Tue, 8 Nov 2022 08:34:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 08:34:39 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 08 Nov 2022 08:34:39 +0000
Received: from de6c6cfc7ded.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BC275EC-9BD6-4C8B-AB0A-E25C038B9DC1.1; 
 Tue, 08 Nov 2022 08:34:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de6c6cfc7ded.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 08:34:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 08:34:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 08:34:29 +0000
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
X-Inumbo-ID: 34a716c9-5f40-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K5F0n2Mjfn5uXuJr1vf2moSf/v1ruI2ChXjKvlpwrkmMbU/ApwvXyldMk0HYUi/je+YMOZ4T9UcZHFv8CI2x4Ku5y7S2mDugHBd8BhqSKKbmPTKq5jfJLIoclN3U378U/btWtgfGfYUAlFL0/B6v2uMia7Vgxx1jPTqz0RLM/MFCDHnJeVROGTjdpQKxOtd2KTFngMYFavaFV3ztprXxXIxJAVRcDEy9+7RPJ9xgMVvv5oV/TDl4UUQV/nVsb8vdKO58ZhQIPCmoIWmNNpwFYFtaUzPxBls7bVeNx0VLIJP8VNMMFbp6PynvQS6PBgzcd9kI4OKSQuZ3H/1HFHUKdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edb/qCESl1R4sa/bekmFJaJNEnidd1Ae86NxrarcaeQ=;
 b=Jh079lqkdA6W/9aMPkNi8nxcp/si6dGLZUcdiwggHxyeVDUdanzBIDby2SJ05WdXIp5tMKmYUz82IdD9C4M70mEc2i1zgvMDTzpdRRJsaHzG3ZjIZzbpfMOb02sB7bpGfLJuq78x5RrmW2s61Em1UuVmN/UFR954bhyvuRj5BJCv/5zaeAA/1ga+hBVKQIrPqO+aL6GWFpBz78sLR0QXF28Hs9rFH65DqG+Si1aeZ5d5cEtg5TBV7at/jox0QCUaPLb4rC+nyRc9xb0KVeMVaZP3kUvQxg/FJ8yn1jt96JnFic/eIAKGaSLiX0EVF1OQUlHmmJF7HbFjQQ4CzaanAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edb/qCESl1R4sa/bekmFJaJNEnidd1Ae86NxrarcaeQ=;
 b=lKsUBoY7NW6d/R3wWHo6+babmPxs0B0T8kaefHOxUvB7+AKCKt0VcN+yL6PS6auarqvWUOn/JnmyHBIvdiffIEBBzxSgu+iU2uTsnIqjg9WCpatwJLxycRcb+FmF9vwOVOETkpdBG0TVjLlQwbuwDwmPkVH6Aj0LshLhBSw2QUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf002ca647b8eb94
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kykkVXG/oQqLcgwrjeta29GIBmOs4Um06Ll87EjZZ552NyjZoI9t7az44F/DD7w4lQugG4QCvrM6+CBfL/BIzPqX9dKJplyUlbgXxzbIR121A/KgKtApgTzF/TcIIezhKLUviIB3VfcsFRCoESs29qFXcgnuEuusx+Ie37aetwhINR+pntqSJW+omHodVDnbsdndJGMUMjyVw3nXq8A+I7Jrdeo7lKwiaZDXj33AiWwYq/k5Ccx3XynlHv+6TBunXHLTs/uhnz2yXNXiEmdwkVcJg4iFdPdkWY/9dUCmjhV86XoNDOdJxOH1lyM6JXzhHS+I/dln44TTgekmXcdsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edb/qCESl1R4sa/bekmFJaJNEnidd1Ae86NxrarcaeQ=;
 b=k5O46xYoTwvqioqjFA4ua3x245CXoqL1vdPQJKhDI/th1oJDkl9o8fYMHAgfehNJm8XexI6yl3jYosf/Tv1l1/QZ+gayOsrS66mPn/QSdQgnjx4o9cSf4/1AuYwX27nFkr28+KxZX2lu+nU83qPKifLZpVJIsAq2nEkGkWjmDFTWOkkj9e/KtaUvwwBrE/mCyJYFCNADlA08QwooBAMmXtwfuzIyr0CjVB7VUaes6+N349Wv7Jxub4cAXgCOGTioRNCdH1ssdHEmLSUJNwfY1TOAkKDmY+ZaKll75UwuLjBSPsgn9XsDSa9FMgBFMVmixe2qcopqmyp0HjSYW4ctPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edb/qCESl1R4sa/bekmFJaJNEnidd1Ae86NxrarcaeQ=;
 b=lKsUBoY7NW6d/R3wWHo6+babmPxs0B0T8kaefHOxUvB7+AKCKt0VcN+yL6PS6auarqvWUOn/JnmyHBIvdiffIEBBzxSgu+iU2uTsnIqjg9WCpatwJLxycRcb+FmF9vwOVOETkpdBG0TVjLlQwbuwDwmPkVH6Aj0LshLhBSw2QUc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, Ayan
 Kumar Halder <ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Thread-Topic: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Thread-Index:
 AQHY8Gnh8hKxIKIkAUWHK4BT2/fYBK4yMOUAgAEXv4CAAAJqAIAAItoAgABYlgCAAN9xgIAAExEA
Date: Tue, 8 Nov 2022 08:34:29 +0000
Message-ID: <211D65B7-2CCD-4BDD-A9A3-FF4DF9D562AC@arm.com>
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
 <062c9507-7744-0742-effb-76d2f1222a27@xen.org>
 <33a2d125-b7f2-3637-9dab-6b7d616fd4ff@amd.com>
 <b17653b6-e4e7-8f5b-647e-37f2d71f9a3a@xen.org>
 <36e84512-9b44-303e-2834-5aafe9c6cc15@amd.com>
 <74b1c6af-d6de-2728-9d59-2d561a521793@xen.org>
 <3720a691-3303-a673-58b6-95da9a4341d2@amd.com>
In-Reply-To: <3720a691-3303-a673-58b6-95da9a4341d2@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB6127:EE_|DBAEUR03FT006:EE_|GV2PR08MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abb1e32-3793-4db2-3723-08dac1641384
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3ZyRZtgrbR8S7GQ6wDNDEEOYsBV2NdwTdH0tXudjr/2Md+JqhYAbl0eDEZ3pibARriun+uIlXsjQQiM7Gs8N+XhVfFpDwKze4ELdP6LSIwfiMOn40NVdz54Tjz8Wy7jhgQfwtqMRcXw4GMSxIh5H/9o/JlFQHTt/elFUSb64y1qs8e+k9XS0qnSwJP+lsEgYB+NpxkZfWvEF10/JQAODYzhcQ+R83Laa+0SggcTVOIjZs318NsxsVLVacOdGFfa8u/FmN8VwfmPYDOrFM9AFzoZqga4aG1WeYxeUh1j8ZXZQpNxBw9nG5qjlNAdG5ZtL9m8Spv2eD4updfnQaXsrkYRbXg3bc+gObp36Nq7T9dbcb7wT65r/b3ukOmTKVmg1W5mxfBuIpDsOVl/8TQluedRic/mffr9UPsKFzCkKiX0pH7OyhNMjsB969DLh4g6vyBqNmM9juZYcBcx3xAiOXUjLC8/0yUMnf1WqVO8McYVmIJrU9lIeJ1L5vcT3WsPi9tcAB9l/fG0GhiVaW80NuP6I/q5oU3DmNAxPS6IQJwhec1iI/5gxEBhTkiviyrx2ZX+n4L8aFBbi99HBu2B3yshyPUNBw6eHiBD9n+RUoUHHQjT6hKlLZ5z7amv286tE+UlJ5hUfMQ43KPOsrouJyUTWaCfTpcVnwmhT54caBRFCcOp7ISgMOSrYedG7srKUOd5bPkdjso2/I59kA/Ax7k8Aedk3N3Zm4XmTWb/4E9zpxTpBS0BD27dFpAnCKG2tiPHOjgzGSsQzjolD8Zs2gwmLOt0XbwmagoAhQeWFBJ0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199015)(71200400001)(478600001)(6486002)(316002)(2906002)(8936002)(186003)(2616005)(54906003)(86362001)(53546011)(6916009)(26005)(36756003)(6512007)(33656002)(6506007)(38100700002)(4326008)(41300700001)(38070700005)(8676002)(83380400001)(76116006)(5660300002)(66556008)(66446008)(122000001)(64756008)(91956017)(66946007)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FDE93ECAA2A97B428F205A9A35EE6D51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	592f962d-182f-4392-7909-08dac1640d79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fR/n4Ir60+ETZcJptjPBE5lDqRTcoWbmNVqfryEoxosJbPAqQdn41YwssD+Lyst9pxU/bCrAF+qYB5bJw0JQ2bVH8XoZRY4/mBE9TTkUMCPFobEl5uvPXhUuApZSAtRL/XyCvtcMX278lSTar2UZIewvmVhOtE/DJua+NHnKWSHdTpKsULahImpTdrtzZc3GkEJP2UieZa4Z4lPxpwb1ImfdsYp8yvyLiQYG/0AXyQWrRKxLwYZYHebfpwz7XRfrH5Ok9gyW2Xq4ChTVW6cPAp8pFgaYYHeGhcRptbHUZb/stvsWIFkSpQpasZDkPq43YXA2Yxf1MNe7C0JZUKi7GxtJIHfGyk44xgu0xIRjEvY0pnx6YA7kW+h6TOiBlnjyFWmwBtlU4qtkyZGQsn/1KC9b3ip11bmE4lofQ41nj8pp38/nJ/qc94dr6/bx2NHhnQdaDa2zNddMKFHDizMVaqgrZR5A6w+N8WtHiXpsPmTME9d0bXvgyl4HVnEDYcpWfz2RhqRB8p0VpE0Wf6zu7WG/dnU/fgNk6fvtKfcvY7AeIGUdT6DcI/WuonlqtcbXYLYvCmPNSVjLxFDAUXAdx7UfRWLHh66u3qkk/PeRlBK6NC10HNFVLoB7bgNq8JkKhedx4K5XtYMjcBFDhvH0o42ZxfhnM4kHJdrO2t9gS3b+WQlc1l0NjI4+pGuhv1SAgjOL07V5ZiWsutnUmbyHPgBCgEn2KHfBrf0ItV9S7mITjEnkO0jYEzJjDWsXVJKT6mayvXe5kx6p8wy2HJt4wA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(478600001)(8936002)(6486002)(36756003)(5660300002)(4326008)(356005)(2906002)(316002)(70206006)(81166007)(8676002)(6862004)(54906003)(83380400001)(33656002)(36860700001)(41300700001)(6506007)(107886003)(86362001)(82740400003)(70586007)(53546011)(186003)(47076005)(336012)(40460700003)(26005)(6512007)(2616005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 08:34:39.4668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abb1e32-3793-4db2-3723-08dac1641384
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8343

Hi,

> On 8 Nov 2022, at 07:26, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Julien,
>=20
> On 07/11/2022 19:06, Julien Grall wrote:
>>=20
>>=20
>> Hi Ayan,
>>=20
>> On 07/11/2022 12:49, Ayan Kumar Halder wrote:
>>>=20
>>> On 07/11/2022 10:44, Julien Grall wrote:
>>>> Hi Ayan,
>>> Hi Julien,
>>>>=20
>>>> On 07/11/2022 10:36, Ayan Kumar Halder wrote:
>>>>>=20
>>>>> On 06/11/2022 17:54, Julien Grall wrote:
>>>>>> Hi Ayan,
>>>>>=20
>>>>> Hi Julien,
>>>>>=20
>>>>> I need some clarification.
>>>>>=20
>>>>>>=20
>>>>>> To me the title and the explaination below suggests...
>>>>>>=20
>>>>>> On 04/11/2022 16:23, Ayan Kumar Halder wrote:
>>>>>>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>>>>>>=20
>>>>>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>>>>>> "Requirements for single-copy atomicity
>>>>>>>=20
>>>>>>> - A read that is generated by a load instruction that loads a singl=
e
>>>>>>> general-purpose register and is aligned to the size of the read in =
the
>>>>>>> instruction is single-copy atomic.
>>>>>>>=20
>>>>>>> -A write that is generated by a store instruction that stores a sin=
gle
>>>>>>> general-purpose register and is aligned to the size of the write in
>>>>>>> the
>>>>>>> instruction is single-copy atomic"
>>>>>>>=20
>>>>>>> On AArch32, the alignment check is enabled at boot time by setting
>>>>>>> HSCTLR.A bit.
>>>>>>> ("HSCTLR, Hyp System Control Register").
>>>>>>> However in AArch64, alignment check is not enabled at boot time.
>>>>>>=20
>>>>>> ... you want to enable the alignment check on AArch64 always.
>>>>>=20
>>>>> I want to enable alignment check *only* for atomic access.
>>>>>=20
>>>>> May be I should remove this line --> "However in AArch64, alignment
>>>>> check is not enabled at boot time.".
>>>>>=20
>>>>>> However, this is not possible to do because memcpy() is using
>>>>>> unaligned access.
>>>>> This is a non atomic access. So the commit does not apply here.
>>>>=20
>>>> Right, but your commit message refers to the alignment check on arm32.
>>>> You wrote too much for someone to wonder but not enough to explain why
>>>> we can't enable the alignment check on arm64.
>>>>=20
>>>>>>=20
>>>>>> I think the commit message/title should clarify that the check is
>>>>>> *only* done during debug build. IOW, there are no enforcement in
>>>>>> producation build.
>>>>>=20
>>>>> AFAICS read_atomic()/write_atomic() is enabled during non debug
>>>>> builds (ie CONFIG_DEBUG=3Dn) as well.
>>>>=20
>>>> My point was that ASSERT() is a NOP in production build. So you
>>>> effectively the enforcement happens only in debug build.
>>>>=20
>>>> IOW, unless you test exhaustively with a debug build, you may never
>>>> notice that the access was not atomic.
>>>=20
>>> This makes sense.
>>>=20
>>> Does the following commit message look better ?
>>>=20
>>> xen/Arm: Enforce alignment check for atomic read/write
>>=20
>> title:
>>=20
>> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
>>=20
>>>=20
>>> Refer ARM DDI 0487I.a ID081822, B2.2.1
>>> "Requirements for single-copy atomicity
>>>=20
>>> - A read that is generated by a load instruction that loads a single
>>> general-purpose register and is aligned to the size of the read in the
>>> instruction is single-copy atomic.
>>>=20
>>> -A write that is generated by a store instruction that stores a single
>>> general-purpose register and is aligned to the size of the write in the
>>> instruction is single-copy atomic"
>>>=20
>>> Thus, one needs to check for alignment when performing atomic operation=
s.
>>> However, as ASSERT() are disabled in production builds, so one needs to
>>=20
>> This seems to be a bit out of context because you don't really explain
>> that ASSERT() would be used. Also...
>>=20
>>> run the debug builds to catch any unaligned access during atomic
>>> operations.
>>> Enforcing alignment checks during production build has quite a high
>>> overhead.
>>>=20
>>> On AArch32, the alignment check is enabled at boot time by setting
>>> HSCTLR.A bit.
>>> ("HSCTLR, Hyp System Control Register").
>>> However, on AArch64, memcpy()/memset() may be used on 64bit unaligned
>>> addresses.
>>> Thus, one does not wish to enable alignment check at boot time.
>>=20
>> ... to me this paragraph should be first because this explained why we
>> can't check in production. So how about the following commit message:
>>=20
>> "
>> xen/arm: Enforce alignment check in debug build for {read, write}_atomic
>>=20
>> Xen provides helper to atomically read/write memory (see {read,
>> write}_atomic()). Those helpers can only work if the address is aligned
>> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
>>=20
>> On Arm32, the alignment is already enforced by the processor because
>> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
>> this bit is not set because memcpy()/memset() can use unaligned access
>> for performance reason (the implementation is taken from the Cortex
>> library).
>>=20
>> To avoid any overhead in production build, the alignment will only be
>> checked using an ASSERT. Note that it might be possible to do it in
>> production build using the acquire/exclusive version of load/store. But
>> this is left to a follow-up (if wanted).
>> "
> This reads very well.
>=20
>>=20
>> While trying to find a justification for the debug version. I was
>> wondering whether we could actually use the acquire or exclusive
>> version. I am not entirely sure about the overhead.
>>=20
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>> I think I can keep R-b as there is no code change ?
>>=20
>> My signed-off-by will need to be added for the commit message I proposed
>> above. So I would like Bertrand/Michal to confirm they are happy with it
>> (I don't usually add my reviewed-by/acked-by for patch where my
>> signed-off-by is added).
>>=20
> You can keep my Rb and Bertrand or Stefano can ack it, so that we can avo=
id
> acking a patch by one of the authors.

I will check and ack the v3 once out.

Cheers
Bertrand

>=20
>> Cheers,
>>=20
>> --
>> Julien Grall
>=20
> ~Michal


