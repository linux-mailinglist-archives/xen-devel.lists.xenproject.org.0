Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531D51D278
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322750.544172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsb9-0007oW-Tr; Fri, 06 May 2022 07:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322750.544172; Fri, 06 May 2022 07:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsb9-0007lU-Q0; Fri, 06 May 2022 07:41:59 +0000
Received: by outflank-mailman (input) for mailman id 322750;
 Fri, 06 May 2022 07:41:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmsb8-0007lO-Jg
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:41:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01648439-cd10-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 09:41:57 +0200 (CEST)
Received: from DB6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::22) by
 PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 07:41:54 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::8a) by DB6P195CA0012.outlook.office365.com
 (2603:10a6:4:cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Fri, 6 May 2022 07:41:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 07:41:54 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Fri, 06 May 2022 07:41:54 +0000
Received: from 7e7175c2d624.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E9657C8-E63B-409A-B1C1-1778F4605172.1; 
 Fri, 06 May 2022 07:41:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e7175c2d624.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 07:41:48 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB7470.eurprd08.prod.outlook.com (2603:10a6:10:36e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 6 May
 2022 07:41:46 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Fri, 6 May 2022
 07:41:45 +0000
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
X-Inumbo-ID: 01648439-cd10-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YTz7zwhNwAgODmBY1hDe0HjKqhSxEQxOq+sCu/ff3LjIaz3z4mU1fVao9tCRB8vTDCReO4x17lXoeUrp3CoZIatanTwhdpC83iDiaTZiiSC3LgwtJgvkiwr5REKjcazsXIhIMjmB24AbJQ1SsPWleRqcaEvfZswWKGhRSSaeIEwSbO0TOkI/y2NEqj2YT50jUA4MZswfdgBLl+585HTe6a7h2ys2YVr0xusdVxYxd70CM9QicBr4Ahgzb+yVLThRsIDRox7vFxLuOdyrSZn4/1jOfRzw7+VmcRkW6+QLknG54dM55vFb7yi59jWCTa0pvSWc3JyphA5hmBYqgg+gkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/fwamjDyhMY1+r6Zvyn14EhElwtqTNh011wO5XqgNw=;
 b=fxwVZyw1q6wLtDMIvz68lmVsw6U2dBmIljQatK/pLTJjkRIDNOgF47Zvu52h0c4CPs6l3z+5oEIsR4YiPYgplTnNd4zxSmo5SIzr4ZXes+nG9TdHqkPzevt2dW2uJ2QsOtpmzPSErouMx8eI6RyODaJzQ+LfAlingsBjbVu+YGxO3tKXiTQnH0p5M32p0GalpLNEv2otAaZDPEi/1iJYschCLQJFjJk6lTO3FKeNpXY959RqsaXpBOJbl1eBAXfABYorxkxRxzx4zijgx9lei/yxHg7txZQx4y4+ayk6OoFe06KazHC7F8HxVoHTlcOkvewalxFKiDTy7EOJra379g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/fwamjDyhMY1+r6Zvyn14EhElwtqTNh011wO5XqgNw=;
 b=nKovzNh0phjQEUGvYK/ODVUfdUMBkUCDoGNXxLBwLCmd8NlOYGcbhNr+OmcMVXLdDU+tYnec9wProaMUEH8H2HjZNZzkFaI/7rfk85Lp9CozT5UzB43dLVrFMcBZgRYU7WLN0MB10v2/+sJeVNhXD6EkGGlJh/WT4IS9M6F5ywY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqWKfLO4cMCtHEscYi5KcqCV3VzrAJ+WXSfMJd+Tq3BIsuDGfIII/NxZYmTerFLEoAaDhWHYrLX9+2oCUsZnRLjVD813W4UAU17UNitfYB0wU91JQ2xqaTDqT/1qFha820GpM+KM6JDFY2lWE0+kdBCI+N9ua8+yEBDe7Gvr1/oYaOTLlgttIWn1y86H7uFk4ukWDPFJZliGKDx9P/thPgC+73Bn8R/exyvSbVo1DovITbuAp6n4jw2w6D+LtFhQI1sSrAyrERoig3i+QWhzkaJ8aFhnH8qwAqeYJihufuFzvmWrtyLfe/Fqdpl9GCsghnsICZZF3UUgnQPc95vBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/fwamjDyhMY1+r6Zvyn14EhElwtqTNh011wO5XqgNw=;
 b=QW+azcNbZ9mrFNoYOp1gsyAxYpE4GsPb3B6QJrngkbspKY4J7yYeElpph9mAL2x8WrKplA+K7zG5dUdw8MS7b06pWlQuM6PRxTb4UJjlrw607C7WmF6+TddIefCTOKkHemhRYeFbOrHMvg5sUm2UaxDC5wPBRJgRVenocWC1z9CHQ/p/fZtYxSSNidCQLLqax5HOIT4qb8MlRbvMbt2vry7Po+urInZ6FGZj6Ho4PVprhxZTDYzAY2v50yvTZ/8MabVnq+ygqkTkvUkvBToEPa8E/opWrQ06u0dx16fluoWWsAm4qZrxr8EkQsVF15zWvxYikKQvaf3QqCkkd7kk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/fwamjDyhMY1+r6Zvyn14EhElwtqTNh011wO5XqgNw=;
 b=nKovzNh0phjQEUGvYK/ODVUfdUMBkUCDoGNXxLBwLCmd8NlOYGcbhNr+OmcMVXLdDU+tYnec9wProaMUEH8H2HjZNZzkFaI/7rfk85Lp9CozT5UzB43dLVrFMcBZgRYU7WLN0MB10v2/+sJeVNhXD6EkGGlJh/WT4IS9M6F5ywY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwCAABi4gIAAB8rggAAKIYCAAAcaUIAAL5+AgAAR4BCAABRbgIAA0kVwgAA3dYCAABUWYA==
Date: Fri, 6 May 2022 07:41:45 +0000
Message-ID:
 <DU2PR08MB73258C6D96C9DE524C6D6007F7C59@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
 <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <306532fc-939d-efdf-047c-7b8556d40738@suse.com>
 <DU2PR08MB732520F0DC6CC52DD00FE481F7C59@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6eb6f0d0-ba46-9d4f-28f1-9612bd876e9c@suse.com>
In-Reply-To: <6eb6f0d0-ba46-9d4f-28f1-9612bd876e9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 67006881CA8C734481BC2D219B9FE7B1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4cd6f9f4-46e6-4647-6d96-08da2f33e438
x-ms-traffictypediagnostic:
	DB9PR08MB7470:EE_|DBAEUR03FT004:EE_|PA4PR08MB7411:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB74113014CA78FF6B0522BAC9F7C59@PA4PR08MB7411.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VbGP/FKtvNgIvzyxtDq34V+Hv0Jnl8NWbudUkFUweSDGkrRUK9y84rSYJjoArEVF3ctjP22FOFpwkO2TRwGdaVu95L7dxC8Z5s3swPrj/hFRMybKjvhIP/R71IbtzKLUFwPwE2ycMRRN3rXBLngl3iN/2x7bROz6M62VWnQENGotA382cg835xnFWwlNyL1F5eZ0aCN9MCSravw+KkxbNWaqP7rn+qaTQXYfg7huxsBIcxsfIye1w/TM1732oiRbp6dwkzphH4OW2LY4voOXFijz5AFUXwCRNSk3WV+Zsu9kD9e2NthAzJzlCuRswPLJKlnfv+kDRenpP6Z422f82zI4I71O49XefpUl0oID6PYOszoO7xZ9b2Zv/LBgPqvEnVtaZOPXw1Ji0ziqGmcV1evxnam9cnAFAS9T40Tk9HfJRwWfyltWg+VNFCRG7x2pr0kYtLDgSaeJ1fUtDxJBO/zHVDZ4jt9vjwjyza1u2EnUfU2Xj3qP7KP4042ZLNugHE7plpPD0K1JDhIlALhxF9Yk2xYAD3sZWitaOtyQ4AJsLdsAdFLukRj0bkbTze84fUWqqzYFj8OWMkLrPc98CGW295ftt/IPLafzFa67ix4JvRCZudJHWmakYylnxOZypdLapkZ8UGtvEt1EurY6rvhbzXdbEeGUbOqxnT+PEW/xz8nOVgE1HzZdbY2r+czWIuaDl1Azb6zuGjO8yC5pI9Bja4kJwqvx9EBvf71nWeVuG2PBWfcXdtsHnNEVOBkzQBZWswWeNvcgQBo+LUjCVCGEW7Tg3iJMpAVP8QOko8pvFHz94sLX5stywRT1tifo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(55016003)(508600001)(33656002)(6506007)(38070700005)(186003)(9686003)(5660300002)(122000001)(26005)(86362001)(83380400001)(64756008)(38100700002)(71200400001)(52536014)(8936002)(7696005)(2906002)(76116006)(54906003)(110136005)(66476007)(66446008)(316002)(8676002)(4326008)(66556008)(66946007)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7470
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9ecbdc5-3381-4752-a6eb-08da2f33deeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hsMy/UaKq8K+9sF8u/g6R/zmybAS1ZqIRvICslZ+DYMaf5+9/3NATWV5g9qOCJWAyYMreow0qB/HpG8XhP0qLuOhcjjX9XTEI15CyOaX5vlkJXpVgoAM1mNRcYrwVL0uckOqtdiR9Vf53/cAtHvGD2aijsUlzfweBpki2bw+MRcyPwW48OilHCuISkB/xBD2Qt6eeFCLusHk4eOJoIJ30hJK5bM7npdv7PkysynVzLL90PC4bL62PFJTbk2+1TnOybWXxTqCY4gAN1HGuGiFq4x35/yHk83ecGGolYewNHnxUmKNp4DIutMJuywJOGrqxgjQCtWrnpJIfcI35IJWnwLLT8aOAILd/YGI5tbBVDHL8RyfUO+9RWklTLppY7iUktsvVZF10qXnO8fwOel6vcFQ7iIQnTfWwL2XwhSgFcGDqNJdrJGk9pIvxV0Z0sMw/QNSLWOVv8NJXdtm/mcjuwLPkMWEk7RJiBvwQ+dajx9XsuPcMcasWznUYLu97l09DRLqr5ek3zc6ZKTYHScbIbMZczqNSRRbqTBtnKIi6oC+ogMpAcFOsiz7g1s7K5Z9VLlrq1Df8g3I1nmGqs518xBG8QVfaMsjWV8q3osR2c2w9cyi62TVUWy+nI5X3YEU08TOrj3F+4z3aGwXP2Uat832PhFLou9gh3VDTC5k0z99Tv/lCOjtoH0Gury1qZoYpWOOSEqqdk9bGOLMXZdPmnIzyqJLKRC4TO0yDzXjd1A2ZnQa4Ds8mHvrvySndWmH9ei0yEqgKcvpuclM0OeexQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(336012)(9686003)(186003)(53546011)(6506007)(47076005)(26005)(33656002)(7696005)(356005)(81166007)(86362001)(40460700003)(55016003)(110136005)(83380400001)(36860700001)(82310400005)(5660300002)(54906003)(508600001)(316002)(70586007)(70206006)(8676002)(4326008)(52536014)(8936002)(2906002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:41:54.5087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd6f9f4-46e6-4647-6d96-08da2f33e438
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7411

SGkgamFuIGFuZCBqdWxpZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDYs
IDIwMjIgMjoxNCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+
IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT47DQo+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBH
ZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA2LzZdIHhlbjogcmV0cmlldmUgcmVz
ZXJ2ZWQgcGFnZXMgb24gcG9wdWxhdGVfcGh5c21hcA0KPiANCj4gT24gMDYuMDUuMjAyMiAwNDo1
OSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgamFuDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiA+PiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgMTA6MjMgUE0NCj4gPj4gVG86IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiA+PiBDYzogV2VpIENoZW4gPFdlaS5D
aGVuQGFybS5jb20+OyBIZW5yeSBXYW5nDQo+IDxIZW5yeS5XYW5nQGFybS5jb20+Ow0KPiA+PiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0K
PiA+PiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi82XSB4ZW46IHJldHJpZXZlIHJlc2Vy
dmVkIHBhZ2VzIG9uDQo+ID4+IHBvcHVsYXRlX3BoeXNtYXANCj4gPj4NCj4gPj4gT24gMDUuMDUu
MjAyMiAxNTo0NCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBJIG1pc3VuZGVyc3RhbmQgd2hh
dCB5b3Ugc3VnZ2VzdGVkIGhlcmUsIEkgdGhvdWdodCB5b3Ugd2VyZQ0KPiA+Pj4gc3VnZ2VzdGlu
ZyBhIHdheSBvZiBzdHViIGZ1bmN0aW9uIHdoaWNoIGNvdWxkIGJyaW5nIHNvbWUgb3B0aW1pemF0
aW9uLg0KPiA+Pj4gVGhlIHJlYXNvbiBJIGludHJvZHVjZWQgZnJlZV9zdGF0aWNtZW1fcGFnZXMg
YW5kDQo+ID4+PiBhY3F1aXJlX3Jlc2VydmVkX3BhZ2UgaGVyZSBpcyB0aGF0IHdlIG5vdyB1c2Vk
IHRoZW0gaW4gY29tbW9uIGNvZGUsDQo+ID4+PiBhbmQgaWYgdGhleSBhcmUgbm90IGRlZmluZWQo
dXNpbmcgc3R1Yikgb24gIUNPTkZJR19TVEFUSUNfTUVNT1JZLCB3ZQ0KPiA+Pj4gd2lsbCBoYXZl
ICIgaGlkZGVuDQo+ID4+IHN5bWJvbCBgeHh4JyBpc24ndCBkZWZpbmVkICIgY29tcGlsYXRpb24g
ZXJyb3IuDQo+ID4+DQo+ID4+IFRoaXMgaXMgd2hhdCBJJ3ZlIGFza2VkIGZvciBjbGFyaWZpY2F0
aW9uIGFib3V0OiBJZiBzdWNoIGVycm9ycw0KPiA+PiBzdXJmYWNlLCBJJ2QgbGlrZSB0byB1bmRl
cnN0YW5kIHdoeSB0aGUgcmVzcGVjdGl2ZSBjYWxsIHNpdGVzIGFyZW4ndCBEQ0UtZWQgYnkNCj4g
dGhlIGNvbXBpbGVyLg0KPiA+Pg0KPiA+DQo+ID4gQmVjYXVzZSBib3RoIGRlZmluaXRpb24gb2Yg
UEdDX3Jlc2VydmVkIGFuZA0KPiA+IGlzX2RvbWFpbl91c2luZ19zdGF0aWNfbWVtb3J5IGFyZSBu
b3QgZ3VhcmRlZCBieQ0KPiBDT05GSUdfU1RBVElDX01FTU9SWSBpbiB0aGUgZmlyc3QgcGxhY2Ug
aW4gYXJtLXNwZWNpZmljIGZpbGUuDQo+IA0KPiBTbyBwZXJoYXBzIHRoYXQncyB3aGF0IHdhbnRz
IGNoYW5naW5nIChhdCBsZWFzdCBmb3IgUEdDX3Jlc2VydmVkKT8NCj4gDQoNCkhtbW0sIEkgcmVt
ZW1iZXJlZCB0aGF0IHdoZW4gSSBmaXJzdGx5IGludHJvZHVjZWQgUEdDX3Jlc2VydmVkIHRocm91
Z2gNCiJEb21haW4gb24gc3RhdGljIGFsbG9jYXRpb24iLCBKdWxpZW4gY29tbWVudGVkIHRoYXQg
aGUgbWF5IGxpa2UgaXQgdG8gYmUNCnVzZWQgZm9yIG90aGVyIHB1cnBvc2UsIG5vdCBvbmx5IHN0
YXRpYyBtZW1vcnkuIEFuZCBvbmUgZXhhbXBsZSBpcyByZXNlcnZlZA0KbWVtb3J5IHdoZW4gTGl2
ZSBVcGRhdGluZy4oaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcvbXNnOTc4MjkuaHRtbA0KKQ0KDQo+IEphbg0KDQo=

