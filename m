Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61E529982
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 08:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330469.553843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqqdL-0000FI-Cu; Tue, 17 May 2022 06:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330469.553843; Tue, 17 May 2022 06:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqqdL-0000Bj-9G; Tue, 17 May 2022 06:24:39 +0000
Received: by outflank-mailman (input) for mailman id 330469;
 Tue, 17 May 2022 06:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vdn1=VZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nqqdJ-0000Bd-RG
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 06:24:37 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 054602bf-d5aa-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 08:24:36 +0200 (CEST)
Received: from DB6PR0202CA0007.eurprd02.prod.outlook.com (2603:10a6:4:29::17)
 by DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Tue, 17 May
 2022 06:24:31 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::c9) by DB6PR0202CA0007.outlook.office365.com
 (2603:10a6:4:29::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 06:24:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 06:24:31 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Tue, 17 May 2022 06:24:31 +0000
Received: from 26aea624e4e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E1847C6-51CB-4F24-81FB-5666D074887A.1; 
 Tue, 17 May 2022 06:24:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 26aea624e4e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 06:24:20 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AS8PR08MB7250.eurprd08.prod.outlook.com (2603:10a6:20b:341::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 06:24:18 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 06:24:18 +0000
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
X-Inumbo-ID: 054602bf-d5aa-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d9xwTPFzPSjBozLaD4wfcBI1aCKqRm6YHvORToI11oxKv90OCgGUv6rawfO6oYG80xhfieGCpvWC2JPMT+4mwS1Cb+k7gqKrtIc4RehJgD8E9QtUFzQorKlMPxinUhJ4ZQ1x759oEBEo7iUmKgLuAi23JopiOdTevWtbe14lyqnOmeICywp0pKLwOB3FAdymN5+XQycXInqh85SCeB6SJ+b0GitJyf8EKGyXMV02QMIvyc5GSU3vtpE/C/enqrN2xxW2kZOdvg3bZJyBufyTsJbYykqhVONcD6r1k+yrFOchXwPvRHoJasBDONGU6/ORrHDicThniS/UVi75CdbJWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+WogaoU5NMk4VzfTmoz6DN+xqWel39r/u7WQhU1jlc=;
 b=XaFj2WvtuWjBzdkeuh8yVkrjP8vmVd3uNs4LiUZZCmDwhLapL7lWgSFQVxr+4CXmcGQX4eMns7GZbjmxSNbG+zysIRWXBVR1o90qdTm0AzQV8Cfa3Ke5NkPvk6C5Vh8fseufhYfHytrNa1a2XlcItRtnb/k97GiZ7ZH3FYCskNEVhNhkdsA5ZIUDXNfep6QYkwkAIqpt7a9Uu4VPS8IkiM1QzkOBE0sULtE+tXDv32zIU3J9OhCX528VrfDcPPQ2wEsK/WcCBJWsRULw12T9tRw+m0a3jlfzKwKyQRPydX3Ohu35o+27yR1b2d/vhUB/dnzFRkfE53YMCQX3UQLwFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+WogaoU5NMk4VzfTmoz6DN+xqWel39r/u7WQhU1jlc=;
 b=p2roUT8OG2gJQiIAuDqjAZBokxhqlZAWT11TURAbnOnvLZ6j8AEGBT+ojGTyLPthP2nojp/e43I/L2ZcZugdICakyFS734dn6/FYpN04aA06fPgXGASOocEMK+ynYAz1MA4TdbHtZjFEcDjKrV0efGvqvVAs7ore7kEaMq7wNqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/V5LQuDz+VHz3va2wcq5Ua91tNkssFUmJdsCuF8gSOptxuRDQxQ2fBPxH/0FlZz4/ZnwDsEbnlSDt//iGhetot55MA9TfnlqkWLx6RLx/fSLkcUPBRxcT45mTttPrae6D4J+f2MppOCh2l+y6ncFpRIoTAtJjrXz23KzXlHdFVxroGVhqofu7rG4eHjIK4qxNW1cfI1tLNgim9/kX9e4ROmFD9u6uKcB0aMCS8DI7ftBJzcngQagn1cStCMPgNu7NqPmXBzKJNzT8RGHmp7jTDyjHKrk6RsKJe8egRDYtmNZ7xN/iouSOy91PpbLwRQAYnH01x/nGGT+cKxFa0gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+WogaoU5NMk4VzfTmoz6DN+xqWel39r/u7WQhU1jlc=;
 b=U/L5JieMDXyd/K5D9FMeeXj3MqBp1rlRA5sl5Xo2xf/e7y29yJdVVQMnfyWWL0WGKUtfx1ea85/kDJCgvzzVW9tzxmgT6DgATMc7Xry7yeVdX2GoHilj66ChFodiCOxs6z+pInjU6R4wW+C/Zepi5NV7pkVXt/4eDwJFjlfeq0BVxGZ8/eBzyEMhMEc5cJZ/mosW+DJIvhVR4J5IbPamVtFUg9cX3u85/uMLv3wx0/sH82uozSGWwSdOK/ApT2Mt3DX7HPI+wL4AyrBco5tCUqFxwcOjEdmnwOlJus4+sSz4ySVdu/G/q6THSvsu+MijGqnaBzqsmUAbKBW88MfukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+WogaoU5NMk4VzfTmoz6DN+xqWel39r/u7WQhU1jlc=;
 b=p2roUT8OG2gJQiIAuDqjAZBokxhqlZAWT11TURAbnOnvLZ6j8AEGBT+ojGTyLPthP2nojp/e43I/L2ZcZugdICakyFS734dn6/FYpN04aA06fPgXGASOocEMK+ynYAz1MA4TdbHtZjFEcDjKrV0efGvqvVAs7ore7kEaMq7wNqw=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYZBWotDDYRSpFwES4i4qLUHUim60h3YOAgAC/qjA=
Date: Tue, 17 May 2022 06:24:18 +0000
Message-ID:
 <DU2PR08MB7325E62AFC9087725D69BA1DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-7-Penny.Zheng@arm.com>
 <7af0d53c-6fdc-33a4-a09b-93831b4ee2c0@xen.org>
In-Reply-To: <7af0d53c-6fdc-33a4-a09b-93831b4ee2c0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 457513F8EB8C81489C2258EBBA384912.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cbcf8663-1c99-44f7-fad7-08da37cde73d
x-ms-traffictypediagnostic:
	AS8PR08MB7250:EE_|DBAEUR03FT053:EE_|DB7PR08MB3692:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3692D84BE7EE49B293D00072F7CE9@DB7PR08MB3692.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3QEQ5Zm2s5UyPPqEko5RpNdwEuT4sP/34rcWA6l2P0TtUwh/tN1NDfg6wx+P+kOWPJ15exLEZobdnAQFUgzXGJ7ypas+IoBH8abBUdu0NXkrTBXC/V1GpWCrR8nEmmMiST0XSlBtaukUHjPnVdqVNa04bgfrOaTh6brLS5ThYqxb0YhX1Ir799gs8qlACegbVJeOxoNEepZZTpHqlPTmfCjZ0lpAswTsdcxfR54SsDUVill1rX+72YXXvx8sRemlMq0HpeDqV3XLBPXu6HxRoedR1dbvsf9GG5JiMjY1rDknk3hKY3ygLhojwcw28wXEaM0OSWfqPeBMaA1dKHPNYkFed7DwaTDZXfg2D0HEBSsBlazPjWYjYymkvyJijcqbcI6UdvGVxoM1Ka2Pc47/jihr1Ah6E72brpWqI6VkfOTN0Z1bf3VTt7gQV8jS0lSTYjnr7R/JOaJAt2D7Tgw3mYVRUp5OCuIuysLsO5MiR7cZjADqMmUOYxBsVTjvihUhkHYBq88Cjc6R3Cj+WEROjBXvz6Zgf0wW10w4yXSDUKCYso9V9WVpxsODXEujhf0Mf0djR62C00PeV/aL+3LZsYCgk5fN/5Y8ad7wEwJHD1JWaoLymS8dgPtJu0mGjyd07BRqbFuvuP92qPQ4vme2+qj/XgpEQzvkOOV99CUDzGTAWE8QVwQm5VyOde80nZ99ppeFpHmaGFQog/vMcxWcPsKKKiBtJCCq7PKZ+pQflzQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(7696005)(38070700005)(2906002)(33656002)(9686003)(26005)(71200400001)(52536014)(8936002)(508600001)(122000001)(316002)(66476007)(8676002)(83380400001)(64756008)(66556008)(55016003)(4326008)(86362001)(54906003)(66946007)(76116006)(38100700002)(66446008)(6506007)(53546011)(5660300002)(110136005)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7250
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d44094f-05fb-4343-6b68-08da37cddf6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zwj0bekRq3wI+LtpztxcC5tTVFL8vLiWSA0sQ13PPZM8ycv8KrEhVSpYVOTBhOSkL9ZxxkSYrl0ajtsunnbcCMg0DW/1dCH4KQfjsAEhjC1BdOO9gTwYKfvOR1hjrtxcG51pNdUGBBTTKIjlid18jKx4iXs824ldntleBrxxpCd3T0X00kuRifHgSBsdJDv1MfqAckfQntpxjQ54WsgeV6h+a8Yu1IT/uAvKV0zcf0b+mR8gJONXKcH939RDTeD7GHCGAU9U3LPZpFxAJZdfg5UssGZEWV5sYHVDokihGu4jv0PnH9FCcaWqlVlkmO47Cx3Z6uBpwPzBpkP4dKnVirLMqXJ3vAw7Ml9Vc0n+4AoLqjotYGGfOeNXkur9VcWBbhgtjy3UyjRmUZQpajRpjB55On2z9b79MiFILqArCsJrF3jW/aDyEPT7d0cLhD1IEcshjfcw75GGu8ORCNVq7T8S9q2VCTfeiBm+br17dOhJq6lTzjq7+52dbfXiMaXgg2aOYuWTvwtTy6YC3c8r+wYG3RW7mBqfyur/JNHH+efMMkHJZAhQN+IbSc/WnAGCuhnNjySk/RryGEiXWLCfYWyuflleeWwZFmcj1pU0ZthyIri6mj2bwrnBJqBi5BPkYVjqqVyBupqo88WqZ2UNIIbRYNGwMCzgALYEYvuKKApZQBVZ1WtbjA+qhnaJ7MmEThdPp5sOibI8gysdeY+dQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8936002)(33656002)(316002)(186003)(5660300002)(86362001)(40460700003)(55016003)(9686003)(53546011)(508600001)(54906003)(2906002)(47076005)(336012)(83380400001)(8676002)(4326008)(70586007)(70206006)(356005)(82310400005)(26005)(110136005)(6506007)(52536014)(7696005)(81166007)(36860700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 06:24:31.3768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcf8663-1c99-44f7-fad7-08da37cde73d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE3LCAyMDIyIDI6
MjkgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47
IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0K
PiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDYvNl0geGVu
OiByZXRyaWV2ZSByZXNlcnZlZCBwYWdlcyBvbiBwb3B1bGF0ZV9waHlzbWFwDQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IE9uIDEwLzA1LzIwMjIgMDM6MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IFdoZW4gc3RhdGljIGRvbWFpbiBwb3B1bGF0ZXMgbWVtb3J5IHRocm91Z2ggcG9wdWxhdGVfcGh5
c21hcCBvbg0KPiA+IHJ1bnRpbWUsDQo+IA0KPiBUeXBvOiBzL3doZW4gc3RhdGljL3doZW4gYSBz
dGF0aWMvIG9yICJ3aGVuIHN0YXRpYyBkb21haW5zIHBvcHVsYXRlIg0KPiANCj4gcy9vbiBydW50
aW1lL2F0IHJ1bnRpbWUvDQo+IA0KDQpTdXJlLCANCg0KPiA+IG90aGVyIHRoYW4gYWxsb2NhdGlu
ZyBmcm9tIGhlYXAsIGl0IHNoYWxsIHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIGZyb20NCj4gDQo+
IEkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0aGUgcGFydCBiZWZvcmUgdGhlIGNvbW1hLiBC
dXQgaXQgZG9lbnMndCBzb3VuZA0KPiBuZWNlc3Nhcnkgc28gbWF5YmUgZHJvcCBpdD8NCj4gIA0K
DQpTdXJlLA0KDQo+ID4gcmVzdl9wYWdlX2xpc3QgdG8gbWFrZSBzdXJlIHRoYXQgZ3Vlc3QgUkFN
IGlzIHN0aWxsIHJlc3RyaWN0ZWQgaW4NCj4gPiBzdGF0aWNhbGx5IGNvbmZpZ3VyZWQgbWVtb3J5
IHJlZ2lvbnMuIEFuZCB0aGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3DQo+ID4gaGVscGVyIGFj
cXVpcmVfcmVzZXJ2ZWRfcGFnZSB0byBtYWtlIGl0IHdvcmsuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gDQo+IFsuLi5dDQo+IA0K
PiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jIGluZGV4DQo+ID4gMjkwNTI2YWRhZi4uMDZlNzAzN2EyOCAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jDQo+ID4gQEAgLTI3NDAsOCArMjc0MCw4IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZv
ICogX19pbml0DQo+IGFjcXVpcmVfc3RhdGljbWVtX3BhZ2VzKG1mbl90IHNtZm4sDQo+ID4gICAg
KiBBY3F1aXJlIG5yX21mbnMgY29udGlndW91cyBwYWdlcywgc3RhcnRpbmcgYXQgI3NtZm4sIG9m
IHN0YXRpYyBtZW1vcnksDQo+ID4gICAgKiB0aGVuIGFzc2lnbiB0aGVtIHRvIG9uZSBzcGVjaWZp
YyBkb21haW4gI2QuDQo+ID4gICAgKi8NCj4gPiAtaW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRp
Y19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBzbWZuLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9tZm5zLCB1bnNpZ25lZCBpbnQg
bWVtZmxhZ3MpDQo+ID4gK2ludCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWlu
ICpkLCBtZm5fdCBzbWZuLCB1bnNpZ25lZCBpbnQNCj4gbnJfbWZucywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4gPiAgIHsNCj4gPiAg
ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsNCj4gPg0KPiA+IEBAIC0yNzY5LDEyICsyNzY5LDQz
IEBAIGludCBfX2luaXQgYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoc3RydWN0DQo+ID4gZG9tYWlu
ICpkLCBtZm5fdCBzbWZuLA0KPiA+DQo+ID4gICAgICAgcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4g
Kw0KPiA+ICsvKg0KPiA+ICsgKiBBY3F1aXJlIGEgcGFnZSBmcm9tIHJlc2VydmVkIHBhZ2UgbGlz
dChyZXN2X3BhZ2VfbGlzdCksIHdoZW4NCj4gPiArcG9wdWxhdGluZw0KPiA+ICsgKiBtZW1vcnkg
Zm9yIHN0YXRpYyBkb21haW4gb24gcnVudGltZS4NCj4gPiArICovDQo+ID4gK21mbl90IGFjcXVp
cmVfcmVzZXJ2ZWRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3Mp
DQo+ID4gK3sNCj4gPiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7DQo+ID4gKyAgICBtZm5f
dCBzbWZuOw0KPiA+ICsNCj4gPiArICAgIC8qIEFjcXVpcmUgYSBwYWdlIGZyb20gcmVzZXJ2ZWQg
cGFnZSBsaXN0KHJlc3ZfcGFnZV9saXN0KS4gKi8NCj4gPiArICAgIHBhZ2UgPSBwYWdlX2xpc3Rf
cmVtb3ZlX2hlYWQoJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gQWxsb2MvZnJlZSBvZiBtZW1vcnkg
Y2FuIGhhcHBlbiBjb25jdXJyZW50bHkuIFNvIGFjY2VzcyB0byByc3ZfcGFnZV9saXN0DQo+IG5l
ZWRzIHRvIGJlIHByb3RlY3RlZCB3aXRoIGEgc3BpbmxvY2sgKG1vc3RseSBsaWtlIGQtPnBhZ2Vf
YWxsb2NfbG9jaykuDQo+DQoNCk9oLCB1bmRlcnN0b29kLCB3aWxsIGZpeC4NCiANCj4gPiArICAg
IGlmICggdW5saWtlbHkoIXBhZ2UpICkNCj4gPiArICAgICAgICByZXR1cm4gSU5WQUxJRF9NRk47
DQo+ID4gKw0KPiA+ICsgICAgc21mbiA9IHBhZ2VfdG9fbWZuKHBhZ2UpOw0KPiA+ICsNCj4gPiAr
ICAgIGlmICggYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoZCwgc21mbiwgMSwgbWVtZmxhZ3MpICkN
Cj4gDQo+IEkgYW0gT0sgaWYgd2UgY2FsbCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcygpIGZvciBu
b3cuIEJ1dCBsb25nIHRlcm0sIEkgdGhpbmsgd2UNCj4gc2hvdWxkIGNvbnNpZGVyIHRvIG9wdGlt
aXplIGl0IGJlY2F1c2Ugd2Uga25vdyB0aGUgcGFnZSBpcyB2YWxpZCBhbmQgYmVsb25nDQo+IHRv
IHRoZSBndWVzdC4gU28gdGhlcmUgYXJlIGEgbG90IG9mIHBvaW50bGVzcyB3b3JrIChjaGVja2lu
ZyBtZm5fdmFsaWQoKSwNCj4gc2NydWJiaW5nIGluIHRoZSBmcmVlIHBhcnQsIGNsZWFuaW5nIHRo
ZSBjYWNoZS4uLikuDQo+IA0KDQpJJ20gd2lsbGluZyB0byBmaXggaXQgaGVyZSBzaW5jZSB0aGlz
IGZpeCBpcyBub3QgYmxvY2tpbmcgYW55IG90aGVyIHBhdGNoIHNlcmllfn4NCkknbSBjb25zaWRl
cmluZyB0aGF0IG1heWJlIHdlIGNvdWxkIGFkZCBhIG5ldyBtZW1mbGFnIE1FTUZfeHh4LCAob2gs
DQpOYW1pbmcgc29tZXRoaW5nIGlzIHJlYWxseSAia2lsbGluZyIgbWUpLCB0aGVuIGFsbCB0aGVz
ZSBwb2ludGxlc3Mgd29yaywgY2hlY2tpbmcNCm1mbl92YWxpZCwgZmx1c2hpbmcgVExCIGFuZCBj
YWNoZSwgd2UgY291bGQgZXhjbHVkZSB0aGVtIGJ5IGNoZWNraW5nDQptZW1mbGFncyAmIE1FTUZf
eHh4eC4NCldkeXQ/DQoNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWdlX2xpc3RfYWRkX3Rh
aWwocGFnZSwgJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPiArICAgICAgICByZXR1cm4gSU5WQUxJ
RF9NRk47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHNtZm47DQo+ID4gK30N
Cj4gPiAgICNlbHNlDQo+ID4gICB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdl
X2luZm8gKnBnLCB1bnNpZ25lZCBsb25nIG5yX21mbnMsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgbmVlZF9zY3J1YikNCj4gPiAgIHsNCj4gPiAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsNCj4gPiAgIH0NCj4gPiArDQo+ID4gK21mbl90IGFjcXVpcmVfcmVzZXJ2ZWRf
cGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpDQo+ID4gK3sNCj4g
PiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiA+ICsgICAgcmV0dXJuIElOVkFMSURfTUZO
Ow0KPiA+ICt9DQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+ICAgLyoNCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oIGluZGV4
DQo+ID4gMzVkYzcxNDNhNC4uYzYxM2FmYTU3ZSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vZG9tYWluLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgNCj4gPiBA
QCAtMzgsNiArMzgsMTAgQEAgdm9pZCBhcmNoX2dldF9kb21haW5faW5mbyhjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkLA0KPiA+ICAgI2RlZmluZSBDREZfc3RhdGljbWVtICAgICAgICAgICAgKDFVIDw8
IDIpDQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+ICsjaWZuZGVmIGlzX2RvbWFpbl91c2luZ19zdGF0
aWNtZW0NCj4gPiArI2RlZmluZSBpc19kb21haW5fdXNpbmdfc3RhdGljbWVtKGQpICgodm9pZCko
ZCksIGZhbHNlKSAjZW5kaWYNCj4gPiArDQo+ID4gICAvKg0KPiA+ICAgICogQXJjaC1zcGVjaWZp
Y3MuDQo+ID4gICAgKi8NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL21tLmggYi94
ZW4vaW5jbHVkZS94ZW4vbW0uaCBpbmRleA0KPiA+IDlmZDk1ZGVhZWMuLjc0ODEwZTFmNTQgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vbW0uaA0KPiA+IEBAIC05Miw2ICs5Miw3IEBAIHZvaWQgZnJlZV9zdGF0aWNtZW1fcGFn
ZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+IHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4gPiAg
IGludCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBzbWZu
LCB1bnNpZ25lZCBpbnQNCj4gbnJfbWZucywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpOw0KPiA+ICAgI2VuZGlmDQo+ID4gK21mbl90IGFj
cXVpcmVfcmVzZXJ2ZWRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgbWVtZmxh
Z3MpOw0KPiA+DQo+ID4gICAvKiBNYXAgbWFjaGluZSBwYWdlIHJhbmdlIGluIFhlbiB2aXJ0dWFs
IGFkZHJlc3Mgc3BhY2UuICovDQo+ID4gICBpbnQgbWFwX3BhZ2VzX3RvX3hlbigNCj4gDQo+IENo
ZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

