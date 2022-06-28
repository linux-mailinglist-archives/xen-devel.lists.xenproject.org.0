Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86555BF73
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 10:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357015.585415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o66cs-0000AX-PJ; Tue, 28 Jun 2022 08:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357015.585415; Tue, 28 Jun 2022 08:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o66cs-000082-ML; Tue, 28 Jun 2022 08:31:14 +0000
Received: by outflank-mailman (input) for mailman id 357015;
 Tue, 28 Jun 2022 08:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q6TN=XD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o66cr-00007E-6p
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 08:31:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa235118-f6bc-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 10:31:11 +0200 (CEST)
Received: from DU2P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::14)
 by DU2PR08MB7309.eurprd08.prod.outlook.com (2603:10a6:10:2e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 08:30:51 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::24) by DU2P251CA0004.outlook.office365.com
 (2603:10a6:10:230::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 08:30:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 08:30:50 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Tue, 28 Jun 2022 08:30:50 +0000
Received: from f35499f39983.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 558FEC84-5E43-45A3-B542-D4B0758B1BC3.1; 
 Tue, 28 Jun 2022 08:30:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f35499f39983.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 08:30:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4582.eurprd08.prod.outlook.com (2603:10a6:20b:8f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 08:30:42 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 08:30:42 +0000
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
X-Inumbo-ID: aa235118-f6bc-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A5brDs99770jOtsi41dlOwVl9/neVoe0+gDcWhfsae7dd8lhRFkgijmJGwWYFFZLQdyvSdMVHC7WLxskZW7JfmC6+Sl9KnmhCf69O/HsPTo9AL+GD5q4+zQryOznRtiHwNHfzb1cl45pFFIJW7bjTOciqoHVmqoCmZfgCY1FuvJPOOLbpWYWog64Ic40cZ/W4M85MOTiYN6mwkts0RAbcUowelitwoRuZE2YMsTzrubhU8MySc3UcNC7IIm/3p6gc5TShRAGVtsTnFLuPFfxxPME4lCTYKAD/eveOGDtkNlX6jFNZkUpHEshvwOrExe/KEQ+/uf6rdwDHveBoOrrFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A6db0l4g8W7LA6weOSLOmOMkU2UVydY50Od/z+f9/c=;
 b=ejPwGhZ/2L5xutvd7lw1kAOSE7l5ZNTokeQEpSQnzIXJQwfBvhJYjbqmAOsrUWTh2H45cf6Qyj2totVlUlLm6y+Gtd8L13tDBsd0ujV7LaW8E9HeZLo6HHtN+auGX25BHjc6IL+5MpKJj/MBt+mc9Q+VUDPq4kqPobtLS2j0nIf8mojeeXZqLEA1/PR/i+htEvpUdN042oispN/QakVDvRXMHB83rTxVdZqE8LGtrUGzGg3oTlp+TVAkgolf2BIUgzhBgmjPtI8tMeX7K+Dh7AGwV5m/LMaK82ombck5tQDFXZrDlt19Xxg3o5b6BO/WfYFSOoWv2bQ38LO/5qWouw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A6db0l4g8W7LA6weOSLOmOMkU2UVydY50Od/z+f9/c=;
 b=CPu0w1Q4ebO4fQbRrJvK+rxKaky5yTSdgqlHBKvarX57X5OkvtwxHAik441Rk0JDmilMQNycKmKPIdM4DBxrCBE5xajAd57E2KTLNW2NcJ3CdEJhHt3wjoHcVgSzbfnWQzB9it6VkGXhOTpt7nK/oi7xrh0QEvpVqpnDh0/Qh24=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5jOBJfpDV27clp57rI7rtAHQ3RfSf38/Php/KFGg9ZXGgV49LsLCOf8+J0wCnaUrMAbLcHKDdAUqbGkNO+bkb0yQmiEuC9flwTaq68qmDd+Qc52OmoGZ1Bgqps7n6UvSIUDc+0Q0wgpqzAk/N9R6sUuINI1DT41HZjPryB08zlk4jbu4tisnKcy3JtS2V7MSxeH3CArSOTivZGdPNZzhzWKBueXBGnv4hPm9ZXtDgu36ce0wZx9k05XYXXc4e2W+a/NkhjJvu9n2m7nLaNKWG60WiUY/r2/EGz4k8RbJDVGAwqPDYBo2dmv01rIeoL+u+Pcw2X4/khEz1hKS4WuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A6db0l4g8W7LA6weOSLOmOMkU2UVydY50Od/z+f9/c=;
 b=YZNQRJlgZB7qI9efjAiYNKjZv0tcQTDZjsGIhqGzCjb/nFcWoIsnjXSsbYTd9HUN6SSXM0f+KAJqvYs9l6BcMCdzEvVkz4d2Tks/84/CDClPsVyL/RBhIAaNLXYhP/peBefLcC4vfLuLiXJnEn/sbNERCfsRWYHtBorOxKCKysTCU8A1GBNtJhRXTJpImYwZvUbVPJnzE0rGFmlVQvPq9clFUTdJymsTGD8gan6ErZyECTKS2OC8g8aWTSbgU9wzazpKnTdar3wb+NZQOJGlNEWqtzeUVEVFqJ/l+FI/uwOXm0O9xFM1kSu22xV8tZFDz7oazX1PvFXl2I7aSmaQoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A6db0l4g8W7LA6weOSLOmOMkU2UVydY50Od/z+f9/c=;
 b=CPu0w1Q4ebO4fQbRrJvK+rxKaky5yTSdgqlHBKvarX57X5OkvtwxHAik441Rk0JDmilMQNycKmKPIdM4DBxrCBE5xajAd57E2KTLNW2NcJ3CdEJhHt3wjoHcVgSzbfnWQzB9it6VkGXhOTpt7nK/oi7xrh0QEvpVqpnDh0/Qh24=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index:
 AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjCAABXrgIAAECwAgAAEoICABjJ8oA==
Date: Tue, 28 Jun 2022 08:30:42 +0000
Message-ID:
 <PAXPR08MB7420FBD6CB737E5819CDADF79EB89@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
In-Reply-To: <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 73BACCE1B4EF4B4EB0A3406A26254B3C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bda9c244-fb01-4421-2ae1-08da58e0824a
x-ms-traffictypediagnostic:
	AM6PR08MB4582:EE_|DBAEUR03FT052:EE_|DU2PR08MB7309:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d9+PCaEtz/TwlVNQMg8JjaBTCnHrNw3dsk+mKL32bkt9t43c8ltUjEWqxEcFr1VjN+fl6ro5l2mTLWoOT7G1RJ53fKRnstNSP5wPHwdor3brl1YYIvk8sRZUZSNwFB80BU1ZgkuZMlcuIW8UC3OniT3q2O7GDrwiYSHo0EGWKnDLXstAstpoPADNsMUManeDuvwLdd6Jx5PrNp9hU4EkX+tea4NiH9RJ+Pf//OQiWa+CWIndjDvQ156fCR4+8eSyMGANZ9iEfzox0xZuCk8s4g1oiE49TlKKgTiNbk0Xmxzm7qqAsPAFvB31fowJB/0wOJ6/CqxYcFSnA6KnU0SazK/mtK2ZXPahOeZaPR/VPzH1LlYQAmx2gjRUz5sq7CPw3zH2b/PxiPWWiLliqIylEm/wpwJV971sdLVfQGIpZbHi9RDzkmyt8GfhGJZH5EJU2WdsCZELJ59s0TcDof0NmApZP+0GAjzFrOZjbZ+iB/i47Sxiq5tbAlUaAvMxocfwVSNfqT0m4foVEeb23r58LgMUgTm/r9deBAkXsqlozXBdhS0BAdepmEfE00zZu1llqahIDHiFhVOfWsbuCnxw9EK1GO6RLObLQqVKJUDK98Hl9lmRzQQN8PwHnNzFtoiAK2V3jXkZCHx7hcDD2fl4MM/03DE2+32tAzQe7tiCx9EZZsxglHqSGL7Db37BG2m2XS7/y9GtWYFa0js/DvWiFd16gGrQ8Osb340ibVX3dDXZs2HjaEAbpjO08h56oSm9jancKZojtiYqJbGtAN5lLwXWuIZVxqaG14kb83+W3+Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(2906002)(55016003)(86362001)(26005)(53546011)(54906003)(66446008)(186003)(110136005)(4326008)(9686003)(66476007)(52536014)(83380400001)(478600001)(6506007)(8936002)(38070700005)(66946007)(8676002)(71200400001)(33656002)(38100700002)(7696005)(41300700001)(66556008)(316002)(122000001)(64756008)(5660300002)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4582
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cec87480-b695-4308-6c6f-08da58e07d87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PobkkJUpcgWC2cjFydLl2SCNcEgRQmGZOY1pKsY9fTs4xt7c+IykJ4IRj6061CZMNwYE7EvSmsoa44q0G47faM4wk7JZ3FSE/w7P6gMsS1UIYjxki/y3Fo/p5g2toqT4ckRmxMRctK2SiThKNutdwEFCtDYB2vMpSpLHky8/Uj7qh1+GTvGI8sCbQsskb4KNudqWxfVJzW2iV/Qj8hBARJK33hjowVe8fIRa2bcUjgTRwQvxH0AMtZ7XYuxtg3++zYvNMHmIg+HDmMVfpddsQQJID3mj8n7xXrX4+5BMHsvvwDcL73c1dDZhFmVPP0E5YIsYIKlHbkFFQMD3dX30dwtsYBONlbSIKwqnhq2aVfhU8JxF2uYmN+V/zfbz+oPqbibGl0py098WRyIhPQybEF0Qmoc13NPbkFlRp3Ymd0NTlZXW+2Ynu90Cjyg4z5+Tcbcs5LlE3a66BI1LiFubYJS9lzUcX/hGukMQrLUfYqFlxuE1fwqHFI9rks9hLeMx8h/s6vgsTUSSfVorxkwI15urYWhk+7SPfy9esQHU2WyeerKzmdPW4Pbg0SaYendvHrOcOkQVtjl2hx61PzvlWsnQR9IA0BVQjgkVp9kr9IbVqJcuXnQqxmpfOUnmtU0cSEM+M96DRTcXQ8rDWW28/u73TXEskM7GqZ5SmCkm/k+vpHNLzixWxltaU+y/jxkOLsjnLHY9h5rPjNI1/Ac8DspRmoY9PyKVYb5iXupCcU5N4ZF2VYMR7xAwZzrUT54vG0OvUwokiwThVMF20IxGE/M5FsbNYPyNNgyPrvltokCICZ2AvMqtL4Z3cF1TTpHV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(40470700004)(46966006)(36840700001)(26005)(2906002)(186003)(52536014)(478600001)(81166007)(40460700003)(6506007)(33656002)(5660300002)(356005)(36860700001)(47076005)(70586007)(4326008)(82740400003)(86362001)(336012)(41300700001)(53546011)(8936002)(9686003)(110136005)(7696005)(40480700001)(83380400001)(55016003)(8676002)(316002)(54906003)(82310400005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 08:30:50.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9c244-fb01-4421-2ae1-08da58e0824a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7309

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ25pyIMjTml6UgMTc6NTAN
Cj4gVG86IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0u
Y29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNo
dWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEppYW1laSBYaWUNCj4gPEppYW1laS5YaWVA
YXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIENoZW4NCj4gPFdl
aS5DaGVuQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS84XSB4ZW46IHJldXNl
IHg4NiBFRkkgc3R1YiBmdW5jdGlvbnMgZm9yIEFybQ0KPiANCj4gSGkgSmFuLA0KPiANCj4gT24g
MjQvMDYvMjAyMiAxMDozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24gMjQuMDYuMjAyMiAx
MDozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+PiBPbiAyNC8wNi8yMDIyIDA4OjE4LCBXZWkg
Q2hlbiB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAyMDIy5bm0
NuaciDIz5pelIDIwOjU0DQo+ID4+Pj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0K
PiA+Pj4+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47DQo+IEp1bGllbg0KPiA+Pj4+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+ID4+Pj4gVm9s
b2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3Bl
cg0KPiA+Pj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Ow0KPiBXZWkNCj4gPj4+PiBMaXUgPHdsQHhlbi5vcmc+OyBK
aWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+OyB4ZW4tDQo+ID4+Pj4gZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvOF0geGVuOiBy
ZXVzZSB4ODYgRUZJIHN0dWIgZnVuY3Rpb25zIGZvciBBcm0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDEw
LjA2LjIwMjIgMDc6NTMsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vTWFrZWZpbGUNCj4gPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL01ha2VmaWxlDQo+ID4+Pj4+
IEBAIC0xLDYgKzEsNSBAQA0KPiA+Pj4+PiAgICBvYmotJChDT05GSUdfQVJNXzMyKSArPSBhcm0z
Mi8NCj4gPj4+Pj4gICAgb2JqLSQoQ09ORklHX0FSTV82NCkgKz0gYXJtNjQvDQo+ID4+Pj4+IC1v
YmotJChDT05GSUdfQVJNXzY0KSArPSBlZmkvDQo+ID4+Pj4+ICAgIG9iai0kKENPTkZJR19BQ1BJ
KSArPSBhY3BpLw0KPiA+Pj4+PiAgICBvYmotJChDT05GSUdfSEFTX1BDSSkgKz0gcGNpLw0KPiA+
Pj4+PiAgICBpZm5lcSAoJChDT05GSUdfTk9fUExBVCkseSkNCj4gPj4+Pj4gQEAgLTIwLDYgKzE5
LDcgQEAgb2JqLXkgKz0gZG9tYWluLm8NCj4gPj4+Pj4gICAgb2JqLXkgKz0gZG9tYWluX2J1aWxk
LmluaXQubw0KPiA+Pj4+PiAgICBvYmoteSArPSBkb21jdGwubw0KPiA+Pj4+PiAgICBvYmotJChD
T05GSUdfRUFSTFlfUFJJTlRLKSArPSBlYXJseV9wcmludGsubw0KPiA+Pj4+PiArb2JqLXkgKz0g
ZWZpLw0KPiA+Pj4+PiAgICBvYmoteSArPSBnaWMubw0KPiA+Pj4+PiAgICBvYmoteSArPSBnaWMt
djIubw0KPiA+Pj4+PiAgICBvYmotJChDT05GSUdfR0lDVjMpICs9IGdpYy12My5vDQo+ID4+Pj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUNCj4gPj4+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL2VmaS9NYWtlZmlsZQ0KPiA+Pj4+PiBAQCAtMSw0ICsxLDEyIEBADQo+ID4+Pj4+ICAgIGlu
Y2x1ZGUgJChzcmN0cmVlKS9jb21tb24vZWZpL2VmaS1jb21tb24ubWsNCj4gPj4+Pj4NCj4gPj4+
Pj4gK2lmZXEgKCQoQ09ORklHX0FSTV9FRkkpLHkpDQo+ID4+Pj4+ICAgIG9iai15ICs9ICQoRUZJ
T0JKLXkpDQo+ID4+Pj4+ICAgIG9iai0kKENPTkZJR19BQ1BJKSArPSAgZWZpLWRvbTAuaW5pdC5v
DQo+ID4+Pj4+ICtlbHNlDQo+ID4+Pj4+ICsjIEFkZCBzdHViLm8gdG8gRUZJT0JKLXkgdG8gcmUt
dXNlIHRoZSBjbGVhbi1maWxlcyBpbg0KPiA+Pj4+PiArIyBlZmktY29tbW9uLm1rLiBPdGhlcndp
c2UgdGhlIGxpbmsgb2Ygc3R1Yi5jIGluIGFybS9lZmkNCj4gPj4+Pj4gKyMgd2lsbCBub3QgYmUg
Y2xlYW5lZCBpbiAibWFrZSBjbGVhbiIuDQo+ID4+Pj4+ICtFRklPQkoteSArPSBzdHViLm8NCj4g
Pj4+Pj4gK29iai15ICs9IHN0dWIubw0KPiA+Pj4+PiArZW5kaWYNCj4gPj4+Pg0KPiA+Pj4+IFRo
aXMgaGFzIGNhdXNlZA0KPiA+Pj4+DQo+ID4+Pj4gbGQ6IHdhcm5pbmc6IGFyY2gvYXJtL2VmaS9i
dWlsdF9pbi5vIHVzZXMgMi1ieXRlIHdjaGFyX3QgeWV0IHRoZQ0KPiBvdXRwdXQgaXMNCj4gPj4+
PiB0byB1c2UgNC1ieXRlIHdjaGFyX3Q7IHVzZSBvZiB3Y2hhcl90IHZhbHVlcyBhY3Jvc3Mgb2Jq
ZWN0cyBtYXkgZmFpbA0KPiA+Pj4+DQo+ID4+Pj4gZm9yIHRoZSAzMi1iaXQgQXJtIGJ1aWxkIHRo
YXQgSSBrZWVwIGRvaW5nIGV2ZXJ5IG9uY2UgaW4gYSB3aGlsZSwNCj4gd2l0aA0KPiA+Pj4+IChp
ZiBpdCBtYXR0ZXJzKSBHTlUgbGQgMi4zOC4gSSBndWVzcyB5b3Ugd2lsbCB3YW50IHRvIGNvbnNp
ZGVyDQo+IGJ1aWxkaW5nDQo+ID4+Pj4gYWxsIG9mIFhlbiB3aXRoIC1mc2hvcnQtd2NoYXIsIG9y
IHRvIGF2b2lkIGJ1aWxkaW5nIHN0dWIuYyB3aXRoIHRoYXQNCj4gPj4+PiBvcHRpb24uDQo+ID4+
Pj4NCj4gPj4+DQo+ID4+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIHdpbGwgdHJ5
IHRvIHVzZSAtZnNob3J0LXdjaGFyIGZvcg0KPiBBcm0zMiwNCj4gPj4+IGlmIEFybSBtYWludGFp
bmVycyBhZ3JlZS4NCj4gPj4NCj4gPj4gTG9va2luZyBhdCB0aGUgY29kZSB3ZSBkb24ndCBzZWVt
IHRvIGJ1aWxkIFhlbiBhcm02NCB3aXRoIC1mc2hvcnQtd2NoYXINCj4gPj4gKGFzaWRlIHRoZSBF
RkkgZmlsZXMpLiBTbyBpdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2h5IHdlIHdvdWxkIHdhbnQg
dG8NCj4gPj4gdXNlIC1mc2hvcnQtd2NoYXIgZm9yIGFybTMyLg0KPiA+DQo+ID4gV2UgZG9uJ3Qg
dXNlIHdjaGFyX3Qgb3V0c2lkZSBvZiBFRkkgY29kZSBhZmFpY3QuIEhlbmNlIHRvIGFsbCBvdGhl
ciBjb2RlDQo+ID4gaXQgc2hvdWxkIGJlIGJlbmlnbiB3aGV0aGVyIC1mc2hvcnQtd2NoYXIgaXMg
aW4gdXNlLiBTbyB0aGUgc3VnZ2VzdGlvbg0KPiA+IHRvIHVzZSB0aGUgZmxhZyB1bmlsYXRlcmFs
bHkgb24gQXJtMzIgaXMgcmVhbGx5IGp1c3QgdG8gc2lsZW5jZSB0aGUgbGQNCj4gPiB3YXJuaW5n
Ow0KPiANCj4gT2suIFRoaXMgaXMgb2RkLiBXaHkgd291bGQgbGQgd2FybiBvbiBhcm0zMiBidXQg
bm90IG90aGVyIGFyY2g/IFdlaSwgZG8NCj4geW91IHRoaW5rIHlvdSBjYW4gaGF2ZSBhIGxvb2s/
DQo+IA0KDQpKYW4gaGFzIGFscmVhZHkgZ2l2ZW4gc29tZSBhbnN3ZXJzLiBJJ2xsIGhhdmUgYSBs
b29rIGFuZCBzZWUgaWYgdGhlcmUncw0KYSBiZXR0ZXIgd2F5Lg0KDQpDaGVlcnMsDQpXZWkgQ2hl
bg0KDQo+ID4gb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZCBJIGNhbid0IHNlZSBhbnl0aGluZyB3cm9u
ZyB3aXRoIHVzaW5nDQo+ID4gdGhlIG9wdGlvbiBhbHNvIGZvciBBcm02NCBvciBldmVuIGdsb2Jh
bGx5LiBZZXQgb3RvaCB3ZSB0eXBpY2FsbHkgdHJ5IHRvDQo+ID4gbm90IG1ha2UgY2hhbmdlcyBm
b3IgZW52aXJvbm1lbnRzIHdoZXJlIHRoZXkgYXJlbid0IHJlYWxseSBuZWVkZWQuDQo+IA0KPiBJ
IGFncmVlLiBJZiB3ZSBuZWVkIGEgd29ya2Fyb3VuZCwgdGhlbiBteSBwcmVmZXJlbmNlIHdvdWxk
IGJlIHRvIG5vdA0KPiBidWlsZCBzdHViLmMgd2l0aCAtZnNob3J0LXdjaGFyLg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

