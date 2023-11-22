Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86D7F4B93
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 16:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638862.995771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pUG-00043r-E4; Wed, 22 Nov 2023 15:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638862.995771; Wed, 22 Nov 2023 15:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pUG-000417-Ad; Wed, 22 Nov 2023 15:50:00 +0000
Received: by outflank-mailman (input) for mailman id 638862;
 Wed, 22 Nov 2023 15:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5yt0=HD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r5pUF-000411-0X
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 15:49:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c879415e-894e-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 16:49:56 +0100 (CET)
Received: from AM9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::22)
 by AS8PR08MB9291.eurprd08.prod.outlook.com (2603:10a6:20b:5a6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 15:49:41 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::9e) by AM9P250CA0017.outlook.office365.com
 (2603:10a6:20b:21c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 15:49:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 15:49:41 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Wed, 22 Nov 2023 15:49:41 +0000
Received: from b778e6f6b8ff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 173A525E-519F-463B-96C4-587923630C57.1; 
 Wed, 22 Nov 2023 15:49:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b778e6f6b8ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Nov 2023 15:49:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7923.eurprd08.prod.outlook.com (2603:10a6:10:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 15:49:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 15:49:32 +0000
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
X-Inumbo-ID: c879415e-894e-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mj8lEYuGmdUJ5t2MfRXXE76qz4rR24vHvj/QskukTgQR/xHFRfccbfQxD61urRwmx1Swjvn0NZfu3gsImGfynWY4NML47qXlrm72EyX7tIbwhJM5vCYXQYanfSgLQktLFxz1WHPP3Ymw6vZ3UVHeq0quHrKjoglsr6KOivshqQDVITqNbCJHnjYPl+MAhYeH3bpW4OyTjunO/zHItvX/OYH3mJW3HNQ4EKHrZVmwp9mOPIDpm0NCJ+hT3lZbx/9AiXMbxaUyVcSqo8ogOnWQX4GFqNRB8Y1DxQO45Yb3usY7n693jorR9bUrCIfQPoEhcxnnW29Lhl1SFaR36QXmyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRbVzVpwk8rv532XHLH7JbjbPGzTCtp+bSvWpzmbPA=;
 b=hbNVSF5I8T+0sXbefkHc+Wou6laulNDC/XXzoimsF1D5EEWRNwhJlynBxxy3h+ZLbNYskhGkkdtUzfghPdvTfWHsu1TsLTxMW0t005jjcHUO41DQYF0E30Xr6zifyTxpu3QjxWdOBMXXK+mmOxa7xuOiMHfQkAtzTTsRejL2iyVhhU3xDDHivCdg9LN0x1yARHx6zjbQnGmQxBayKZH/AyCe7d45K3/w7TqmNIu0W1XsWeY5SdCOFMZBxNAWqsmvt7mms43dF7iQTX4Do8jyTwZSPQkgQVu65uucRjPpoFJ8vqiI6+CAJocB+QlJRsethzJn+TMwYjSmFFpsr1WRqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRbVzVpwk8rv532XHLH7JbjbPGzTCtp+bSvWpzmbPA=;
 b=7/f8e2D5OCc85nPF8VD21CKrcmmt/y/kwG4uvvy2FhX3XKW+kXXAIsd0SVwtEYLRUa4BYVnEcFm9Zgt/JKc5sbfQCI/rXcuNLA1Zo8vfywe5AVerRBJiQx9RSpcYijGkYDlPkQcqwIB1qQLP2j7Fpn04K4xk3cSXII2LrnqYxLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8a34bde76e218cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVPtiG9sB6wcOT60QuWTKkx+5burEDTJpnv4GDFDnp2S4putbqOymZqya8KcFoTzvlpLB+U2zkXvqWa1GBpq3ezpE3ANQqmKC1/HGaMnKXFbBPlz6SN2myRnk7wpEqKylugr+3OTu0EQbB3xJaLs4za2L4qk1dgQz2EMVJGvq9BWPysISXqJivWlf2LcV/MVLEtZHxSrh+hHukb3i9scYV8iLOpTBRCYCH+Aw2HV7Kycrp3N/yrnwLo3uhEBkSqDyPoKnkIttzARDmvcvNwjjgx9RiybX86bSxQbJcOeX11gi9eqMVUlKVdMclpq+F4m1Gekp/0a2qX64h7cRNAceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRbVzVpwk8rv532XHLH7JbjbPGzTCtp+bSvWpzmbPA=;
 b=E/sHO2BNufbvrFp6MI2cl6DojnGptgwO8uflZKLzq7XmtBpQs8hmPOYExvm01lSWNSHXogZX5wa8jKcl/Us2n0ycMEThfnyjK3xU2W3LhnS3bFK5Knt2sQiq8ofMEt3yzHY2WPcbctHOUy/Ec2vPLWNIRuFHlUPxrSYo+ZfDglviOYNpyvQzeDxoujrCjZSP1/ah+55fOcoKyx0fmlVH59fO9i3gw+F48b7RBcoIxlPY7KdrroMEpPOJ3MHIIYxDm2VkiodoBDmgkDJtLMGL16aJz/W9XWLR9qsraNa8qhmEv5GTstTUCy5KkxHrP6MP+bkZPB5nMQ3NPhFNpPwANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRbVzVpwk8rv532XHLH7JbjbPGzTCtp+bSvWpzmbPA=;
 b=7/f8e2D5OCc85nPF8VD21CKrcmmt/y/kwG4uvvy2FhX3XKW+kXXAIsd0SVwtEYLRUa4BYVnEcFm9Zgt/JKc5sbfQCI/rXcuNLA1Zo8vfywe5AVerRBJiQx9RSpcYijGkYDlPkQcqwIB1qQLP2j7Fpn04K4xk3cSXII2LrnqYxLY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Topic: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Index: AQHaHLkYgzDzOjzraUK+7wQZW0TenrCFOoGAgAACTgCAAUCpgA==
Date: Wed, 22 Nov 2023 15:49:32 +0000
Message-ID: <3222AE09-B511-490E-8298-8808261DEFAE@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
In-Reply-To: <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7923:EE_|AM4PEPF00027A5F:EE_|AS8PR08MB9291:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a8d8d2-0785-4213-7fb3-08dbeb72a40e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jkl5jLjLXr3tUN37pxHphn4R4uaUrvD0u4h+VkLBOg3Th0TmhmhULsaV3+pKMloN2zD34R+NPS9H1hx9XX8vBNt7zc/QhTnvlHfgfGjmwto0JGUvVEclMwdevFCPrts+zLsqnafMcYb4rPZcreU28TAYz6vAGzv2ygj4OsJJiZD3kzS/mPfADPqYo6lfjEupyY5jO2lFvofQJQZmeH9Squbb81o0M2MTLywhkJXN0mffm+o/H5kfyajfycpHyqkSkl0XHFR+nUEOofIBLeVjRXUXtUbASzbw2R9zhwV0ZES6o2OdVvPFYRqwpOojplc7CFLKvpaf28iobolPSm5Dzs4UEWRhGmcHazVEGHS/4fYbs6sok8tGBBD4g825yaATKiY7SckFHk1MmdiFSeYCBk/tDpFa0CYu5cW9BC9tC/SfCbBjC4cuBhYT5tedD/bg2zupp4DrM+3c5GpDbG5+r/rWR5hf3WA3EzZuaKh5D4do56jyth/eEo/kcLcJQB+gGsFge8uCKTsK3zLUpvjhTisIrlOOoDO0iS8yrAokpnLFPA+0Jyh6WYkkqB43I5MZyqfG79SMBuR8QC/+S2o0M2k/o/zpPvTtJyJUsDxNROp12R7lejkUcDxT2jHPsMK/mN7yE0O2dN42cN53iAEElQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(76116006)(66556008)(66476007)(66446008)(66946007)(64756008)(54906003)(91956017)(38100700002)(36756003)(122000001)(33656002)(86362001)(83380400001)(6512007)(26005)(2616005)(6506007)(53546011)(6486002)(2906002)(478600001)(7416002)(316002)(6916009)(5660300002)(4326008)(71200400001)(8936002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9941B4612198814682A8173F5BDFB0A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7923
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79e1b08e-190c-49b8-90e0-08dbeb729e80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4yenan8gC/mpy7Dqg6a51bxTqvd03U7a55dCfgyW4hRH5TeA5oB8NZA+A+BGatl+/El6Kapg6/mORDIHoAY5ANTDuTco0wqwnexg/PGkgAT+kr5AifXPeiDMeLbyb/6Hp2wQl+IMa6GutgUL9/KEVHDKNo1QpF2XkbhFvHPzCMxby/Q+0Hc4zZGAuZQo+oJCjdKNHWqz2Wo/hNumRQGZD7UuMbGw3DS63qhnjxKKZwVO1xWEhRTaBVq3ZmmHaSEaEXux2zdbWU2MopnEi6Md2SQB7lEEnRlmmB+ygUfU1JRIi+mE6altr6eJSj8fRT2DJnRj8UAAG4bv+Wp/7EO9PIYGnLiwrRMNTd5EjXL5+/P2nNeXB97pjTeFfaixZMm3ARMC+8jSeXXtFdc+iL63Px7Yr6M5ahHkzcQe/nbV48CI4/JfYb6+SgcnFnlQeIllycEI2wYr1ix0xPruMOzndSkypbzv5Z/0yGvJmLq6VH8XawqF4Fk3HFanMF+OInXgB4j/Ggpo0PS9yWZCKRvSdEUaCzq1o8XBHy309IeIMB7trd/W6jAVFzxAdBfi+434lNPaFHIjn1jBqVPsxLHW/WEnQpBLHcM6ieUxjS/25xjVoRX5VbARh2fge77z/0OIxIvbj8vpBs60BW8dmRz4g0h/Au4K7srpl8nORnPn4ekTKSYM5PrTCAQuNpjiRR9IMF0LYy/4uRZBxl2a2+V0Lio3n8nW9B1i7wks4AALO8nU6LKXXxCulJK/XwBP7DjC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(47076005)(81166007)(36756003)(5660300002)(70586007)(54906003)(86362001)(70206006)(316002)(36860700001)(356005)(83380400001)(26005)(40480700001)(2616005)(336012)(82740400003)(6512007)(53546011)(40460700003)(6506007)(8936002)(6486002)(2906002)(478600001)(6862004)(33656002)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 15:49:41.3801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a8d8d2-0785-4213-7fb3-08dbeb72a40e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9291

DQoNCj4gT24gMjEgTm92IDIwMjMsIGF0IDIwOjQxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDIxLzExLzIwMjMgODozMyBwbSwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+ICsgQ0MgaGVucnkNCj4+IA0KPj4+IE9uIDIxIE5vdiAyMDIz
LCBhdCAyMDoxNSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gLVd3cml0ZS1zdHJpbmdzIGlzIHVuaGFwcHkgd2l0aCBhc3NpZ25pbmcg
InhlbiIgdG8gYSBtdXRhYmxlIHBvaW50ZXIsIGJ1dCB0aGlzDQo+Pj4gbG9naWMgbG9va3MgaW5j
b3JyZWN0LiAgSXQgd2FzIGluaGVyaXRlZCBmcm9tIHRoZSB4ODYgc2lkZSwgd2hlcmUgdGhlIGxv
Z2ljDQo+Pj4gd2FzIHJlZHVuZGFudCBhbmQgaGFzIG5vdyBiZWVuIHJlbW92ZWQuDQo+Pj4gDQo+
Pj4gSW4gdGhlIEFSTSBjYXNlIGl0IGluc2VydHMgdGhlIGltYWdlIG5hbWUgaW50byAieGVuLHhl
bi1ib290YXJncyIgYW5kIHRoZXJlIGlzDQo+Pj4gbm8gbG9naWMgYXQgYWxsIHRvIHN0cmlwIHRo
aXMgYmVmb3JlIHBhcnNpbmcgaXQgYXMgdGhlIGNvbW1hbmQgbGluZS4NCj4+PiANCj4+PiBUaGUg
YWJzZW5jZSBvZiBhbnkgbG9naWMgdG8gc3RyaXAgYW4gaW1hZ2UgbmFtZSBzdWdnZXN0cyB0aGF0
IGl0IHNob3VsZG4ndA0KPj4+IGV4aXN0IHRoZXJlLCBvciBoYXZpbmcgYSBYZW4gaW1hZ2UgbmFt
ZWQgZS5nLiAiaG1wLXVuc2FmZSIgaW4gdGhlIGZpbGVzeXN0ZW0NCj4+PiBpcyBnb2luZyB0byBs
ZWFkIHRvIHNvbWUgdW5leHBlY3RlZCBiZWhhdmlvdXIgb24gYm9vdC4NCj4+PiANCj4+PiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4+IENDOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gQ0M6IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+Pj4gQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4+PiBDQzogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQu
bWFycXVpc0Bhcm0uY29tPg0KPj4+IENDOiBSb2JlcnRvIEJhZ25hcmEgPHJvYmVydG8uYmFnbmFy
YUBidWdzZW5nLmNvbT4NCj4+PiBDQzogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1
Z3NlbmcuY29tPg0KPj4+IA0KPj4+IHYyOg0KPj4+ICogTmV3Lg0KPj4+IA0KPj4+IEknbSBhZnJh
aWQgdGhhdCBhbGwgb2YgdGhpcyByZWFzb25pbmcgaXMgYmFzZWQgb24gcmVhZGluZyB0aGUgc291
cmNlIGNvZGUuICBJDQo+Pj4gZG9uJ3QgaGF2ZSBhbnkgd2F5IHRvIHRyeSB0aGlzIG91dCBpbiBh
IHJlYWwgQVJNIFVFRkkgZW52aXJvbm1lbnQuDQo+PiBJIHdpbGwgdGVzdCB0aGlzIG9uZSB0b21v
cnJvdyBvbiBhbiBhcm0gYm9hcmQNCj4gDQoNCkkgY29uZmlybSB0aGF0IGJvb3RpbmcgdGhvdWdo
IFVFRkkgb24gYW4gYXJtIGJvYXJkIHdvcmtzDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

