Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A567A809A01
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 04:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650336.1015795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBR7a-00034j-Jy; Fri, 08 Dec 2023 03:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650336.1015795; Fri, 08 Dec 2023 03:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBR7a-00031R-Gp; Fri, 08 Dec 2023 03:01:46 +0000
Received: by outflank-mailman (input) for mailman id 650336;
 Fri, 08 Dec 2023 03:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBR7Y-00031L-AG
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 03:01:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bd8ab7c-9576-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 04:01:40 +0100 (CET)
Received: from AS4P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::18)
 by PAXPR08MB7670.eurprd08.prod.outlook.com (2603:10a6:102:244::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 03:01:32 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::19) by AS4P189CA0032.outlook.office365.com
 (2603:10a6:20b:5dd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 03:01:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 03:01:32 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Fri, 08 Dec 2023 03:01:32 +0000
Received: from 0700d572dcb4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C76B752E-2C7B-4DB3-A376-7364BC8010D6.1; 
 Fri, 08 Dec 2023 03:01:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0700d572dcb4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 03:01:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 03:01:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 03:01:23 +0000
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
X-Inumbo-ID: 1bd8ab7c-9576-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m2fucHFLoBeYhOnB+RHr5dqbFxMoFPVB7+zZscqfLPpjhPkEF9yX+jYdsOM3NLeAqrINF35lupx+nF0MKEvXWnkEXlfBDAL5L4mKAVdH6EA56mQVM5648XL6NopsLO5tS9MFXceC+hHkxhPyLNVf8oop0Uq1Np7MMQjp2HCpamXyfKVovTRTmQR/zmXCPJdBgdwMrrfbWCKeIRPKuEIpJE51hPZ9htCszbz07poQvamGJiFffgP58u63OqBmPxhOKol7p3pnO5LO4xH6067Y4w4dNmHjmANyXoNYdHggsHVD7oaBaacpXmino6PXENCQuI8A64bw6eJkdG4vIUcmCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTx6Q4ju/NXdgOmxt75JmWE+3kGSbKJGfCmVxbR9Bew=;
 b=PsmvWT+8pGWTbzjEMlwbsHiu5vgiRVeNm/D8Cfngc3uqbnqN6niyoOHJHNeSE6z8FfAMnfd5vFl5dURk6AtZlqPGsejMm+Bx9CtRII9jvnz/hmlXTENbVv5n1cTzjGQzZrurw5JxnoZzd6vm3FWP1qTOzhGeQF9mB1QIoqVbPV1jir41+/z05TqWXmKPNNXWsHWq+9IFpVNHR7i6VuwkBPHHUX9VLGeIDfbdGuzgBXmI2ryf6YhrHoA8LNfOjRsyvIHq+O85NceyYYaf0O3gz3acaniD3shSovePMbQrRtuRdkDsYAYIN72C0cdFMVmG6cxGJrpYILtHXWwnuaJF7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTx6Q4ju/NXdgOmxt75JmWE+3kGSbKJGfCmVxbR9Bew=;
 b=0plZ14Nsnn1ACJk0CEsF5GTLrLyB8Mlx/uQdSCP/F/FBejJhbtYkAajv9/SODQwBmOXFyjfyrBGyuoM2aIqDuIwinpw9UQ+dS8sFwvsmQrb4B/5qGmXDBB+pn+5p4luirInWXRDWaB7iOyWetuOmYV7cd6o6TbzhN2l2VKtTJts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9367dfaaa6668e27
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms3Jf823zk/hrMY7dXqV0wj3Z0t+JE7MKYCi4W84oExRrNhkNR2HNmumI/73ntJSCGci7nCPlJqabYTUjuV7a0LiLGFVjR0fXlVn/VGHRAEGQQL19zHY9Yy//8ys5KF20U18l4rvuGTY6LFMtobvcp03Xs+ZFaWA3Z6ZlU8DENMgnORtQJsfabLIAtcw9iZ8Zcpv4HL4BPv+RSymlasRnMzqxWCH6BqMzZZpScz4o7LeHZahDNZefX3DhUgkuvjhnIwek3plkTW6aJ/yJdAPATOX0bF9gDDw7LyOTlhWgMZ9/UDWb+uAA6pKvFZXVV1QA4R0rjJLIfVS2om17F0Fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTx6Q4ju/NXdgOmxt75JmWE+3kGSbKJGfCmVxbR9Bew=;
 b=FpmU/rQ7srmMbehCf7fpFEmi5z5hm8C9QHqRcMIYwlNgGVHnQmiMRzaUPsgXxNKcVpNG+lpEieJ8kVaTUowxjHCCt32ZCzbVtraCci2cP4wQuaXAFkBvVDqNjZ8VmjBQyUI8kxC5t22nWrV32kFw77Sh49Mip+OVbD15lF9YnCyq43X0xCXrDE9wINDQcKfUHdcrpSVT+SJDzOxExk/4D24Ap0l5J25spPaR3O/SMxbIaBNDiE9kr3ge7vgA0cQtXeE0Pgm0IAn+y9Dv5u1h7odczcjg574p9xppURkWK15N4DM5oTmee7ISx8dL9yT50Uqg8ytnDfFsCuOSZgUjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTx6Q4ju/NXdgOmxt75JmWE+3kGSbKJGfCmVxbR9Bew=;
 b=0plZ14Nsnn1ACJk0CEsF5GTLrLyB8Mlx/uQdSCP/F/FBejJhbtYkAajv9/SODQwBmOXFyjfyrBGyuoM2aIqDuIwinpw9UQ+dS8sFwvsmQrb4B/5qGmXDBB+pn+5p4luirInWXRDWaB7iOyWetuOmYV7cd6o6TbzhN2l2VKtTJts=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 3/5] automation: Add the expect script with test case for
 FVP
