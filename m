Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAA3623F86
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 11:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441579.695732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4W9-0007aU-Ij; Thu, 10 Nov 2022 10:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441579.695732; Thu, 10 Nov 2022 10:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4W9-0007YO-EQ; Thu, 10 Nov 2022 10:10:41 +0000
Received: by outflank-mailman (input) for mailman id 441579;
 Thu, 10 Nov 2022 10:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WK5U=3K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ot4W7-0007YI-Bz
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 10:10:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb09ec04-60df-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 11:10:37 +0100 (CET)
Received: from AS9PR06CA0307.eurprd06.prod.outlook.com (2603:10a6:20b:45b::32)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 10:10:31 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::23) by AS9PR06CA0307.outlook.office365.com
 (2603:10a6:20b:45b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Thu, 10 Nov 2022 10:10:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 10:10:30 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Thu, 10 Nov 2022 10:10:30 +0000
Received: from 0f9682feaf6e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECFC59EC-5601-476A-9B3C-357F0BC3EEF6.1; 
 Thu, 10 Nov 2022 10:10:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f9682feaf6e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 10:10:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8353.eurprd08.prod.outlook.com (2603:10a6:150:a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 10:10:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Thu, 10 Nov 2022
 10:10:22 +0000
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
X-Inumbo-ID: eb09ec04-60df-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FqYbxUxz5Yb9OuFUKQQm+F/RK5hzK1b40wjVbQIOeDLtmrqst3bwAlJWlBNiRI/WiSnZlx72gPKH08d3z1A0hrQ5cBlQRdsx48NQm/3RygYYmTLuE00hZyfG784JXLNl1gYnWL/Fg57CmsiRZi7c5CELNoPJTtLaTWW0NSAye5e6Uf+r7w2QnwIDYluhVaWHSdy8YQhdjw/XksjRWX3BaxS4PIlhgqjbYpOWs8Mo1+XFI8MEtWnhZRrcdL/u2IzjHueAlwQX4kuZNsOluW4X3PA5t7Eb/zYGpfzgnk+Y15UO6witBG3M3MwkKrKY5FJlz1PAL8Uq0Y6qnI409NCajQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNP/8xsd42Y4uzLEw+qfcaeD29WOF8ePPFDhgfwALIE=;
 b=LWBVsq+zSJLfrRUQYXGvRuCm/iAdXE6wCogtePakiBC0+EZVAlBS9/T8VVr8Gad431OkfyZ4wsqUHEwUtdihjzftivkF8aIXDnq5qOW4nsR8V3vCe/yHJQkTrF6ux86LmoZFJJ9ajk5PNspUF0YDHxnSdveTw5E5/Q4Ke69GRplbEh7PyKadQoI3AbVPX5R2rQGOO1ieZmjs0hEJ8x7t7Mz65iF50AIGClZaqnkXo7ZY1WmnihzE5yHGEML/oB+YErd0qwaeZvOJxQ9GthZsOuQa4CbC3STz5Tuh7mRdEHlQGhm05loKmInz7eILQQdfbwodZQSDHUW6lF07qfkuHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNP/8xsd42Y4uzLEw+qfcaeD29WOF8ePPFDhgfwALIE=;
 b=aSjffxzJ7YSryab/xHSzaKQxNLHio5DFJUhpi3ZjIh/z41hJ4WsSVu9w/wexqqH++IuxZaON+IFO1DDyOK2Czpg2NpkovhpK1LdsyKa/v6OPWa+ti5Oq/5r+1dS8BAqKJ4Ic10BZxiIV6HmSOFXMGObzfDd2fF5gM2viWTjudVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPfl0Vgq5GGw5Tv/mvlQ59pc7C9+qcgkkJt6+5PNGU4g4tuU6pot05trdZhfwboHoRsUbNuvanaXfqftiCXcnsamcASpEqwrT0AxbOw1ZuSEAJXuT98FXpFsnnJIQ3wyRTufziancYAilSf9/owty7xNvk5gVI3oyS0pIw3bkknMjPS2luNcGb1SBKvLnS06RTYyqgiTW0OnTuVJKsrcHzIsJy/tqS4+gPuAG+9+IppBoDWivqqk8aatIYBPIBzL3a0CD3gpMqObkY7RLDqJ5x22QteGmg4EgEemMPgFa8a+eE+GTHIKE9W5b5ndGeW/oSzo82bc8yXYI7x51JM0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNP/8xsd42Y4uzLEw+qfcaeD29WOF8ePPFDhgfwALIE=;
 b=QtYy6a8wBlTU3gdfpnGqNnKK46dS9QEwejC1bTNvA4X8r5BoVhitceApf/g+ebGG4VFnELl7bQxJECjCnrxGkwznh7zp6G0ba5RqU9gKkoe5Jy/K7EOH5N5rRs8jM1mINoFND64xrBjbEz2T/bZTVmI3LBQ256u8NdJrbxEGnLxxTCNLl6QvGTpQaHZtucs8qNbAEA4PCAV2O5k0lOd/nTuh7F5u5xnP8FisgrmOx4mmvBWoIwa4ujlVhQ7mXYvuaO7iuPLHE25JTNQWEEkY3FEEFexcltLxRF1Z7s2HWBMeaYsQ0ZwC9e/HVapDxQQIj5qBJDgO0V5xG8jjp2FNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNP/8xsd42Y4uzLEw+qfcaeD29WOF8ePPFDhgfwALIE=;
 b=aSjffxzJ7YSryab/xHSzaKQxNLHio5DFJUhpi3ZjIh/z41hJ4WsSVu9w/wexqqH++IuxZaON+IFO1DDyOK2Czpg2NpkovhpK1LdsyKa/v6OPWa+ti5Oq/5r+1dS8BAqKJ4Ic10BZxiIV6HmSOFXMGObzfDd2fF5gM2viWTjudVw=
From: Henry Wang <Henry.Wang@arm.com>
To: Christian Lindig <christian.lindig@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: RE: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index:
 AQHY84e5FV9zwZ/cMEqESsIC5Hbn0K41MEgAgACxXpCAAfedgIAACnbggAALiACAAAGC4A==
Date: Thu, 10 Nov 2022 10:10:22 +0000
Message-ID:
 <AS8PR08MB79912CC963CFB0B34B3A953192019@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <DF0BBACD-9D12-4B60-86F1-243A6018F8D4@citrix.com>
 <AS8PR08MB79919ABE0786424904E21A8392019@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5ED80DE2-1AE6-4C56-8C05-E83162EBE534@citrix.com>
In-Reply-To: <5ED80DE2-1AE6-4C56-8C05-E83162EBE534@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CE70FE9CA5E30342A78B968D84B773C2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8353:EE_|VI1EUR03FT017:EE_|AM7PR08MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbff7df-0710-412d-2b03-08dac303cc93
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a3eHN+tBmYSIS6XD3MZr01xtx6/5goKh9g/UaKdmSUSmh+tSq3mNUNuNWmQrrd+MVn+mSbFyjTgazaYcTja77N7I/cDkjSlMKAASVD/JlMFuQc77ueJsMDpO691zXOmmQ0d7fcOYf8s1GzKb79WCxzhNEQY2maYg9dupwOstAh/sC9v8oxxov4kx5gBBAz2Md9VagR1yg2D94jIILK54Og86829JW+NAYVZlG9aLQmp756DY/WDZJNVpEHtH/XBvarwDeV75Cd5HfT06I37MFhXPOrcT/Se9ZmEqXK9WugDLFB6nhCIMvK4dCy99nY7FMaQiUKn3adAXOlMwucra0k//L2s7JdTbZ0FPzbRIGzGvhoLtVpZRh/j8Qqd+aKbkGBGHmT4LtNiBIwJnEiV+W4JLlTriCOCFXwia4BYHa3lS4pxf/OrPzrtXabujfMqk4vjXTzejIRHz6YdDJcxMqEq5H6DfMiw+uwyewtF5YQ4ywVJUqkkaXKwC/YOuYTSWKZVlVFqWEwhHgey03+gBJZm9vJ9bdD1uOs3LxS8hPlfrtmzjLYH5U6TKDgsFtUxz0yE2r7TVtkQ0ILiZfnh6SVfYX8uMFNGFFok/Pa0sPvqOP/c1tGyMbDuzOkk0mZG3Ozz+2Bdt28yjPq2ctsoZx6vt4F9ngFv0hjNHe9+l53CvFdmNqz561SkOoCgpihLq19cqLWuDw73m963RS17AIWev+kjsQ6BLZgvJhzSpCynpNHwtrWcZTSXXHOaC0xHasnsOFYHAhMsWuFZ5/AjSYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(9686003)(53546011)(83380400001)(186003)(26005)(38100700002)(122000001)(66556008)(6506007)(5660300002)(2906002)(55016003)(7696005)(71200400001)(41300700001)(110136005)(54906003)(478600001)(4326008)(76116006)(52536014)(66946007)(316002)(66476007)(66446008)(64756008)(8676002)(8936002)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c62a52aa-cc7e-4ac5-8ca4-08dac303c73d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yMMMybz/HSwcKQoiLMvS3uxC/cY0Hh9jniT0Ge8Rp3kfcjdQ+aMS5NDi4S5xzmsZ38BwPHMzX9URKKy16VDHoK+zqtTIui1ukFnTEsijSVjNbxLNOotPH/O4sOfsW9W2IvuPDiMTpKXXcpw+YUucJPYuyM9AGdgvVIfZ0NMKM3AKxrFoV96wFEkrlAuAk1SP7vHrs8Bg2howsyzpF1hqJoZPTB+MaS8bpwsD48UmC8eQsKZueiL0lhvo6Lyw6Sax7cs3+bSHyPBCKHJPiiVRwQrXCLYx8kQpLcOBdWS772bQk2WR/x1xne16QLWCDMyI0k5jUiA/EMqs3dtjsiNRd5ee2pEMcRCQdUyYqFz2OAS8L77PN0/OAShnYO2BrSFZOTK2GZVfwy75+w1AWCt33mwTNWSp14G2psnZqrPZYqiMzmPGOLZ0ENAYwETuotLS7flKGM0nZhc6lo4k/PwzcwY7cvev4nU/jBNiF87SsXwUHhAtV+QvZSAfAqDCsC55USFvGAV551U7nZWOp3RGKmgx5tEGYaCPrZGvVEFfjAMbpluVy4xFOcWUbftGL5TQfXGKjnJJ6mpVmzhJO28KSz36KI4wYhVIAazIwoz0Wpegb6cXVEWj+yxx/Wgb17As+oghNp89sQSy5wDruUoBeL5c9LAFJCQDcPfK4D6WjpQG79ZpHKLhKFhgw0xa2c07lWoR8qbXILrPCEs7+TKMm0UMQ2QwdzomgTynVmROCzEudddj2T/O5laFMJAZo5zqVVdjOsAVcm4X8bsRfk2BdA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(9686003)(82310400005)(2906002)(86362001)(33656002)(356005)(40460700003)(82740400003)(81166007)(478600001)(107886003)(26005)(316002)(7696005)(53546011)(6506007)(70206006)(54906003)(4326008)(8676002)(110136005)(55016003)(40480700001)(8936002)(70586007)(5660300002)(36860700001)(41300700001)(186003)(336012)(47076005)(52536014)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 10:10:30.9767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbff7df-0710-412d-2b03-08dac303cc93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319

SGkgQ2hyaXN0aWFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENo
cmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBmb3ItNC4xNyB2MyAwNy8xNV0gQ09ESU5HX1NUWUxFKHRvb2xzL29jYW1sKTog
YWRkDQo+ICdtYWtlIGZvcm1hdCcgYW5kIHJlbW92ZSB0YWJzDQo+ID4gT24gMTAgTm92IDIwMjIs
IGF0IDA5OjI1LCBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gSGkgQ2hyaXN0aWFuLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4N
Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCBmb3ItNC4xNyB2MyAwNy8xNV0gQ09ESU5HX1NUWUxF
KHRvb2xzL29jYW1sKTogYWRkDQo+ID4+ICdtYWtlIGZvcm1hdCcgYW5kIHJlbW92ZSB0YWJzDQo+
ID4+Pj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBnb2FsIGFuZCBzdXBwb3J0LCB0aGlzIHNlZW1z
IHRvIGJlIGEgYml0IHRvbyBsYXRlDQo+ID4+Pj4gdG8gZG8gaXQgaW4gWGVuIDQuMTcgKHdlIGFy
ZSBvbmx5IGEgY291cGxlIG9mIHdlZWtzIGF3YXkpLiBBdCB0aGlzIHN0YWdlDQo+ID4+Pj4gb2Yg
dGhlIHJlbGVhc2Ugd2Ugc2hvdWxkIG9ubHkgZG8gYnVnIGZpeC4NCj4gPj4+Pg0KPiA+Pj4+IFRo
aXMgaXMgY2xlYXJseSBvbmx5IGEgY29tZXNtZXRpYyBjaGFuZ2UgYW5kIHRoZXJlIEkgd291bGQg
YXJndWUgdGhpcw0KPiA+Pj4+IHNob3VsZCBiZSBkZWZlcnJlZCB0byA0LjE4LiBUaGF0IHNhaWQg
dGhlIGxhc3QgY2FsbCBpcyBmcm9tIHRoZSBSTS4NCj4gPj4+DQo+ID4+PiBJIGFncmVlIHdpdGgg
eW91ciBwb2ludC4gSSB0aGluayBtYXliZSBkZWZlciB0aGUgcGF0Y2ggdG8gNC4xOCBpcyBiZXR0
ZXIsDQo+ID4+PiBnaXZlbiB0aGUgZGVlcCBmcmVlemUgc3RhdGUgd2UgYXJlIGN1cnJlbnRseSBp
bi4NCj4gPj4NCj4gPj4gSSBkaXNhZ3JlZS4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgY2hhbmdlIHRo
YXQgY2FuIGJlIHZlcmlmaWVkIHRvIG5vdCBhZGQNCj4gPj4gZnVuY3Rpb25hbCBjaGFuZ2VzLiBF
ZHZpbiBoYXMgZGVtb25zdHJhdGVkIHRoYXQgd3JvbmcgaW5kZW50YXRpb24gaGFzDQo+ID4+IG1p
c2xlYWQgcmV2aWV3ZXJzIGluIHRoZSBwYXN0IGFuZCBjYXVzZWQgYnVncy4gTm9ib2R5IGV4Y2Vw
dCBFZHZpbiBoYXMNCj4gPj4gY29udHJpYnV0ZWQgdG8gdGhlIGFmZmVjdGVkIGNvZGUgaW4geWVh
cnMgYW5kIHRodXMgaXQgaXMgbm90IGEgYnVyZGVuIG9uDQo+IHRoZQ0KPiA+PiBwcm9qZWN0IG91
dHNpZGUgdGhlIE9DYW1sIHBhcnQuIEkgc3VnZ2VzdCB0byBhY2NlcHQgdGhpcy4NCj4gPg0KPiA+
IEkgdW5kZXJzdGFuZCBwb2ludHMgZnJvbSB5b3UsIEVkd2luIGFuZCBKdWxpZW4sIGJ1dCBJIHRo
aW5rIGluIHRoZSBlYXJsaWVyDQo+ID4gZGlzY3Vzc2lvbiBpbiB0aGlzIHRocmVhZCwgSnVsaWVu
IGhhcyBwcm92aWRlZCBhbiBhcmd1bWVudCBbMV0gd2hpY2ggSSBkbw0KPiA+IHRoaW5rIGlzIGEg
dmFsaWQgcmVhc29uIHRvIGRlZmVyIHRoaXMgcGF0Y2ggYSBsaXR0bGUgYml0Lg0KPiA+DQo+ID4g
QnV0IHNpbmNlIHlvdSBhcmUgdGhlIG9ubHkgbWFpbnRhaW5lciBvZiB0aGUgT2NhbWwgY29kZSwg
c28gaWYgeW91IHN0cm9uZ2x5DQo+ID4gaW5zaXN0IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGluY2x1
ZGVkIGZvciB0aGUgcmVsZWFzZSBhbmQgdGhlcmUgd291bGQgbm90IGJlDQo+ID4gYW55IG1vcmUg
ZXhwbGljaXQgb2JqZWN0aW9ucyBmcm9tIG90aGVycyBpbiB0aGUgbmV4dCBjb3VwbGUgb2YgZGF5
cywgSSB0aGluayBJDQo+ID4gd2lsbCBwcm92aWRlIG15IHJlbGVhc2UtYWNrIGZvciB0aGUgcHVy
cG9zZSBvZiByZXNwZWN0aW5nIG9waW5pb25zIGZyb20gdGhlDQo+ID4gbWFpbnRhaW5lci4gSG9w
ZSB0aGlzIHNvbHV0aW9uIHNob3VsZCBiZSBhY2NlcHRhYmxlIHRvIHlvdS4NCj4gDQo+IFRoYW5r
cyBIZW5yeS4gSSB0aGluayB0aGUgYXJndW1lbnQgaGVyZSBpcyB0aGUgYmFsYW5jZSBiZXR3ZWVu
IG1haW50YWluaW5nDQo+IGEgcG9saWN5IGFnYWluc3QgbGF0ZSBsYXJnZSBjaGFuZ2VzIGFuZCBp
bXByb3ZpbmcgdGhlIHF1YWxpdHkgYW5kIHRoZQ0KPiByZWxpYWJpbGl0eSBvZiBmdXR1cmUgcGF0
Y2hlcyBieSB1c2luZyBtb3JlIGF1dG9tYXRpb24uIEkgYWdyZWUgdGhhdCBsYXJnZQ0KPiBmdW5j
dGlvbmFsIGNoYW5nZXMgYW5kIGFueSBjaGFuZ2UgdGhhdCBjYW7igJl0IGJlIHZlcmlmaWVkIHNo
b3VsZCBiZSBhdm9pZGVkDQo+IGJ1dCBJIGRvbuKAmXQgdGhpbmsgdGhpcyBjYXNlIGlzIG9uZS4g
SG93ZXZlciwNCj4gSSBhbSBmaW5lIGRlZmVycmluZyB0aGUgcGF0Y2ggYmFzZWQgb24gYW4gYWdy
ZWVkIHBvbGljeSBpZiB3ZSBjYW4gbWFrZSBpdCBhDQo+IHByaW9yaXR5IHRvIGdldCBpbiBpbiBz
b29uLiANCg0KVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmcuIEkgd2lsbCB0YWtlIGEgbm90
ZSBvZiB0aGlzIHBhdGNoIGFuZCB0cnkgdG8gcGluZw0KY29tbWl0dGVycyB0byBjb21taXQgdGhp
cyBwYXRjaCBhcyBzb29uIGFzIHRoZSBzdGFnaW5nIHRyZWUgZ2V0cyB1bmZyb3plbg0KYWZ0ZXIg
dGhlIHJlbGVhc2UuIEluIHRoaXMgd2F5IEkgdGhpbmsgeW91ciBjb25jZXJucyBpbi4uLg0KDQo+
IEZvciBtZSB0aGlzIGlzIHBhcnQgb2YgaW1wcm92aW5nIHRoZSBPQ2FtbCBjb2RlDQo+IGJhc2Ug
YW5kIHByb2plY3QgcXVhbGl0eSBieSB1c2luZyBtb3JlIGF1dG9tYXRpb24gaW4gZm9ybWF0dGlu
ZyBhbmQgdGhlDQo+IGJ1aWxkIHN5c3RlbSB0aGF0IGxvd2VycyB0aGUgYmFycmllciBmb3IgY29u
dHJpYnV0b3JzIHN1Y2ggdGhhdCB0aGV5IGRvbuKAmXQNCj4gaGF2ZSB0byB3b3JyeSBhYm91dCBw
cm9jZWR1cmFsIGFzcGVjdHMgbGlrZSB0YWJzLCBzcGFjZXMsIGluZGVudGF0aW9uLCBvcg0KPiBi
dWlsZCBzeXN0ZW1zLg0KDQouLi5oZXJlIHdvdWxkIGJlIG1pbmltaXplZC4NCg0KSSBkbyB1bmRl
cnN0YW5kIHlvdXIgcG9pbnRzIGFuZCBmcnVzdHJhdGlvbi4gVGhhbmtzIGFnYWluIGZvciB5b3Vy
DQp1bmRlcnN0YW5kaW5nLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiDigJQgQw0K

