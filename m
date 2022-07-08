Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F156B3E5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363292.593790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iqn-0000xP-LL; Fri, 08 Jul 2022 07:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363292.593790; Fri, 08 Jul 2022 07:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iqn-0000vW-IH; Fri, 08 Jul 2022 07:56:33 +0000
Received: by outflank-mailman (input) for mailman id 363292;
 Fri, 08 Jul 2022 07:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L55t=XN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o9iqm-0000vQ-AI
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:56:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab18372-fe93-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 09:56:31 +0200 (CEST)
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by DB9PR08MB7022.eurprd08.prod.outlook.com (2603:10a6:10:2c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 07:56:04 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::67) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 07:56:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 07:56:03 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Fri, 08 Jul 2022 07:56:03 +0000
Received: from 590ab49098a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0693F640-CFAC-4C61-82BB-509385B34AA9.1; 
 Fri, 08 Jul 2022 07:55:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 590ab49098a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 07:55:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2215.eurprd08.prod.outlook.com (2603:10a6:4:86::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 07:55:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Fri, 8 Jul 2022
 07:55:40 +0000
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
X-Inumbo-ID: 7ab18372-fe93-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QC0seYKL+mvvnQ67XHkMb92mPpDSxChsuBoCGfYSv8qRl8E7Q4b7jkRvLltmHSLE7HSpfgokRHGmN6G4aUITtlWSgqCzpkZJEg4mLfBtFGuaDJsFfYaV7M2g3XYVDslrGPIs2V9zoRmJmG+gyr9k/dN2BPizJu0ZcXE+0wfwK6873GxWvNcbzjIkjxw7IGz3CCElpc3n/ypKGZbPDt+LljuNEb1ssWoug9y3A3CgxA2UWWn/NEWLZ8yDu12sjrpNjcscyBaUpr1BfJWh/6gVMaZ6i+EyCkWqHk6OPKgdZHK9O0KSkDyujVu253C8NUAhSty9l5WFt1jvsjKtk5JgZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEOAqz6BehGVcNCzctmITzvkSG+PJYzUHHc/7SBlfjA=;
 b=PCA5fhVCP/uzVJg50axBNsRjNn5EpkqXC4Dx8+PzMXDYfmNveyfFqeuQZ6hW8LmcNZeMazln73jk4gEZ11g9x261hbyMP3H9XYP3R990uqXglxKbZ6eEYzU6PnGs2lFJ0/QUVz3N0Tt4MC7/UrIDgHa/rEyhwI3FueeDh59wan3LQUmT9333QM01nLrHymAFDPbIYkDHBKqOHA7ggl/++z9fIs2ZQ79ZFkvdtCXRlWRUD8QwWAZiOFgsasi69GtMi887lIxF7amS65mfMHIZc0iHM8YOsUS3v/YRvTzoDu8G3I5rnqGdsP3jIKaAVKR27DskYc64L1FyS50/Swk+yw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEOAqz6BehGVcNCzctmITzvkSG+PJYzUHHc/7SBlfjA=;
 b=0RPG30v+zu3Zn57U7PsiPEzGZ+DvwALzab49wxLFwMUwb8bD0s2dc8mYzUTy+0eqIBNSIRIg85giAaxeKu7r6rKZ+2nt4vCUXHaMQxNPijBk6KfRKoALPZqKgFwRxLVTOfmW/ysZ3EPjEyVMaC7osjHmgrZQTPa2Qh+DXil8Quk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c2b2380d16812c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIA2dtmUtSiTPL/Flrj8X7aSMqPLUElNzs0hSIqxeoqNRhuJbgOGy1Dz+SSDmO4XV5WzIOKgcC6bXvuscn85V56Y9BFVEcS+/i7wb3UvfFn9ZfJkSM+Cd0Jv5vrZKm93flObFsDGIULuEJx6d7hg9BeLoask7Tp/K2jy4OZThkKuLmrV3sWGMT1lJkwAsfM55Qlj+LqNcmAnKgp3lYSmnK3FNHT98Du+UdxDICsfZXvIZ1N6opUvJpWpn1IWw8WeEABHoJMcDI1b7DpaOmmU3OZ/zvCJ8uLDpF21vVG1/vsR5A9N6dzP1Jv8Tdg9wIAy7HHoW7QKOJ6gLNui/IOKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEOAqz6BehGVcNCzctmITzvkSG+PJYzUHHc/7SBlfjA=;
 b=OpFHaYedWeqRGkB7hD3gGGhvBIKxfrvICDddm7PsWiVb8B+wIkzQCFqHS1arQmQUPLw4J9EpBpbTS6E/jzY1bj9hh1KOQq8zy1fMAzytVPLfqLPA1X/5BSvdqkjDy4O7r0ZIIFHZz1+VQ8FiN+Wt1hzfRPZ6obkJJIxx1Q9dfA2Xx7RBtIvF13GQlOCViqXMgi4ByonwWw2ogJaa3Q6gzZU50le4ikS4a1lxPbJZVjRYhUg+AbCHBi/4Am8T9V5vC0799g6/eRBc97s5qINbSm6Zcvtk+qANx59YJFhvc4ecvqhrnGGDGA1Df6ALzULBjaS48V7QDRnbg+joIZNRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEOAqz6BehGVcNCzctmITzvkSG+PJYzUHHc/7SBlfjA=;
 b=0RPG30v+zu3Zn57U7PsiPEzGZ+DvwALzab49wxLFwMUwb8bD0s2dc8mYzUTy+0eqIBNSIRIg85giAaxeKu7r6rKZ+2nt4vCUXHaMQxNPijBk6KfRKoALPZqKgFwRxLVTOfmW/ysZ3EPjEyVMaC7osjHmgrZQTPa2Qh+DXil8Quk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Julien Grall
	<julien@xen.org>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: Re: Xen 4.17: Proposed release schedule
Thread-Topic: Xen 4.17: Proposed release schedule
Thread-Index: AdiSei6vjIC3DQhRQxe+drETJuVp3wAJe8gA
Date: Fri, 8 Jul 2022 07:55:40 +0000
Message-ID: <74D6D8FE-1F89-444C-A112-F187E64F963D@arm.com>
References:
 <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 03c025f6-5087-4d69-bbbf-08da60b74e42
x-ms-traffictypediagnostic:
	DB6PR0802MB2215:EE_|DBAEUR03FT045:EE_|DB9PR08MB7022:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NB8/d8+1zckOKkyzSP77BAEeefMKSHmB2qV/4PTO+gn7BAP0OYGhVoQy7F5w/Qm0XKECichmADyeQrPk6ToeL+1WEai9RuFLR9jFrynGL6/gKkk3W688LU17E1GQy0WG1tl+WJcHSr7M6wWugpnFYGqGQTvCpdYEK8169b2osqkuJ28y5xd0JptGSQSSpGJVxEE1Ys4mbg7lifg8WniXtM/jYVUAlap9NgKyKkVYcAauYCnAUFs1uYif/yr4uWAIJwsviGmVYHukWPCQw+IfUQE2tUZnPOjioI6Kq1iVV/1Y3dcZGHlJU6WrRYerCJoRIItMtzgt2EFSLkVs2k2hTSHizQXRrGIERiZ0u6lDukbLYvNunG65zyp0TEhoXXjCtQcxJnHNTXTnXwqGcmhEzOn17Y4illh6kc5HjGRZAukExwUkpvzr4uDhxgABpWHDNISpyCGNDwBXFJ2Jf2N0ea8V04OEQZFareLtToGdHYxFOJwOz404OMG6fVZjkztGgbLD6TSP8BCyPmS1Iowq6Sjdo14YeFXVOacA54VpNzBR17y0RuMNC46uCpx9SKemOhoXhD5SqB9bJQC6KaJ5cMNZOXZCWHa7EYVUetoJcVQKo8thS49EGofW9CiOlDm6ZGSVtPbuu5tYtPkmW24qtp1iN2ngj38QV8Oo6cyWQcSVcfrn53pNBQl+5h7cMF+Le3TBomYWMTMes4cEYW4rTVw7/3Q5xcijn0x+GcQrN4sSxS7NdxxoHKLpxI+BpsEO5E3mYIK47FGIr9cqu+lWAqmvJUu7uxM9x3V+wtUBs6iwhNFTx8kE2A5SkSFc6+qTwePt1DlMnel9TegiWL+z2nbp38zGlLZvCeYsy71DqoI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(53546011)(6862004)(4326008)(26005)(41300700001)(5660300002)(64756008)(2906002)(8936002)(33656002)(6506007)(66946007)(6486002)(122000001)(71200400001)(478600001)(36756003)(66446008)(38100700002)(91956017)(66556008)(76116006)(66476007)(8676002)(7416002)(2616005)(38070700005)(83380400001)(6512007)(54906003)(6636002)(186003)(37006003)(86362001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <164116471B40FD4FA38B7AE09DE9381D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2215
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c71cde06-992f-4ed1-89d1-08da60b740c3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zF8aLVHlOxU+Pkkwzcz1YNSDiYKLDmWmzle/U7uBNmfkNm/PUstOYBpQDYfNAzM/kg2QpBVABqfej1fBSqifE9ORV2wcVy1aSbDoPbG/Py/vs1xzXC7kntxS6V+e89KJR/fHnEjiNbxTRe+Y0u7CpyhGWaRsby/TqJyGAg5xJHpVvfhP3qrDQ06ifX4Apgm9iJWBSi4IoUsfM4OOYWYRNGMXJQpsTajHtdMx70LLnRdmjh1/7efiTP0dtDnXj7MSkpv13y8mmGB8eg7MMVeTe4RLMxPnkCh3arSSbKkAzF47Dp5d64PyXAj7MGHFqEDY6ZKlq7ucRehwPjWb+ZiA0fqVotatU/XWz0ZdPKWNg2WCn5aJULcBdkmfP7JSOYNJKBsCwGeTcJvtrxiTdosE3z4gCS05w083IaRSHAasRP2AsTcWBUvYvYv7I+IaLYqh6Rel7kKK++W994Vt7I0g/ZZCUhKzcKV7opkLpLYGwruLgJOqWZ/ai5yIUJGdNTTsWdkBrQJA9pvDe68hu4eW4GrUKSeXW6zuccE4pQPCxDFbNX6TzJssimNmPqkmRSeGTkWHSsPAP92WhksYVp2BF3rNC+cYTLmwX3KSe2589JNmFurBLBd1T6aK4yvFQ0przx0SbMEvS4P5fl85XMsCyj36bPmrRqUVJc/ikzYJIKsl8DO4Kd69IOOgI8xltWrIyrI87m0L2VmfkMkLK89QV77vZlkS7NLShcPjHyp6Uj4l2aeYFzFWMlpPYFPfzgoQ4OjEtBooiMIpgOoNdvuerUJ97rwjSVmpdppgilsOUM1UvNXf6hsAMY4lSWjrVUG3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(6862004)(40460700003)(36860700001)(40480700001)(2906002)(82310400005)(83380400001)(82740400003)(70206006)(81166007)(86362001)(54906003)(37006003)(6486002)(70586007)(36756003)(8676002)(316002)(186003)(4326008)(356005)(2616005)(6636002)(107886003)(336012)(33656002)(26005)(53546011)(47076005)(6506007)(6512007)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:56:03.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c025f6-5087-4d69-bbbf-08da60b74e42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7022



> On 8 Jul 2022, at 08:35, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi,
>=20
> As discussed in the community call on July 7, the release schedule for Xe=
n 4.17
> is proposed below. Please send comments ASAP and in any case by the end o=
f
> Friday the 15th of July. I hope we can finalise the schedule then.
>=20
> Original date following the 8 month release cycle (August 2022) is likely=
 to miss
> considering the summer season in Europe and the fact that we would have h=
ad to
> feature freeze in July, but this is likely to be not feasible anymore.
>=20
> Based on the Xen 4.16 release timeline, for Xen 4.17 release:
>=20
> Proposed option 1: Wed Sep 28, 2022
> (+9 months from Xen 4.16 release, after Xen Summit)
>=20
> - Last posting date          Fri Jul 29, 2022 (+3 weeks from now)
>=20
> Patches adding new features should be posted to the mailing list
> by this date, although perhaps not in their final version.
>=20
> - Feature freeze             Fri Aug 19, 2022 (+3 weeks from Last posting=
 date)
>=20
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
>=20
> - Code freeze                Fri Sep 9, 2022 (+3 weeks from Feature freez=
e)
>=20
> Bugfixes only.
>=20
> - Hard code freeze           Fri Sep 16, 2022 (+1 week from Code freeze)
>=20
> Branch off staging-4.17. Bugfixes for serious bugs (including regressions=
),
> and low-risk fixes only.
>=20
> - Final commits              Fri Sep 23, 2022 (+1 week from Hard code fre=
eze)
>=20
> Docs/prep only
>=20
> - Release                    Wed Sep 28, 2022
>=20
>=20
> Proposed option 2: Wed Nov 2, 2022
> (+1 year from Xen 4.16 release)

+1 for this option

>=20
> - Last posting date          Fri Aug 12, 2022 (+5 weeks from now)
>=20
> - Feature freeze             Fri Sep 2, 2022 (+3 weeks from Last posting =
date)
>=20
> - Code freeze                Fri Sep 23, 2022 (+3 weeks from Feature free=
ze)
>=20
> - Hard code freeze           Fri Oct 14, 2022 (+3 weeks from Code freeze)
>=20
> - Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code fr=
eeze)
>=20
> - Release                    Wed Nov 2, 2022
>=20

Bertrand