Thread-Topic: [PATCH 3/5] automation: Add the expect script with test case for
 FVP
Thread-Index: AQHaKRTRSAbthQjm9k2SM6wWsGqHurCenEEAgAAHDICAABAgAA==
Date: Fri, 8 Dec 2023 03:01:23 +0000
Message-ID: <0BF1ADE0-26F3-4975-81F1-2676F4626702@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
 <20231207135318.1912846-4-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2312071736190.1265976@ubuntu-linux-20-04-desktop>
 <DDEC86F3-A2AA-4A34-87E5-4E91C2BF99BE@arm.com>
In-Reply-To: <DDEC86F3-A2AA-4A34-87E5-4E91C2BF99BE@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6447:EE_|AM4PEPF00027A68:EE_|PAXPR08MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 361f883d-902a-4942-69b3-08dbf799fb94
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mCw2qvACGALLGN0DvVzuAcFTSQHG+If7cIUC8KXo5sAWFuhu42g7LBdQNSbtMATChHmwCAO7V4Jkpx+OElkVXXVzHQHRYf/Y3M93pHUctAEFJT5IgLJdIZ3gRO8bp5Me0axessXjnk36ln9aAzw4UINP1ziD4JXo5qXhawnBzifpwlzR2UR/oiXYKJ+lF4+gnqBAjkLYVrayz5l2MLsbpQH+MXN4ptSnGSTOE8oCAF7HuBt/wz1NFM0eSPff5wFBiy0CoejwXATBt4s35zQ56tilaMuJRER3XjAdsmBbkNUkh3f5v/cjRySmc3fPVQuqcZuFjBOnaCEhesNSPijsSF2G81V62oVQK1tABpIVhYfAN94IMllTEK0tNAZwmPau9XUjJKwNyHO7z1AlGo4SGIXZu+u/7yGCKmUJxkdT/O0v1u4QHr0OSE6PCwmcO7JOTSHcLqP0NjgiUt+zTVBHXjuCX4xa+lJT9gyAl44LyuH69xcLTD+RoyoG2iBL1UlFa4ZNpZJhgMRAkooIrL8ULxcykw6aueZzayX0blnLQIRKfsniwTd2+HeiqBhDgs6mYo30QqXuhHA6KWnONbJCG5ogS3ptBPDAyrRedknBIsyEZXVoWZmSDVFeCtmP24jYJa+g6n3lFD+7xl1UERwSJXIccxMsMHV+MoeVrWrKO6Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(36756003)(8936002)(8676002)(4326008)(5660300002)(38070700009)(41300700001)(26005)(2616005)(71200400001)(83380400001)(33656002)(86362001)(38100700002)(122000001)(478600001)(91956017)(316002)(6916009)(66946007)(76116006)(66556008)(66476007)(66446008)(54906003)(64756008)(6486002)(966005)(6506007)(6512007)(53546011)(45980500001)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <640662C74980504CA4D482B7D40A64D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cff9d9b2-ad77-41f2-5af2-08dbf799f60f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZlieqFwK1pl9lFagrNDN7Pl0sCiTMosmNn4WYsdeyxrAmCw2L3c5clvuxH9q4uSaW6JBjs+UJxKnnRTi1IdHCzmvqYq2nJjkgp/YzCBDrARoem4xcbjaXWepL34UDz6TB5Dxw8eSurQvkC0TaUjeVb5EGoMlewfHwbtLkyElWJ9N200mwdS5N8TrDIt0vEw0a08nmMn9EMZwLDgw/vemMg1RPwcrgm4l1rZqGG703dOenH+FRzxtEhHonq5ZULhXWYo5MIxv2U4b2I7VRErPzegyF3pdheUJ0uXA7y3I7T8+ouSMN4agSsiWDFmj2l/JxLIK8933H9mr+ZPjgAq4o2xH4zjCMi084UPuF018ZQRm37dov2s5Cme422kNs6KWbR+WNoOiJ2sjX/Pvu/bwqqh6dYLWmz/j3LdBkoKoTmKnF+IUI/AI28K/Fooegjch1CFa1trg/fHsOJrKjyw7TIHDr5f3A3DvMAths/W9/tD1nK5ERScvHQvCFs1ZMh/NykJ9MJKGHRYn58YSFeg3C0ccUENzUm+rny2A8Ow5CT3sivCAj2clvon5kNkpvXBaSJK/g/jbtPe2p4H3FfSqVOaDN8hRHWXkpUZKlkyX5mCIJDy5gwt2GJZT+uQeKeV8dDcwLjG5VW/rVt/4pwbKmcGHbKJ6w8DBV5dT2CK0YmYPW4RTx8CBDVw4kXE7eTR4jFc2Xrivlqmg8m7B52DO3FwQUuvoembOQmpLRgYTxQxaDDPmmL/WH/qrSOsA5jxI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(2906002)(40480700001)(6862004)(8936002)(4326008)(8676002)(5660300002)(316002)(54906003)(70206006)(70586007)(40460700003)(47076005)(36860700001)(2616005)(966005)(6486002)(53546011)(6512007)(6506007)(36756003)(26005)(41300700001)(336012)(478600001)(83380400001)(82740400003)(33656002)(356005)(81166007)(86362001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:01:32.5452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361f883d-902a-4942-69b3-08dbf799fb94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7670

SGkgU3RlZmFubywNCg0KPiBPbiBEZWMgOCwgMjAyMywgYXQgMTA6MDMsIEhlbnJ5IFdhbmcgPEhl
bnJ5LldhbmdAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBTdGVmYW5vLA0KPiANCj4+IE9uIERl
YyA4LCAyMDIzLCBhdCAwOTozOCwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPiB3cm90ZToNCj4+PiArc2V0IGhvc3RfaXAgJGV4cGVjdF9vdXQoMCxzdHJpbmcpDQo+
Pj4gKw0KPj4+ICsjIFN0YXJ0IHRoZSBGVlAgYW5kIHJ1biB0aGUgdGVzdA0KPj4+ICtzcGF3biBi
YXNoIC1jICIkcnVuY21kIg0KPj4+ICsNCj4+PiArdGVzdF9ib290IDIwMDAgIiRob3N0X2lwIg0K
Pj4+ICsNCj4+PiArc2VuZF91c2VyICJcbkV4ZWN1dGlvbiB3aXRoIFNVQ0NFU1NcbiINCj4+IA0K
Pj4gV29uJ3QgdGhpcyBhbHdheXMgcmV0dXJuIFNVQ0NFU1MgZXZlbiBpbiBjYXNlIG9mIGZhaWx1
cmU/DQo+IA0KPiBJTUhPLCBpZiB0aGluZ3MgZmFpbHMsIHdlIGhhdmUgdmFyaW91cyBleGl0IGNv
ZGUgKDEtNSkgZm9yIGVhY2ggZmFpbHVyZSBjYXNlLiBGb3IgZXhhbXBsZSwNCj4gaWYgdGhlIEZW
UCBwb3J0IHNvbWVob3cgY2Fubm90IGJlIGZvdW5kLCB3ZSBleGl0IHdpdGggZXJyb3IgY29kZSA1
LiBUaGlzIHdpbGwgYmFzaWNhbGx5IGxlYWQNCj4gdXMgdG8gdGhlIG9ubHkgY2FzZSB3aGVyZSB0
aGUgZmFpbHVyZSBpcyBjYXVzZWQgYnkgdGhlIHNjcmlwdCBmYWlscyB0byB3YWl0IGZvciB0aGUg
ZXhwZWN0ZWQNCj4gc3RyaW5nL3JlZ2V4cCwgYW5kIHRoaXMgY2FzZSB3ZSBoYXZlIHRoZSB0aW1l
b3V0IGZhaWx1cmUgdHJpZ2dlcmVkIGJ5IG15IGFib3ZlLW1lbnRpb25lZA0KPiBleHBlY3RfYWZ0
ZXIgYmxvY2suDQoNCkkgZGlkIGEgdGVzdCB0byBzZWUgaWYgSSBicmVhayB0aGUgZXhwZWN0IHNj
cmlwdCBieSBhZGRpbmcgYmVsb3cgaHVuazoNCmBgYA0KLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRz
L2V4cGVjdC9mdnAtYmFzZS1zbW9rZS1kb20wLWFybTY0LmV4cA0KKysrIGIvYXV0b21hdGlvbi9z
Y3JpcHRzL2V4cGVjdC9mdnAtYmFzZS1zbW9rZS1kb20wLWFybTY0LmV4cA0KQEAgLTUxLDYgKzUx
LDcgQEAgcHJvYyB0ZXN0X2Jvb3Qge3ttYXhsaW5lfSB7aG9zdF9pcH19IHsNCiAgICAgc2VuZCAt
cyAic2V0ZW52IHNlcnZlcmlwICRob3N0X2lwOyBzZXRlbnYgaXBhZGRyICRob3N0X2lwOyB0ZnRw
YiAweDgwMjAwMDAwIGJvb3Quc2NyOyBzb3VyY2UgMHg4MDIwMDAwMFxyIg0KDQogICAgICMgSW5p
dGlhbCBYZW4gYm9vdA0KKyAgICBleHBlY3QgLXJlICJ0aGlzIGlzIGEgaGFjayB0byBicmVhayB0
aGUgYnVpbGQiDQogICAgIGV4cGVjdCAtcmUgIlwoWEVOXCkuKkZyZWVkIC4qIGluaXQgbWVtb3J5
LiINCg0KICAgICAjIERvbTAgYW5kIERvbVUNCmBgYA0KVGhlIHRpbWVvdXQgZGlkIGhhcHBlbiBp
biB0aGUgZXhwZWN0IHNjcmlwdCBhZnRlciB0aGUgc2V0IHRpbWVvdXQsIHNlZSBbMV0NCg0KSG93
ZXZlciB0aGUgam9iIHN0aWxsIHBhc3NlcywgYW5kIEkgYmVsaWV2ZSB0aGlzIGlzIGNhdXNlZCBi
eSB0aGUgc2hlbGwgc2NyaXB0Og0KYGBgDQouL2F1dG9tYXRpb24vc2NyaXB0cy9leHBlY3QvZnZw
LWJhc2Utc21va2UtZG9tMC1hcm02NC5leHAgXA0KICAgICIvRlZQL0ZWUF9CYXNlX1JldkMtMnhB
RU12QS9CYXNlX1JldkNfQUVNdkFfcGtnL21vZGVscy9MaW51eDY0X2FybXY4bF9HQ0MtOS4zL0ZW
UF9CYXNlX1JldkMtMnhBRU12QSBcDQogICAgLUMgYnAudmlzLmRpc2FibGVfdmlzdWFsaXNhdGlv
bj0xIFwNCiAgICAtQyBicC52ZV9zeXNyZWdzLmV4aXRfb25fc2h1dGRvd249MSBcDQogICAgLUMg
YnAuc2VjdXJlX21lbW9yeT0wIFwNCiAgICAtQyBjYWNoZV9zdGF0ZV9tb2RlbGxlZD0wIFwNCiAg
ICAtQyBjbHVzdGVyMC5oYXNfYXJtX3Y4LTQ9MSBcDQogICAgLUMgY2x1c3RlcjEuaGFzX2FybV92
OC00PTEgXA0KICAgICR7VEVSTTBfQ0ZHfSAke1RFUk0xX0NGR30gJHtURVJNMl9DRkd9ICR7VEVS
TTNfQ0ZHfSBcDQogICAgJHtWSVJUSU9fVVNFUl9ORVRXT1JLX0NGR30gXA0KICAgIC1DIGJwLnNl
Y3VyZWZsYXNobG9hZGVyLmZuYW1lPSQocHdkKS9iaW5hcmllcy9ibDEuYmluIFwNCiAgICAtQyBi
cC5mbGFzaGxvYWRlcjAuZm5hbWU9JChwd2QpL2JpbmFyaWVzL2ZpcC5iaW4iIHwmIFwNCiAgICAg
ICAgdGVlIHNtb2tlLnNlcmlhbA0KDQpleGl0IDANCmBgYA0KDQpUaGUg4oCcfCYgdGVlIHNtb2tl
LnNlcmlhbOKAnSBoaWRlcyB0aGUgZXJyb3IgcHJvcGFnYXRlZCBieSB0aGUgZXhwZWN0IHNjcmlw
dC4gSSB3aWxsIHNlbmQgYSB2MiB0byBmaXggaXQuDQoNClsxXSBodHRwczovL2dpdGxhYi5jb20v
eGVuLXByb2plY3QvcGVvcGxlL2hlbnJ5dy94ZW4vLS9qb2JzLzU3MDgyNjM3ODIvYXJ0aWZhY3Rz
L2ZpbGUvc21va2Uuc2VyaWFsDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEtpbmQg
cmVnYXJkcywNCj4gSGVucnkNCj4gDQo+Pj4gK2V4aXQgMA0KPj4+IC0tIA0KPj4+IDIuMjUuMQ0K
Pj4+IA0KPiANCg0K

