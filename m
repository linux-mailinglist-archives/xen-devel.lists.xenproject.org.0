Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDS7AvrQ3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:18:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C43EB2B3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281077.1564128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFIk-0005Ex-Sp; Mon, 13 Apr 2026 11:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281077.1564128; Mon, 13 Apr 2026 11:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFIk-0005Bt-Q3; Mon, 13 Apr 2026 11:17:58 +0000
Received: by outflank-mailman (input) for mailman id 1281077;
 Mon, 13 Apr 2026 11:17:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCFIj-0005Bn-8f
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCFIh-002fqo-2b
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:17:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd0e3-bab6-0a2a0a5309dd-0a2a450abe54-6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:17:56 +0200
Received: from [52.101.84.66]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd0e4-ee98-0a2a450a0019-346554427cbc-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:17:56 +0200
Received: from CWLP265CA0345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::21)
 by DB9PR08MB10380.eurprd08.prod.outlook.com (2603:10a6:10:3d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:17:50 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::7f) by CWLP265CA0345.outlook.office365.com
 (2603:10a6:401:5a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:17:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 11:17:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS1PR08MB7426.eurprd08.prod.outlook.com (2603:10a6:20b:4c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:16:46 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:16:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CY37ZnH3grwjZLs+4Kq76tz0uB7ss/0KEzOsLs1YrvAKXch3BjGbL/0FdQG9GaCyKAItXqey1BJ1YjXWfpIN61OS79UEQS33mEFxuKmOE89WKPEV2qp7O3YRfQM+jzhWwsI3eZ3ABUE34Al6MOum6t9ECzGFSy19Tk84dJzF+YgEMOCQzGpr2xse5OZDXTBSYRaqZ3J3j+0Tr2Myloq59oQoWMR+NcjXOH9IqGTuHo++QTLvp5qj8tZq8AN/IOAAUkChd8uKrFFNqbLWcnF3PZjGXeAW8dyujnA22haCHw0MuBWIhxxeGLRKDNVbc5mIroyekJoLy8QE6wP2DI3Bcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHXkUK2ksaHQIaQO4rvqTEn0qfD/qzYhGUrXViw9+Wo=;
 b=xQbUlCLVxAOSGcZVNBznGQjQdlh1npMrcF8hh4yiVBT4Rkn6hgASbOP41kHkKS+fhUgYR/QlNHhOoiXKHgkrPOi/P7MYKZMUyYSsoRs31EP/wXn26PejiXn5J5BCAbS7N5xDtLU8B8Hf5IbUcBZ6vElC1jltSZcXY/iTlRr8/Fyt5WfeITQzJyPeCFBjRWM9Ttt4RJb0x/XAHlTnXQeKj0buLKNfHH/DITQmcbprLSnfkalwfCK7cC4smCJoj9vWDOLtgSv/Vm5fNdKvN5/5gp87w2w5PzviWYJlvA/8A4FuvaIZNpAMk0OP/GwRKYGCpXWGLTKO/ljWIaRu0iStYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHXkUK2ksaHQIaQO4rvqTEn0qfD/qzYhGUrXViw9+Wo=;
 b=EBGLyx18M+TlI1BaNUHwrnlffNXs1coRuYTL2tzKoIRkPSPzUxDXQjHBazPdgHrpD7bTnEuvyxlBmVg8ikbX56eQbWjxKtzMTRqxbiHlwIwqQ29A3rUKgREybb+artFaii/7HqKLAenr09Eoj+wIlU78nMvVO/3V3E7OWSiVOIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drK5cJm6uGNGpmGJQYYrGBWFVAYY61Dd8LEZDCo14oY2+mIUajACphsi428C3wxIL3n5g4lF42iXezD+hRYgybIlDNnurHU/eB71bTJZLbV3v1eYI3PsmIbDeCVmtwTdY+opmPht7OEi2RqyfdLeDY0C1oz6epxwLUb2Fmv6m/iIoD7z2CyjmpX+30zaSnlW/WZfFprn0+stwlUsnxU5cjCHJ3IcM0LCSTgfrNMY7lWllEAQgM86fn2sOwYd5m0Mrkdth2N3z345/I/9JlH0dSWHJGvUvyFoidRNDF4eis28ONZo8F3GScgdtlqUor774U0NKJOw9pFIAZONnJ9WUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHXkUK2ksaHQIaQO4rvqTEn0qfD/qzYhGUrXViw9+Wo=;
 b=OjkkbgqOxeoXaYuiMdux6P2u6I2AGeSQvoQaS5JWmWDgmz7SynfN/mbV0ct3zxJH3fAaRZmvi00GAnJ+HW2QPxwI6qKDvpQoLiJy3CbW/xbvxg5nSfx7G4fCIFYB6uRkgEq5xrIxKAVI4qLmagWQHdw+WYVS5l0RDuLECNn5tMm9e8iAILeQ0VB2ummM0TkEYxMQwzVffHCsUFlxDf00MevQAm2K3u1n0SQYp0czpbawRIobNMDg486PpxTIUE/72muUcOE+PYPydcj/p+6OyhSV7I4kYniLS8aXDwBCz9xdtq3tXaLkAhGmlgHfMnNPGx0hmXYBGYM4+/sjvoSzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHXkUK2ksaHQIaQO4rvqTEn0qfD/qzYhGUrXViw9+Wo=;
 b=EBGLyx18M+TlI1BaNUHwrnlffNXs1coRuYTL2tzKoIRkPSPzUxDXQjHBazPdgHrpD7bTnEuvyxlBmVg8ikbX56eQbWjxKtzMTRqxbiHlwIwqQ29A3rUKgREybb+artFaii/7HqKLAenr09Eoj+wIlU78nMvVO/3V3E7OWSiVOIM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 13/23] xen/arm: vsmmuv3: Add "iommus" property node for
 dom0 devices
Thread-Topic: [PATCH v3 13/23] xen/arm: vsmmuv3: Add "iommus" property node
 for dom0 devices
Thread-Index: AQHcyzcD3QNwY3yhCkub84C0ooY0iQ==
Date: Mon, 13 Apr 2026 11:16:45 +0000
Message-ID: <7A2DBEB7-B07D-4587-8DD0-3E0F49EFC4B0@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <7911f13c4fa495fb330eb611e41465f8897fa87f.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <7911f13c4fa495fb330eb611e41465f8897fa87f.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS1PR08MB7426:EE_|AMS0EPF000001B7:EE_|DB9PR08MB10380:EE_
X-MS-Office365-Filtering-Correlation-Id: 84183a24-ef8a-47bb-110b-08de994e4c6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 cbRenezuahVnEcKLfEqlfUth6D9wyAkoyxfSipQ0FZASzwocW1QCiUrxYqCLj+zNbWjHct6533FSyoyauhCsWfPGAnyZ4sDMYWmdTbhHQf1T3qSnveTl1EXMY07SCoN8MdgeJy7jZJGHlas79nMVrgOLNwA2PjO9KnUr1tP9xOKr9Kvigo3vlDQcq666+2RAOrfpEfMm8d0FjbmPpevSRrpYjIwAex4Yug0aCX5WONw44D2WlHMs7lo8h25n2qkxT6V6y5aYrQpZmg37524ShTi2IUrm46Ss3A7pYj0CNvLSOWHztmXIf+OZL6nvwFJymdEypLu2Ou0iLXWPi+veUfTKSO8mKg4RlXTNAlegygQQGhrlCzW80x+Bi86LG4062yNB1gSwqQjL6dJawveY0V+3TP2bzNrGWF3yZA5b7rHdJFs3OwIPzxNzCsJG3p45ZMfDuooLOBDy5aTT1xYW5f3LNoptVCffzdLbLuXzRjWPavnjoqUPTLaQLXiShDdkp5oHeFxWvirVMnFzgB/4P0wKsNo29QjwSS7lva3qKPlOSk5xUXPzwgOj/FSs4zTZEawIEC4Vb7sjbhF0t8ZTuxJssOHcYgOnTQXTd8C3Zju3WPCRZFNT0RS18e6Kmceg2jilfpJ1nLj5M3dDVH3W9W0bEYm0S7sarRzd3rTRT4uvsfJ8ONeHTweHEnXJc4mnYM8KiZXRjJBOwNNcnerDQ5ssHx4MRbnjsO8EqUBK5StzkJwpZJvSgGBH6hvnf9zZ8qPiQzMhXLqkD3Lb1483RS+uK29fKCqJcipNKBEpmKI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B0A523B5710CB499DFCB0229D33D694@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 fdQeN7LxKWbD3knVmJLnjNTZYKG0gZBQa5UK/6MpOTgFEwLoasRoRLCOOZvFvcibY0F7hFFPScRA2TdzJBZKgRbVvDO/dQ8V1Bf/ilQe70V8PupgxES1qM7qx4HJSyxwwAHT0yk2X4KSqdUBR9doTPYxcW8gqUFF/SRmrLOruDtWzhYUJdIBdD3UuyVui0lurYQ4gQisaOU/2V9IFkJpqdgwPle1hCNEcrGginqjeu0Z4XlA113rfg2t7McN05OMsGs38KCpq9lPPVJrf2NGkwPZ3Cjk39IuYzrqKJYIBQHWoqnFIWTL+5j4Oy8L7REtyWoSEqBLBATRMcYDpMcFXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7426
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	adfb2194-bba8-4bb0-5851-08de994e25ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|14060799003|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qeoHspKg9oAF5PRnYQ2CM8nXOFWeEnU66tuwabW+ipV0yHKdg3kBjkK8zt1zhsPrfLxY9nzdk8/6nGZehfiqkKAYc6oWk34njot6Y+/tMH1VwPG0wnWsFPwJZGzbsL2J5mgZTJBrJrfcj6C+WETg9IX58Qe1P1cVQ//g0D63vvhVjgDn/b2EZ6RIqIosfEaM3qZBXgF4a4QAKokqhgDxWASbmsvgJKRleMkhg9Ipj2kjGABrrzRtEkNc39AiHr4jS/YsbMPNOrUyRFTsmJygmSqrc+w5GAY0hBKYSLh5EcXP8PWTQaItaxc5XufBnAI6NkDMQzcEsQEXHPwW1IRiWs5dkZLSjaczZYEopK2F9XXu6zpVPU2u11ozX9tq532WCjdIfgGfh0T9dmG5GpTzv8n4sTmAthrndrpf3hH6uiXi/LluZ2E5qpZP5xNDStrRVJEq2Nc3xRqd7cyGKjBeluHZ7Xs/qExVj+6bdfvmAZGKIv3G/WjqFEJBs9AuFe67MSnet2i7H47pDrYj5PoODCBGEWfcIIkcUgGnmwnqIJToVOA52OuLzjTeE3VpSAVHuPN8s9YRal/UkHzfx493ktd7jtnuiwO//CfPt7ql1Di8UDU/3GOPszcxT8oRz1qQ2RH58ywMif2IXopGY09cFuMR7VMfI6z5+Gus/Q6TIK6pRqpiLbEQCS8KI0XQQJsm958IhsUH3EpoF39r1Ow7bMQokRddA70xp9KxA+ca8Hb5nzZjU61toaSrD67eku+wLksfqdfRx+Yf7lkX5fOotg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(14060799003)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sfdLC97EDzyXCKVIezEOv3D+GFgtzCFhEhTujnj0Yq5Y2Ejqoe2J+yL4W5pDo5SfvdFh/0sbaIuXgVtYY3A89SinPOqIqGbV9Y4Yc/lfio7ykPduEeWHERT1Q6HzjoifdCecYwSB1FcI35t1cEzUTO1SJ2A0faqLK7oLqMjyM+k+ZBhhI1qFbfCrVjsBp3jQ/98Al8kOeYvetjF/vTN1xS7w0vk6j91jD+pSQnlAubXyBGtmcNRkna18Muqba5AfpHj36RAFPSC549VDqoFh/v5bRvRe6NcXoerw70wy0FTM+JtIATvblUHgOJ7I74Fl6svCru6P05xnDS1ZDNzkteZdc1AlY/9gKSB8gQvmLYptTNR9HkeJoGKM7veU276hacTEbde5wLdd4Ort7qFYJB5PrA5/xl0P86sznTiLfLXMYFA8sTll3xQ+bN1oBbwx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:17:50.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84183a24-ef8a-47bb-110b-08de994e4c6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10380
X-purgate-ID: tlsNG-4011c0/1776079076-BE3510B1-26B28D26/0/0
X-purgate-type: clean
X-purgate-size: 1914
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,epam.com:email]
X-Rspamd-Queue-Id: 575C43EB2B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+ICJpb21tdXMiIHByb3BlcnR5IHdpbGwgYmUgYWRkZWQg
Zm9yIGRvbTAgZGV2aWNlcyB0byB2aXJ0dWFsDQo+IElPTU1VIG5vZGUgdG8gZW5hYmxlIHRoZSBk
b20wIGxpbnV4IGtlcm5lbCB0byBjb25maWd1cmUgdGhlIElPTU1VDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
TWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQo+IC0tLQ0KPiB4ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgfCA3ICsrKysrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gaW5kZXggYTUx
NTYzZWUzZC4uMzBhNGYxZmQwOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBAQCAtNTM4LDkg
KzUzOCwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+ICAgICAgICAgICAgIGNvbnRpbnVl
Ow0KPiAgICAgICAgIH0NCj4gDQo+IC0gICAgICAgIGlmICggaW9tbXVfbm9kZSApDQo+ICsgICAg
ICAgIC8qDQo+ICsgICAgICAgICAqIEV4cG9zZSBJT01NVSBzcGVjaWZpYyBwcm9wZXJ0aWVzIHRv
IGh3ZG9tIHdoZW4gdklPTU1VIGlzDQo+ICsgICAgICAgICAqIGVuYWJsZWQuDQo+ICsgICAgICAg
ICAqLw0KPiArICAgICAgICBpZiAoIGlvbW11X25vZGUgJiYgIWlzX3Zpb21tdV9lbmFibGVkKCkg
KQ0KPiAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIC8qIERvbid0IGV4cG9zZSBJT01NVSBzcGVj
aWZpYyBwcm9wZXJ0aWVzIHRvIGh3ZG9tICovDQo+ICAgICAgICAgICAgIGlmICggZHRfcHJvcGVy
dHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXVzIikgKQ0KPiAgICAgICAgICAgICAgICAgY29u
dGludWU7DQo+IA0KPiANCg0KSSB0aGluayB0aGlzIGNvbW1pdCBzaG91bGQgYmUgc3F1YXNoZWQg
d2l0aCAieGVuL2FybTogdklPTU1VOiBJT01NVSBkZXZpY2UgdHJlZSBub2RlIGZvciBkb20w4oCd
DQpzbyB0aGF0IHdlIGNhbiBoYXZlIGEgY29uc2lzdGVudCBoYW5kbGluZyBvZiB0aGUgRFQgcHJv
cGVydGllcy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

