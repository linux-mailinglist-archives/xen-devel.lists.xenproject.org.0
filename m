Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD55AE474
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399709.640978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVV3L-0008He-N2; Tue, 06 Sep 2022 09:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399709.640978; Tue, 06 Sep 2022 09:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVV3L-0008Ey-JP; Tue, 06 Sep 2022 09:39:31 +0000
Received: by outflank-mailman (input) for mailman id 399709;
 Tue, 06 Sep 2022 09:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVV3J-0008Em-RL
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:39:30 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc67c12f-2dc7-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:39:27 +0200 (CEST)
Received: from DB3PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:8:1::30) by
 DU0PR08MB9001.eurprd08.prod.outlook.com (2603:10a6:10:466::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Tue, 6 Sep 2022 09:39:23 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::bc) by DB3PR06CA0017.outlook.office365.com
 (2603:10a6:8:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 09:39:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 09:39:22 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 06 Sep 2022 09:39:22 +0000
Received: from 27659bedd814.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7595D721-0F25-4534-B7E1-B9CD564ECEA1.1; 
 Tue, 06 Sep 2022 09:39:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27659bedd814.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 09:39:13 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB8188.eurprd08.prod.outlook.com (2603:10a6:10:3ef::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 6 Sep
 2022 09:39:10 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 09:39:09 +0000
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
X-Inumbo-ID: cc67c12f-2dc7-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GmzlmGZQfNWypm25pveE4q1TIO1hbeAzi1dOHnDO33XVcYdhGK7sB9h82eLGGaU9Xm3I4xWHUyWn1hy+2g0WilV0XnaGye4R8Wd8Lb4VRLY00W965EXDezyEZRVh7o5pKfIZvfG2B9P/LUmiKFni7BzsWHbaNtdRkzI7DDosZre82dZk5oVPNrvcFwJxPZ29J1no+pjNroRGq4hmnX4rzlveBab/MzRI3PovDxz+IWaaBCuX+BdFgAFJ06el9bVNustZ5uLHpcYzIBTrmo6ftRVW9OA+6FRild38gB01W71Md8xSXhmwJBd6GU/bLX4uB17VT6otl4SsEpnalr9yvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSqeE592xvhkUBWetSl34h7RM7sjBOZA7wawoa34qmU=;
 b=TQ3uFQQxbp9kZpcgsfQZ8i02ZeBIPjSXopyEzlGp8WDDE4rMgMdmGBE9Pl1uVd34C0ozaFnLqciO9TufNoP3FLd5GhzFix1XepoAgTDaN8sKfBgGgUAagnnL8rFtbj6TEsXTG9PCCeMq4gbWwObxHvL7kO//nlzqfOkqpKANtBkIP7NlfAO9XW7HnGscrFJD279Qm6Ea3A/e7DgEjjhYoi65jiVB+FIxORGX2NHqot36sjxfTZaq3mhuZ3DxCfklDw/HQx8BkjTzCpfH7VTELYpOBwFhmAAYJMAGP/ZBG7tJ5EooRWGD8Q7XQBxrq3CoSGqpfEqppVDrbOgxXGCoDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSqeE592xvhkUBWetSl34h7RM7sjBOZA7wawoa34qmU=;
 b=h9XN0jaM1r41Kw3uRUxFFGtGqWzc/XSI/0emCz66zXkxYfNSBuyZY50pLL6ZgiJ1f/vUZCSKnwCW6lcPtcmDFqTcoDqcgOV+4cI1JukZ7kZto7aOe+opKFlbn6qU6O6fyqdrZkE2CkvuFvxlDi/qRf2hW5mpKt1UGhQPE8IAER4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bee93cb2331094b5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsPcP2LOmCtCaCfq1O9eq5Tqdf38bd9YoEXmcB45tpmWUaXwFOz8iLofVStNz1c6noRSdVXjx5Wgt5UUD6t69g76re18EYY1tN6dbQj+Qb0ARxCdO2XQiN4CxYdA9WNcxh7BBgH7R0XFA4kSQKLXQxMh8Pyns3NIrQTkKY81FCVcJbiJnR16DkREYPRiFHBilhgcWe/HOypLUuCVEZRbcrNcVoWZr06kPAbBLwp52bCf9+WlHUcBJqZK9bZDTLYvWvwxM6t9gLebVfD+0G+zLxlXFBLWRFZ1sChLgYG07XbSugyrzBKxNkZOu4wfuLMkr9Eg6FSmk+iRZRT77Luamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSqeE592xvhkUBWetSl34h7RM7sjBOZA7wawoa34qmU=;
 b=FLisW3OzzA4VoBErPLu3eoyiNvNwIltO1+7Lp89/XPRTCmlNcOU65/5rujm9BO6tHIA0e8aAYxVEiEHMobqGbr29NLGf7TPADHEoWtRNmAem29WypzRh/NDPK3TUEEeijZRf1Q9pNVwBWEYXbFTEV2bEELg/pyO0t4L19277TOJxRpMxSlsVcq6SSTjVqfblkkSjnoSyby0tqbIvSMytB26Sj8vfesGTWJa0JmIHkHnbBfo6acLa/57WeGpE2+Tv/SxgeXIvt9RXsvbSI9JXQvnL33s+TAgffwE0SToOIx1qDTjU0GArOmVrkC4enf7XchBVAFhjWrQ0pjRKsixqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSqeE592xvhkUBWetSl34h7RM7sjBOZA7wawoa34qmU=;
 b=h9XN0jaM1r41Kw3uRUxFFGtGqWzc/XSI/0emCz66zXkxYfNSBuyZY50pLL6ZgiJ1f/vUZCSKnwCW6lcPtcmDFqTcoDqcgOV+4cI1JukZ7kZto7aOe+opKFlbn6qU6O6fyqdrZkE2CkvuFvxlDi/qRf2hW5mpKt1UGhQPE8IAER4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYveWaAk0wZPH8TEaypPBHbuXyK63NTxAAgATeK4A=
Date: Tue, 6 Sep 2022 09:39:09 +0000
Message-ID: <CC75ADF3-C7BA-4AE7-B5C0-22B0EA87F08B@arm.com>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <be43a751-2ceb-df74-7525-b84505d341b8@xen.org>
In-Reply-To: <be43a751-2ceb-df74-7525-b84505d341b8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8d96e6cc-88ba-4453-3a2b-08da8febadf8
x-ms-traffictypediagnostic:
	DU0PR08MB8188:EE_|DBAEUR03FT042:EE_|DU0PR08MB9001:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z2JLkn5/StRdOft2S8jmd49GTi2E/0XVMOOKhhIwxMQN+J+t8cvPhTWW3XydXbvIuqcoqnOwWP+6x0eh40H+lNnCD+B8z7lgQqvhYYYuAdqZh++IbvZCU4V+nvUbBypCVXhv8+wJ6C11EjnN7/N+aSSgsYmHgIYQj/heYToRVCls6GVOj1UM+vdOsQ1sdXB49LSetWmh4/zLx2aXQWhWccL10ZXtIdbPAAa6P77RwXdyuXSE0JTw5gNAEx8DVkkcmuroM9gvSEtPYB1ynzEY1n8VJpIxud0hQYn1Maq400ktw+VoRce0yFO+317SF8majzAbqYz/X4hkiN7W4LF0UFBLImP9srepl+X/+4F+4mIlFbaYcCIzL+oFHOoSdgN/GvCTqmuu4JhN+j95AuPXalQUCx7zADhtcaDeDqCl2hDbSiADlflY3eVYazah1G+gswiwqFKs58gZlF5oy45HMF/Q0mtxf4LGww3BkFfNeWsG1biWVut8jszPXc0zHNsFce8fGX1sBFb0T9yjm8raDRSRtPmdl3KgvzqEKWuESpiDDBPwsE7G7JG541VG9/lIYYwrxrtpaoMgdJ5TJCNg3WrM0X+7vkkMPdvCsHa9Yhl9x1sgmIht2GVxV1dQo0C4rSA/gXoVlTHVQi//ezf2WxWhEUiLmOPm+d7z8PTsXC14iM/Gcb9lljvv2lN/VgXdSoIkm5FEWzrm8/lgM47btfgzeTZa9WlxPxbU3NgktKsgyBlmEqJsa6OTgmCceyAfFLGXn2yJDZlNP9AyLtUXo7SU1SC7liFZDyGOcVPIWT4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(41300700001)(8936002)(33656002)(38070700005)(53546011)(122000001)(478600001)(66476007)(4326008)(66446008)(64756008)(8676002)(2906002)(66556008)(83380400001)(91956017)(5660300002)(76116006)(186003)(38100700002)(6506007)(6486002)(36756003)(66946007)(86362001)(6512007)(54906003)(26005)(71200400001)(6916009)(2616005)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CB62400E190FC4E97642FCDD0F1CF1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8188
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65283d5f-09fe-4f9d-330e-08da8feba655
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8VllG15073d8iFNKb4vV27w8g6OI5LVh/f36sJxvm0UIS2M4WTLj4GlZ+3tP8O96WwbMRkJWP6P23ZjcYX3nNb1Grr23OzIwQ6L8bCJXyI9APj2NwM5KxaP8pUlkfFbYlNkVeDD3ZMc0DB0aFG698osTCZgSk5xp2q3UmKM7pf2moK61NX+kC9lv/bCxuazskwHFFsKGkWHNDUaCjQZWfUe/+yfmrM67C/he2x93oqT54AdM97YhdVgG2qEP43I7/NLG7K5AMeUhlUWcr+W8B+yhwHJy2eoFKYPaR/ryBjncqHfpM7ZF6ettePU4EoOHjmHkxZS7FP+yeprHLMOyjPSEa6rc+OAMTR+yA2z4fLFKa9Qfv1y8uvaSkhk+R3KomGqaE0YOa348p8XK8E7RwQyofruxpevW/eMV0sJ1Gb0g04C2+a+i3qxrDrOw58YznjcERCwzCZabpgqNox3OYg92CwOftBf18+kcPk6uB/Bw29eKN1WrPNPnRjt0T6s8HugAI6+RWBLwz6Yrny1AnFO1cvMaq2T0NFIv1WZeJL2uA7UVGrphyXfX8HixCo//NFVGTK6qeaE07BJoKkPuw8rySKbBU16eGNjxuOlAfWKGsJyQ8iFfvpFQoCFyeDwcVhbxezBQSudmtQzH6FuHHctei2MOA6XjlD8dPIes+np0BcK3Wtj1SfwAJ0XALZ6B/Tk5ZAMpoJQYtZljtroCeMqox6k0w9wrTYcZ2nS3Y9JPE00lU8aH7C3z4yHHYE9A8imFAHV5XFdG2D0Aajg/6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(70206006)(356005)(70586007)(47076005)(36860700001)(5660300002)(33656002)(54906003)(316002)(6862004)(36756003)(40480700001)(4326008)(8676002)(86362001)(2906002)(8936002)(82310400005)(6512007)(41300700001)(53546011)(478600001)(83380400001)(2616005)(26005)(40460700003)(336012)(6506007)(82740400003)(186003)(6486002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:39:22.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d96e6cc-88ba-4453-3a2b-08da8febadf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9001

SGkgSnVsaWVuLA0KDQo+IE9uIDMgU2VwIDIwMjIsIGF0IDg6MTggYW0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBPbiAwMS8wOS8y
MDIyIDEwOjI5LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IGlzX21lbW9yeV9ob2xlIHdhcyBpbXBs
ZW1lbnRlZCBmb3IgeDg2IGFuZCBub3QgZm9yIEFSTSB3aGVuIGludHJvZHVjZWQuDQo+PiBSZXBs
YWNlIGlzX21lbW9yeV9ob2xlIGNhbGwgdG8gcGNpX2NoZWNrX2JhciBhcyBmdW5jdGlvbiBzaG91
bGQgY2hlY2sNCj4+IGlmIGRldmljZSBCQVIgaXMgaW4gZGVmaW5lZCBtZW1vcnkgcmFuZ2UuIEFs
c28sIGFkZCBhbiBpbXBsZW1lbnRhdGlvbg0KPj4gZm9yIEFSTSB3aGljaCBpcyByZXF1aXJlZCBm
b3IgUENJIHBhc3N0aHJvdWdoLg0KPj4gT24geDg2LCBwY2lfY2hlY2tfYmFyIHdpbGwgY2FsbCBp
c19tZW1vcnlfaG9sZSB3aGljaCB3aWxsIGNoZWNrIGlmIEJBUg0KPj4gaXMgbm90IG92ZXJsYXBw
aW5nIHdpdGggYW55IG1lbW9yeSByZWdpb24gZGVmaW5lZCBpbiB0aGUgbWVtb3J5IG1hcC4NCj4+
IE9uIEFSTSwgcGNpX2NoZWNrX2JhciB3aWxsIGdvIHRocm91Z2ggdGhlIGhvc3QgYnJpZGdlIHJh
bmdlcyBhbmQgY2hlY2sNCj4+IGlmIHRoZSBCQVIgaXMgaW4gdGhlIHJhbmdlIG9mIGRlZmluZWQg
cmFuZ2VzLg0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5j
b20+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjM6DQo+PiAgLSBmaXggbWlub3IgY29tbWVudHMN
Cj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wY2kuaCAgICAgfCAgMiArKw0K
Pj4gIHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMgfCA0MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGNpLmggICAg
IHwgMTAgKysrKysrKw0KPj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgICAgfCAg
OCArKystLS0NCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oIGIv
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oDQo+PiBpbmRleCA4MGEyNDMxODA0Li44Y2I0
NmY2YjcxIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGNpLmgNCj4+IEBAIC0xMjYsNiArMTI2
LDggQEAgaW50IHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlc19hbmRfY291bnQoc3RydWN0IGRvbWFp
biAqZCwNCj4+ICAgIGludCBwY2lfaG9zdF9icmlkZ2VfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAq
ZCk7DQo+PiAgK2Jvb2wgcGNpX2NoZWNrX2Jhcihjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
bWZuX3Qgc3RhcnQsIG1mbl90IGVuZCk7DQo+PiArDQo+PiAgI2Vsc2UgICAvKiFDT05GSUdfSEFT
X1BDSSovDQo+PiAgICBzdHJ1Y3QgYXJjaF9wY2lfZGV2IHsgfTsNCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kt
aG9zdC1jb21tb24uYw0KPj4gaW5kZXggODllZjMwMDI4ZS4uMGViMTIxNjY2ZCAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4+IEBAIC0yNCw2ICsyNCwxNiBAQA0KPj4g
ICAgI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPj4gICsvKg0KPj4gKyAqIHN0cnVjdCB0byBob2xk
IHBjaSBkZXZpY2UgYmFyLg0KPj4gKyAqLw0KPiANCj4gSSBmaW5kIHRoaXMgY29tbWVudCBhIGJp
dCBtaXNsZWFkaW5nLiBXaGF0IHlvdSBhcmUgc3RvcmluZyBpcyBhDQo+IGNhbmRpZGF0ZSByZWdp
b24uIElPVywgdGhpcyBtYXkgb3IgbWF5IG5vdCBiZSBhIFBDSSBkZXZpY2UgYmFyLg0KPiANCj4g
R2l2ZW4gdGhlIGN1cnJlbnQgdXNlIGJlbG93LCBJIHdvdWxkIHJlbmFtZSB0aGUgc3RydWN0dXJl
IHRvIHNvbWV0aGluZyBtb3JlIHNwZWNpZmljIGxpa2U6IHBkZXZfYmFyX2NoZWNrLg0KDQpBY2su
DQo+IA0KPj4gK3N0cnVjdCBwZGV2X2Jhcg0KPj4gK3sNCj4+ICsgICAgbWZuX3Qgc3RhcnQ7DQo+
PiArICAgIG1mbl90IGVuZDsNCj4+ICsgICAgYm9vbCBpc192YWxpZDsNCj4+ICt9Ow0KPj4gKw0K
Pj4gIC8qDQo+PiAgICogTGlzdCBmb3IgYWxsIHRoZSBwY2kgaG9zdCBicmlkZ2VzLg0KPj4gICAq
Lw0KPj4gQEAgLTM2Myw2ICszNzMsMzkgQEAgaW50IF9faW5pdCBwY2lfaG9zdF9icmlkZ2VfbWFw
cGluZ3Moc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgcmV0dXJuIDA7DQo+PiAgfQ0KPj4gICtz
dGF0aWMgaW50IGlzX2Jhcl92YWxpZChjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBsZW4s
IHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgcGRldl9iYXIgKmJhcl9kYXRhID0g
ZGF0YTsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBzID0gbWZuX3goYmFyX2RhdGEtPnN0YXJ0KTsN
Cj4+ICsgICAgdW5zaWduZWQgbG9uZyBlID0gbWZuX3goYmFyX2RhdGEtPmVuZCk7DQo+PiArDQo+
PiArICAgIGlmICggKHMgPD0gZSkgJiYgKHMgPj0gUEZOX0RPV04oYWRkcikpICYmIChlIDw9IFBG
Tl9VUChhZGRyICsgbGVuIC0gMSkpICkNCj4gDQo+IEFGQUlDVCAncycgIGFuZCAnZScgYXJlIHBy
b3ZpZGVkIGJ5IHBjaV9jaGVja19iYXIoKSBhbmQgd2lsbCBuZXZlciBjaGFuZ2UuIFNvIGNhbiB3
ZSBtb3ZlIHRoZSBjaGVjayAncyA8PSBlJyBvdXRzaWRlIG9mIHRoZSBjYWxsYmFjaz8NCg0KWWVz
LCBXZSBjYW4gbW92ZSB0aGUgY2hlY2sgb3V0c2lkZSB0aGUgY2FsbGJhY2sgYnV0IEkgZmVlbCB0
aGF0IGlmIHdlIGNoZWNrIGhlcmUgdGhlbiBpdCBpcyBtb3JlDQpyZWFkYWJsZSB0aGF0IHdlIGFy
ZSBjaGVja2luZyBmb3IgYWxsIHBvc3NpYmxlIHZhbHVlcyBpbiBvbmUgc3RhdGVtZW50LiBMZXQg
bWUga25vdyB5b3VyIHZpZXcgb24gdGhpcy4NCg0KPiANCj4+ICsgICAgICAgIGJhcl9kYXRhLT5p
c192YWxpZCA9ICB0cnVlOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+
PiArYm9vbCBwY2lfY2hlY2tfYmFyKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBtZm5fdCBz
dGFydCwgbWZuX3QgZW5kKQ0KPj4gK3sNCj4gDQo+IE90aGVyIHRoYW4gdGhlIGN1cnJlbnQgY2Fs
bHMgaW4gY2hlY2tfcGRldigpLCBkbyB5b3UgaGF2ZSBwbGFuIHRvIHVzZSBpdCBpbiBtb3JlIHBs
YWNlcz8gVGhlIHJlYXNvbiBJIGFtIGFza2luZyBpdCBpcyB0aGlzIGZ1bmN0aW9uIGlzIG5vbi10
cml2aWFsIG9uIEFybSAoZHRfZm9yX2VhY2hfcmFuZ2UoKSBpcyBxdWl0ZSBjb21wbGV4KS4NCg0K
SSBkb27igJl0IHNlZSBhbnkgdXNlIG9mIHRoaXMgZnVuY3Rpb24gaW4gbW9yZSBwbGFjZXMuIEFz
IHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgZHVyaW5nIGRvbTAgYm9vdCB3aGVuIHRoZSBQ
Q0kgZGV2aWNlcyBhcmUNCmFkZGVkIEkgZG9u4oCZdCBzZWUgYW55IHBlcmZvcm1hbmNlIGlzc3Vl
cy4gV2UgbWF5IG5lZWQgdG8gcmV2aXNpdCB0aGlzIGZ1bmN0aW9uIHdoZW4gd2UgYWRkIEFDUEkg
UENJIHBhc3N0aHJvdWdoIHN1cHBvcnQuDQpJIHdpbGwgYWRkIFRPRE8gdGhhdCB3ZSBuZWVkIHRv
IHJldmlzaXQgdGhpcyBmdW5jdGlvbiBmb3IgQUNQSSBQQ0kgcGFzc3Rocm91Z2ggc3VwcG9ydC4N
CiANCg0KUmVnYXJkcywNClJhaHVs

