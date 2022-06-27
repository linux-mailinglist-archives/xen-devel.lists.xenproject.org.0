Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3F55BA33
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 16:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356742.585031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pHU-0002RD-Ua; Mon, 27 Jun 2022 14:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356742.585031; Mon, 27 Jun 2022 14:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5pHU-0002PH-Rv; Mon, 27 Jun 2022 14:00:00 +0000
Received: by outflank-mailman (input) for mailman id 356742;
 Mon, 27 Jun 2022 13:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o5pHS-0002PB-Gx
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:59:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aef6ca5-f621-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:59:53 +0200 (CEST)
Received: from DU2PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:10:234::23)
 by AM0PR08MB4034.eurprd08.prod.outlook.com (2603:10a6:208:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:59:55 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::3a) by DU2PR04CA0048.outlook.office365.com
 (2603:10a6:10:234::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 27 Jun 2022 13:59:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 13:59:55 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Mon, 27 Jun 2022 13:59:55 +0000
Received: from 9fd1f68681da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF6C08B2-6676-44D8-89C1-7A773D2B7978.1; 
 Mon, 27 Jun 2022 13:59:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fd1f68681da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Jun 2022 13:59:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7493.eurprd08.prod.outlook.com (2603:10a6:10:36e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 13:59:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Mon, 27 Jun 2022
 13:59:39 +0000
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
X-Inumbo-ID: 6aef6ca5-f621-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DykPKJeHQvBFZCcD4hWh026TwS8vZX0V7FAh1SUJ6kNfaPZGDZANQU73UqgQ7+fr/mIOjnwHvTqoVSALY/8OF3cQEC1fvtnyFmaD98/7+4dfXvKdOHGuqEAubmz97wZkSWDNv7eMflB59j4pGo3lV4Bk/DLESmJJ6gzIzl0UV9fEpDmCbDZQVfcK9+Y3vpGEUOOLU14fJ1M+ySYSuJ5G68AADxGByFqvORQ0Ys/PWWGXJpdaxeUcamVVJSsgWNx6z+dfYaJlXIuRLN1rwZsZkDJ/V/MV+73oK8Mpbt/V4WuURvZizzpwNEQFFXzL7QsGBPK2V/nRXqDOKXuJwmYG7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMDReZihMgL8n6yUE+Z180LcQUc2BcrDbXX4U+oLnyI=;
 b=Or4w5XXL1yNYuBjBHquKthlLiWbH0+UJbA90jAEVitOVkjcFMIXL76N6Kd3YgxUZ1/da1R7bsTDzaeRl++D3OZ0yAcUDSCvqb3mBFWofKUZAfYKxR33ewZy24y+Q4vboE3PtJVC9kpZzUUWdE6ZVCAItZxc4QaTQKWT1/AUKTE2OeZixrkmA6Fa25ubcl25XLqnFQYu1ifacAm65O0pD/JljA0QVTHC/q6QEoqNW9wkZa4ljFSPXL827uea/4ck6oiaZO19jSPu3DidthrrgUIe+0BxQsrC3P/mksf3DQrN988n02SMWj50WLCRgXEsUEF+XWkfwIStKAy+/Bc+4+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMDReZihMgL8n6yUE+Z180LcQUc2BcrDbXX4U+oLnyI=;
 b=B0ngmQrDT5+Lo2VgHAmIVCRZR5y1r3Oc5pjM+emuvPEOjcIWu2KQynXeekZO3GLo7AyglWxrXvAiWWfDqGGWnYWXB+bkhMI7NYD0MA4rYX1Lu3wnUj+CjVRv2fjJeiiOfaY5hYW46zWVOkt0ZYlEBdryhNLMvkXeJ/IH/+TirwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b4d11d3115172b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7Ptd9Wn2rR+yP8FZXao15X7EdMJ351gqbLjCGoUg6L0k87NLL7EVSFWAxr8MpAkoA3V/9J5Td7GNaTEYYUobh1pROU/PXuE56znHumSYsoWdFFPbJGFu/zMY6c3nGOfsmrqj06vsxeWxMBkqu4sQiwLAc/Y+7Z/z7gER19N/FVSONCZHhUg1jd75gCZVNrN4G3CP2UESE/EVXSWY5OYTZUvFr1DEtFOKcTuSbNKoJSPfw0CCe2Q/FdVgKS7zMnm8nd2YktOkv2iEYenFIdLosCjvypnL3aHEUVt0HHz0P58jJjFQvw/Vh0IkUm3Xc3P4u1M6tdXawNEieN6qQFN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMDReZihMgL8n6yUE+Z180LcQUc2BcrDbXX4U+oLnyI=;
 b=bS9MtEw68l7qA+1olgDLtzrtyP4vQxjZwV6YjQuR5TbRccJ8tSj7MEzsTFQVG5YosA9Hotnf+mmNcjc5bnG18eIK+SBek8nA0hRspTB+rLd93KKaOCIIrLBzvzFQ8lcYDRDvk6Bu/QhxYIbizMYBeu5V4JhHbquntFSk7EWjDYCTZoSJt14YPL+C2P+36mFyeyTGPfWhdEr80kPr1ryFd0yR4nHIB+MYbuwYLEORZby6ELlSv8s8FT1bJl3FR6mAPWK62Sgh6dJ18fjki74WRIkiA6k9qjQHBZmzWZfYh5+mGvaFEhpLrpNxqjZk4hz+TACDco8c5LRiIWxABIOwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMDReZihMgL8n6yUE+Z180LcQUc2BcrDbXX4U+oLnyI=;
 b=B0ngmQrDT5+Lo2VgHAmIVCRZR5y1r3Oc5pjM+emuvPEOjcIWu2KQynXeekZO3GLo7AyglWxrXvAiWWfDqGGWnYWXB+bkhMI7NYD0MA4rYX1Lu3wnUj+CjVRv2fjJeiiOfaY5hYW46zWVOkt0ZYlEBdryhNLMvkXeJ/IH/+TirwU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <Michal.Orzel@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm32: head.S: Introduce a macro to load the
 physical address of a symbol
Thread-Topic: [PATCH 2/7] xen/arm32: head.S: Introduce a macro to load the
 physical address of a symbol
Thread-Index: AQHYh6p3jlOKzsv2fEeFkG7om0FjI61iz6mAgAA4JICAAAIvAIAAAqUAgABAUoA=
Date: Mon, 27 Jun 2022 13:59:39 +0000
Message-ID: <C40F17BE-748B-467E-BDDA-2A8562C737CC@arm.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-3-julien@xen.org>
 <1218329a-13a3-79b6-6753-c2c9a0c45b2d@arm.com>
 <e92b0f0f-d73c-a003-eb0f-15f7d624a75e@xen.org>
 <8c8d6a9f-18cd-43e5-0835-68927e7d1bac@arm.com>
 <fbead981-fe36-30fe-12cd-29842a642e47@xen.org>
In-Reply-To: <fbead981-fe36-30fe-12cd-29842a642e47@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c8ac4a8b-ad52-49a0-a68a-08da58455092
x-ms-traffictypediagnostic:
	DB9PR08MB7493:EE_|DBAEUR03FT055:EE_|AM0PR08MB4034:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VzJAoE8rjhaFFJKI/PqgJkGHCdz6gabiMjtZieWyddoBEMYQZssCas4WAshv5OWwxTN8G/wQrVCgdfG2DxPoQWoMYcyfz+m0Pb8UgbmXO2fkwJfrg/msd87Msg5ef96T/p8pbLKrMxklaEBGKyFuJZ4KzOY/bx2AXMDwfqbYqlZltJQ8JeVI9O4p+Ko2/IKpTd8hZmOGcB769ba6AyWry3GBCc+7Vob3OHmcuE1zBXjRz3k/HqELeRgaSIcIdBppydXHn4dd3qtSLIF6ytocsU0t2MLXt/J3Z529VuDDSECdW5cxPmQf43Ela6NdmmzJHvD8WwXxZoDGPnfGviTxgavrNwOtan/NTqsnAHVSJyBlbHc53G0b98qbEHG1tAw46Uhzrhzu4fJ6XPEHwRDdvMVB8J9DgI2W5GX+t4NUU28KwfL/lwaV54EeP47OELnldrxqAI3AteJPVSYG9ZC1gMMbj3tDfxO0W5vmKW3hZstIUed+xKmDVWJYIxnMlzkCb9TamQ6onbbxw8Xeh17+/BNb8djDxLD8FXDUEako2VZh4FUUBUJJtNWNbf56w9QgM4pv3LkR5WOUJuWz6OehKyOFFC9iJadbaguvNfXAjWlazBo+jXymPWxj9C7LhfwHjaVFZPI8so0Mi59M6mEz1UGXFNzWABvkVE5JlZ6s93d2RlMYYjRBhn+CY1DLfk5kAUFN9H8DXmeaEgO3JmhWzv3gJKSkPtPLo+9xtGf0x/MzBrT3Vd6z6qfa7ioG8kpRh+tKQBDI2jWtUhJ/XNki4cPjJ5YnZmI2y2TO3vkym4Zhlbzw3nhUEbyH7xhAcZoJ2lhXKPcKMweGX8Z+ygNzcg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(33656002)(66946007)(76116006)(8936002)(8676002)(4326008)(478600001)(2616005)(64756008)(91956017)(66446008)(41300700001)(2906002)(66476007)(5660300002)(66556008)(26005)(71200400001)(86362001)(6486002)(6506007)(53546011)(6512007)(6916009)(54906003)(122000001)(38070700005)(38100700002)(316002)(186003)(36756003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0B06C3A6A611F44A1E2648AB42A3321@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c13e8e25-c109-45ed-d37d-08da5845474a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uohU9zDG4e3oCL5nwYQrp7zr/r+TWAr/nP7jmlune5uc+bEt2OXeNhxy8pIk/OdzBzog/Od1kOCJ0VLXfuH0ADJJ6w4+aKdghS8+O3e/XzmAnrV8Vsrvrw1JzQ7+S8tOCo8uAhfiMQ4ZOA6MaVUou6dn1piBEv6vr7pQnGOGNgkoNZ8krwABBaqhiG8xLOJ+37jktYxusSdR50J7m8Wu6u8TgiONvqwlYj9CODYXT/qpfkC07XiItii7eGW5yDUHQ9dWgmOYeO/NvMkXh6i+yU2mg5z3Fc6VHlbcfaOpcaPUdJEPkfcvSEXnLmPOdiRSeVHaCa+1WXYTUdn5woqMPR5mZ7zicQoLtXrK+qCa59T4m2EfibFswmPWeE20bhCd2Y1Eulp5o2ueocqE0kJDDV4pE3JovJNJ18vYx01fqvz/u8pRa2FU+qqVJEnzLKa6+olL5uo6rqMtZYkIPCMJEipnxTcwFLwWuoOXL8vG5VVYRkVWfc+VUBC2ZNxZm1lRQs7/sWHN6UFGuqvNilYTvMSioYr0axWPCdFvZqyGcRE7GH5o2D7Mn9XsfVQH45MWgYsigMfm6dXncGhle32myaY2XC192ESnV2ATFNFkKEuaS/b+KWkwx2eHoB2PjbQWXtgaTwALPHTNmCyzjTq0lflYgQdXoVxV83Q1QI4/DAT4i9kfiOv3lpKm6oP3eK4pOPBbwqOR7PvWtVONDkTlFNfCujYM91CPotkXtcbvAEATnhNoUIf3Q43uTCuWgCt7T0kT6wzyAOJbCS0QsbfrmH/+ewRrZMLyY/nsNXHopzPXSRFBhcS/omxoGpRDBKIz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(40470700004)(46966006)(36840700001)(40480700001)(2906002)(70586007)(6512007)(6862004)(54906003)(26005)(70206006)(6486002)(6506007)(53546011)(82740400003)(86362001)(8936002)(83380400001)(4326008)(36860700001)(478600001)(47076005)(107886003)(2616005)(33656002)(41300700001)(36756003)(8676002)(356005)(316002)(40460700003)(82310400005)(5660300002)(336012)(186003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:59:55.3966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ac4a8b-ad52-49a0-a68a-08da58455092
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4034

Hi Julien,

> On 27 Jun 2022, at 11:09, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Michal,
>=20
> On 27/06/2022 10:59, Michal Orzel wrote:
>> On 27.06.2022 11:52, Julien Grall wrote:
>>>=20
>>>=20
>>> On 27/06/2022 07:31, Michal Orzel wrote:
>>>> Hi Julien,
>>>=20
>>> Hi Michal,
>>>=20
>>>> On 24.06.2022 11:11, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>=20
>>>>> A lot of places in the ARM32 assembly requires to load the physical a=
ddress
>>>>> of a symbol. Rather than open-coding the translation, introduce a new=
 macro
>>>>> that will load the phyiscal address of a symbol.
>>>>>=20
>>>>> Lastly, use the new macro to replace all the current open-coded versi=
on.
>>>>>=20
>>>>> Note that most of the comments associated to the code changed have be=
en
>>>>> removed because the code is now self-explanatory.
>>>>>=20
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>> ---
>>>>> xen/arch/arm/arm32/head.S | 23 +++++++++++------------
>>>>> 1 file changed, 11 insertions(+), 12 deletions(-)
>>>>>=20
>>>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>>>> index c837d3054cf9..77f0a619ca51 100644
>>>>> --- a/xen/arch/arm/arm32/head.S
>>>>> +++ b/xen/arch/arm/arm32/head.S
>>>>> @@ -65,6 +65,11 @@
>>>>> .endif
>>>>> .endm
>>>>> +.macro load_paddr rb, sym
>>>>> +  ldr  \rb, =3D\sym
>>>>> +  add  \rb, \rb, r10
>>>>> +.endm
>>>>> +
>>>> All the macros in this file have a comment so it'd be useful to follow=
 this convention.
>>> This is not really a convention. Most of the macros are non-trivial (e.=
g. they may clobber registers).
>>>=20
>>> The comment I have in mind here would be:
>>>=20
>>> "Load the physical address of \sym in \rb"
>>>=20
>>> I am fairly confident that anyone can understand from the ".macro" line=
... So I don't feel the comment is necessary.
>>>=20
>> Fair enough although you did put a comment when introducing load_paddr f=
or arm64 head.S
>=20
> For the better (or the worse) my way to code has evolved in the past 5 ye=
ars. :) Commenting is something that changed. I learnt from other open sour=
ce projects that it is better to comment when it is not clear what the func=
tion/code is doing.
>=20
> Anyway, this is easy enough for me to add if either Bertrand or Stefano t=
hink that it is better to add a comment.

I do not think a comment to explain what is done in there is needed as it i=
s quite obvious so:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


