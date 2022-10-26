Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA260E063
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430512.682270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfEa-0007w4-Vp; Wed, 26 Oct 2022 12:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430512.682270; Wed, 26 Oct 2022 12:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfEa-0007su-SS; Wed, 26 Oct 2022 12:10:12 +0000
Received: by outflank-mailman (input) for mailman id 430512;
 Wed, 26 Oct 2022 12:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ktaj=23=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1onfEZ-0007so-7h
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:10:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22fdae13-5527-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 14:10:10 +0200 (CEST)
Received: from DU2PR04CA0283.eurprd04.prod.outlook.com (2603:10a6:10:28c::18)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:10:02 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::96) by DU2PR04CA0283.outlook.office365.com
 (2603:10a6:10:28c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Wed, 26 Oct 2022 12:10:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 26 Oct 2022 12:10:02 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Wed, 26 Oct 2022 12:10:02 +0000
Received: from 93965348a3f0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 047B2954-A8A8-407B-B471-F11330AE6D0F.1; 
 Wed, 26 Oct 2022 12:09:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93965348a3f0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 12:09:55 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB4PR08MB9359.eurprd08.prod.outlook.com (2603:10a6:10:3f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 12:09:53 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 12:09:53 +0000
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
X-Inumbo-ID: 22fdae13-5527-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QcYLX8aU3EevojfQk7+C7jEduKwb/tTxos6+k0bZucYC8p6k81MspwpVzyrvVeLejXWKHKTPX7tet5RVs4iwI6JezytU9J0kw5O57QZz2Tu487Log1y3GAWt5H1Ues0bJ0243sOtSvgpHQBFh2Qhy7AUxJtkwhBz8orQhjSxN9cCcNP5I/kki7hwANWNIGapdLfM+6raH5tuoBMR0a3YLIhWDeO/pSMSiZEUxd+I1PgpfqL5804PnYcuf58jaPaLuECaccyaScN8oZWOZg1w1OTHjvT8M3cFy5seqd/5aNCpvErsjjS6mt8Gt1qSJeg3+B+gfTDxT/JGotXr/r8eSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9PSstsO5KDC5nSk/5C/x6O05/WB7bddeL7yCdPtI7o=;
 b=Yk1Z5j1Adp4vkh4VIoBNY98Wf02POzlwPufyAildB6/f9t9rsfi5fyqArQUvRhuIv0dVPD3NNcjUeDIq50AU9pbkJk1RjUXi1X6IamyMBNb39mkuCOMyvO9+gYpRG4gN4NGH9PS1meYG1OihmHrKMiA5o6d+cTG3TOWc0G46KBEL80PxQMDlq8F7HsXvLy2S2A+s1pwdZJZseePxFgm1hJ83Yb9yRLXQ4n76reCMCyGAC7xiH7ZCtbbwsWjQAS/sD0nyhZrL4bnnpJ/h5QaRDQRR/tKo3mGkYaDFtDIORN+yIPZQySmtPXZBDANs1szZGfzTJqhGyo0fbla9N0bLBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9PSstsO5KDC5nSk/5C/x6O05/WB7bddeL7yCdPtI7o=;
 b=KS4kfCDy7BrFDRiVCU7/tpKQ5LuHeKTe+atnN98mq7fUxjT9ws9a98V+7GKhBdPHVMOBA9dHSqPvTDLs6psg8v2VMxK5kvNPrtON9g1tZ45atib5AQ7Hi/CQcx21Y6zBHxmK+vviraLeChdFA/xwdWasgr4t/O25IGb5m0IPoJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3597cc9ca1b443f0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxVcN8BWhTcUiimunGhTwSnYg4oZBUZvxhholUDrZ4uAJQNlErWhe3Z3htGPLO54+/L17xtSLxX44j0ZxifKl7Q0Loie+LfghAvxI0sauSMD/tH3Sw05zgsZoE33xxe/wDGszAOVCdmryHAzi0ClJURVCIOok7kpHrZ6g2UGSUycHZLQnD3CL07QYeapRH2PaoVKIXosUbmRWd96N8ipj/YkUox8+KftEnVSt7MSE4K3/pRjTpify2eUuxqPSBWtWJijEyLfFR0L2ZjFJmpoG04roZAjBw6tpkj4/2kLTNlVx2ygTX6BLnq5JpGs+Sk09MnrCfGQKeEj7CQJUe5UpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9PSstsO5KDC5nSk/5C/x6O05/WB7bddeL7yCdPtI7o=;
 b=ehVDLjRBIjWJPaCLOGQceH85wE80gCzTAm9EN5vqUd41Hd/iXAyvGk5jlvTeWZbnJktr7eAh47oXFQXd7nskHxGjfTwlcrtdqAZyLNUSw0JopZFzosLORry4OeGPp9gJMyLDuJ+GmPPR6FM9mADORFGLhKjnaSex8PZ+9m+MbCxsM75KUGeFAZAZzC3ifrj2Skg1fT5JcFpFp4hnrJoCSaqO6DG3n/QFff/k5WJtjuDfgphXhYaVxMNaWLWVNw/l2WRDscykgA8bF/gvyifpiw2W/hpIqbXCoXEbPibkQozCJyH2vA8mKxvdHcXlG7ITPeD7w9mXwzEWrxWcEJC7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9PSstsO5KDC5nSk/5C/x6O05/WB7bddeL7yCdPtI7o=;
 b=KS4kfCDy7BrFDRiVCU7/tpKQ5LuHeKTe+atnN98mq7fUxjT9ws9a98V+7GKhBdPHVMOBA9dHSqPvTDLs6psg8v2VMxK5kvNPrtON9g1tZ45atib5AQ7Hi/CQcx21Y6zBHxmK+vviraLeChdFA/xwdWasgr4t/O25IGb5m0IPoJ8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [v2] Proposal for deviations in static analyser findings
Thread-Topic: [v2] Proposal for deviations in static analyser findings
Thread-Index: AQHY6FpvvKvqm6eEhUKW2GdsP99AnK4gljAAgAAAzwA=
Date: Wed, 26 Oct 2022 12:09:52 +0000
Message-ID: <7B05AD53-8627-42F1-A20C-B2BD0EED3581@arm.com>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
 <a00d4591-b068-c05a-763b-905f61af4d46@suse.com>
In-Reply-To: <a00d4591-b068-c05a-763b-905f61af4d46@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DB4PR08MB9359:EE_|DBAEUR03FT026:EE_|AS8PR08MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 6741e60a-a9e0-44be-7248-08dab74b02e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6FkYfdvTL+cFXtDdYScejgwRybVO6OYbUeCxb/nH+K0lhjBaWxvrxJW7mBIqnGpoRRRjuio4iCx+XoeBMRtt7kbIgirRiKQ+aZyT+EBlcHKNxnbVCEEAoh62FclcAynKNMMu0Wgbrysa4g6URCCZa8gIauyCmGgdE8b9NuufejXZ+hk2mK5vg4RopIE5iJcaacgPtyBF3vupC4OLiVIvV/H2yWDOnPLdvfous3tqspx0YAfwhQna5ic1hlNbWgY0J9/UKym45sNzREF+jYrdigRYbXl7yO+Xe5PJcjb/yY4XiKJbEHjz0dgMTBUzIPZbP/uBuMgcnYqk4J3UsdGsUspmnwphEI9qcZVP5fyf0iWjVIL370UlcJzeuMhAK/YSyNNoAiiTx+bj2ITOvWEkjo429Sp4dFjkLdREXCQlDgqaRmlF95ACz1xak0KliJFpAaOOz9I/yQfCxwDHD7nkgTTXgAwn6P3/+MFxP6BOWdCu3KnVJfl0H0OfNhUjFntsR8yvf5GOItoRr+FIe5aQ9XBTTrp15a9DhKR+T3rasfXBted2w6XjWoZkHt0BHt40LahC3DV3Stp4OhBwfIYMfUGasjKime7K7csIOhBNp8wCiR74IjENcVnma6TzM76sZSao27t6eBd5KkW2WYlUJXffj4PBC4yY0ggcbUHbExwClr2HiPK9iMabUXzwZgZb5OT/WU+7YFCwE2/VpjKpveW44eEp2b3QcvWH/F8g8C8bNyDPjyv8rIWWqWfQDxsmjrEmEe31FgMTEmZly379bNy6yHyjj/qMLyp8gYc1fPs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(36756003)(33656002)(86362001)(122000001)(2906002)(38100700002)(2616005)(6506007)(38070700005)(186003)(66946007)(71200400001)(6916009)(91956017)(66446008)(26005)(6486002)(76116006)(6512007)(4326008)(316002)(53546011)(54906003)(64756008)(66556008)(66476007)(8676002)(5660300002)(8936002)(41300700001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <29EE2EC926C6CF46B8F7B39398B1EDB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9359
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14a69635-1381-4900-451d-08dab74afd34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XcOZTKy6K/TVh8YMFqm8qN+8c8K2Ma+U3gQq1ei5uNO1G00H0b5do50vY7qGEXtydiIMFBXIQtK1+sriiBMdZbD7m3UT1c8Uj+kGl7WHuDpgYjET0mRLp6XC12jjmOq+Xt38FQb2kf2poRVP3pniV1wDKDLxYwO3IzDKv4VdqZpT6KS7HHQR6kaWBaeMWymd5uNJv9KaCF26/CGebEwcceCRFacGZbnVnJbJYPX6b2q8S56dE1Fx/bUR8t8D5Rvv5+l5HnQUXWINyWVpdFWx3CaiMIaoz10yFXkZzCaP+GDY4W+tFUWGPV/zx+CUf1mMrpzZhC5BamcHUKvPz5R6mxFdRV9m1dGiAJwGsne4aUpdzUu5EdSJYf50SnTK/gY4grnEIjyKy0YDX0126astSHW0q/kMt6HceOo+4Z5ddfMSbNMcqu9k/EzKk0f34GO5fTySKaHkhghh6d4KzLTsyeaQfrBYkRkxgSz/hVyQh07rr0XSy1qjSgwFO55rOuqo1jDQ9gRaoghg+ipSHQkQO8Hk5sP9i7F7pPNGL6RR/iAqlcfM+nIqhHrVImhuY3wpQ0LnfIOiFca8Wr3EZ+soV9ufGC6INoJ5UcdAVwVzKz1Mi24OBCTS4uH7FuNUR9+joZT3y1v2JlS/UDP/OWvAW1UynoQQ4IrgB2mIuRUshbfoe680RZ9wHLy78voI1Z4V+7nAHAjbI0WHpE+EwShluyGXMRYYNhDRSzc4fw105nH+H+TivIdGo3DV0LYOsXkbit185wVm1c4gba4hafJj8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(356005)(81166007)(82740400003)(2616005)(6862004)(86362001)(8936002)(33656002)(4326008)(6506007)(26005)(36756003)(70206006)(41300700001)(8676002)(40480700001)(70586007)(5660300002)(40460700003)(6512007)(47076005)(2906002)(53546011)(186003)(316002)(82310400005)(54906003)(6486002)(36860700001)(336012)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:10:02.4612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6741e60a-a9e0-44be-7248-08dab74b02e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148

DQoNCj4gT24gMjYgT2N0IDIwMjIsIGF0IDEzOjA2LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMTAuMjAyMiAxMjoxMywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEhlcmUgaXMgYW4gZXhhbXBsZSB0byBhZGQgYSBuZXcganVzdGlmaWNhdGlvbiBp
biBzYWZlLmpzb246Og0KPj4gDQo+PiB8ew0KPj4gfCAgICAidmVyc2lvbiI6ICIxLjAiLA0KPj4g
fCAgICAiY29udGVudCI6IFsNCj4+IHwgICAgICAgIHsNCj4+IHwgICAgICAgICAgICAiaWQiOiJT
QUYtMC1zYWZlIiwNCj4+IHwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQo+PiB8ICAgICAgICAg
ICAgICAgICJjcHBjaGVjayI6ICJtaXNyYS1jMjAxMi0yMC43IiwNCj4+IHwgICAgICAgICAgICAg
ICAgImNvdmVyaXR5IjogIm1pc3JhX2NfMjAxMl9ydWxlXzIwXzdfdmlvbGF0aW9uIiwNCj4+IHwg
ICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5SMjAuNyINCj4+IHwgICAgICAgICAgICB9
LA0KPj4gfCAgICAgICAgICAgICJuYW1lIjog4oCcUjIwLjcgQyBtYWNybyBwYXJhbWV0ZXJzIG5v
dCB1c2VkIGFzIGV4cHJlc3Npb24iLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBtYWNy
byBwYXJhbWV0ZXJzIHVzZWQgaW4gdGhpcyBb4oCmXSINCj4+IHwgICAgICAgIH0sDQo+PiB8ICAg
ICAgICB7DQo+PiB8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMS1zYWZlIiwNCj4+IHwgICAgICAg
ICAgICAiYW5hbHlzZXIiOiB7DQo+PiB8ICAgICAgICAgICAgICAgICJjcHBjaGVjayI6ICJ1bnJl
YWRWYXJpYWJsZSIsDQo+PiB8ICAgICAgICAgICAgICAgICJjb3Zlcml0eSI6ICJVTlVTRURfVkFM
VUUiDQo+PiB8ICAgICAgICAgICAgfSwNCj4+IHwgICAgICAgICAgICAibmFtZSI6IOKAnFZhcmlh
YmxlIHNldCBidXQgbm90IHVzZWQiLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0Ijog4oCcSXQgaXMg
c2FmZSBiZWNhdXNlIFvigKZdIg0KPj4gfCAgICAgICAgfSwNCj4+IHwgICAgICAgIHsNCj4+IHwg
ICAgICAgICAgICAiaWQiOuKAnVNBRi0yLXNhZmUiLA0KPj4gfCAgICAgICAgICAgICJhbmFseXNl
ciI6IHt9LA0KPj4gfCAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCj4+IHwgICAgICAg
ICAgICAidGV4dCI6ICIiDQo+PiB8ICAgICAgICB9DQo+PiB8ICAgIF0NCj4+IHx9DQo+IA0KPiBC
ZXNpZGVzIHRoZSBzdGlsbCBpbmNvbnNpc3RlbnQgdXNlIG9mIGRvdWJsZSBxdW90ZSBmb3JtcyAo
YXMgYWxzbyBwb2ludGVkDQo+IG91dCBieSBTdGVmYW5vKSBJJ2QgZnVydGhlciBsaWtlIHRvIHBv
aW50IG91dCB0aGF0IGNvbG9ucyBzdGlsbCBhcmVuJ3QNCj4gdW5pZm9ybWx5IGZvbGxvd2VkIGJ5
IGEgYmxhbmsgKGJvdGggcG9pbnRlZCBvdXQgYXQgdjEgYWxyZWFkeSwgYW5kIGlpcmMNCj4geW91
IGFncmVlZCB0byBtYWtlIGJvdGggYXNwZWN0cyBjb25zaXN0ZW50KS4NCg0KWWVzLCB0aGFuayB5
b3UgZm9yIHlvdXIgcmV2aWV3IG9uIHYxIGFuZCBoZXJlLCBJ4oCZdmUgYWxyZWFkeSBmaXhlZCB0
aGVtIGluIG15IHBhdGNoZXMsDQpJIGZvcmdvdCB0byBkbyB0aGF0IHNlbmRpbmcgdGhlIHYyLCB0
aGUgZmluYWwgZG9jdW1lbnQgd2lsbCBoYXZlIGEgY29uc2lzdGVudCBzdHlsZS4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo+IA0KPiBKYW4NCg0K

