Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5005B3FA36B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 05:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174180.317771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJpID-000509-3h; Sat, 28 Aug 2021 03:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174180.317771; Sat, 28 Aug 2021 03:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJpIC-0004wg-Vl; Sat, 28 Aug 2021 03:46:04 +0000
Received: by outflank-mailman (input) for mailman id 174180;
 Sat, 28 Aug 2021 03:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJpIB-0004wa-E0
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 03:46:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 763528d4-07b2-11ec-ab31-12813bfff9fa;
 Sat, 28 Aug 2021 03:46:01 +0000 (UTC)
Received: from PR3P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::32)
 by VI1PR0801MB1805.eurprd08.prod.outlook.com (2603:10a6:800:58::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Sat, 28 Aug
 2021 03:45:58 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:57:cafe::47) by PR3P250CA0027.outlook.office365.com
 (2603:10a6:102:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Sat, 28 Aug 2021 03:45:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 03:45:57 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Sat, 28 Aug 2021 03:45:57 +0000
Received: from 82af55dc10f9.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDBC0445-9DB5-4B28-9461-F9F8056A174B.1; 
 Sat, 28 Aug 2021 03:45:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82af55dc10f9.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 03:45:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5147.eurprd08.prod.outlook.com (2603:10a6:10:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 03:45:44 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 03:45:43 +0000
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
X-Inumbo-ID: 763528d4-07b2-11ec-ab31-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZPs8rQNtgUZdOYH74EpquEeoO/o+sfj17Mwr4C86R0=;
 b=mkm0ZgWYFJNwV8Sgmu9O/Lpojo877962it1J7w0+CdCpxmV7HKtVGIXuiW18v9AhMEkd+U7ry1rZd5J5DFPMcxvx0XBPCAC0J/tbY0vG/Z1AuRGHbqK3L9Q5NBdVk2gsoRxzxXAvwfowMani1xxDGW17ScE3jgin9hTsHDkdlLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oent3Gv2ZGpAHKhX9rScmqYaIjAPOe2FVLKW8lDGfQ8tTR6MQC37EFVVLu/vhKPc0KMBwiqx2ps98Dg9f9pz28VyDQIe+2meAa7sASqUTvNVWvDK0zBE8zXHaLy4n7ydkEYTQK2HXeP4H1XnDjLA08bjytRx+wRD6tZQZKfLOyFsITGR5VuwC2YCd2NIdpDMcmUuXzaC977S5IKDtnvEDVn1kuyiYswQIHROwsqv56+vF4hdiO9QHdBZKthUImzcW6JVJBsMTjuyyfXYkD6w8ghop0TiVhCpmrk9JHRIPuT41vfZnI64L5AyDTIe+wv6Rpv5zvRwmO+ruc8htJS01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZPs8rQNtgUZdOYH74EpquEeoO/o+sfj17Mwr4C86R0=;
 b=B2PDQUT+SWUvX6lhARcPEUOhbYRcYAF2FbVhBzNSOUWbDfqYhnfOizZnwl7xYZ/j5xBrnTGD3S1x+/KY7rcH39G+Ng72eyv1WBu9yQ2z3+R6k1IH8EU4ybp1KnEBrtQv5T8nlxA5m28nI81eLGUNgeoJZ8Ewz4diSkFChbx3Np0sOnYcQ5tR46XOHXcj2sd6d+zlDo8ukxwijNr1Vw7fhSly1MqaCb8QCEZWjS3eHEUKq2fXGAkrE0hWKaUueBfY5RyVtrQkmaW+LmLRuf1gpvRRDDKyyeMNU/DsIK2qNu2yFY3HUqrVS5IeWnPrq5N8g/LWanCaC2hmFAQipYt+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZPs8rQNtgUZdOYH74EpquEeoO/o+sfj17Mwr4C86R0=;
 b=mkm0ZgWYFJNwV8Sgmu9O/Lpojo877962it1J7w0+CdCpxmV7HKtVGIXuiW18v9AhMEkd+U7ry1rZd5J5DFPMcxvx0XBPCAC0J/tbY0vG/Z1AuRGHbqK3L9Q5NBdVk2gsoRxzxXAvwfowMani1xxDGW17ScE3jgin9hTsHDkdlLI=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Topic: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Index: AQHXjptRsfRkXW8NoUWuJvdR0xpL2KuHguqAgADGK1CAABeL8A==
Date: Sat, 28 Aug 2021 03:45:43 +0000
Message-ID:
 <DB9PR08MB6857B7537C35BBF1CE347A4F9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-38-wei.chen@arm.com>
 <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
 <DB9PR08MB685769E192E0603F3C723FA09EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB9PR08MB685769E192E0603F3C723FA09EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 863A2ED672F1EE4ABE3B40BC90FD8E4E.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 72e5cc04-0381-4969-b9c1-08d969d65876
x-ms-traffictypediagnostic: DB8PR08MB5147:|VI1PR0801MB1805:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB180526181FC52BEC7954DEAE9EC99@VI1PR0801MB1805.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:374;OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /oZSEW39daTnLYV8BWscSCuUAo4NQefp3pEJo4fSmRz2w6tYz+1z+DOv+xIxe/IFIb/59tqTjUYL/jWwD70h+hTVwiQ5Ak4T8YXYop684QRoIdbP9yvT26416UuRsQ21Rdd9fft7nPufdpXA3tWDEoanoCSJIomJryi7+LGYdjZuXbqyXtMaAC62x2ZAbUYodf/fzw3qU1feNVAkkmwRvqJPgwSYCrSZX8GmpN4TKfSm6rUKWuj3t06RlbuBHLE4q9lRp9/CP5xyiOJ/xzOaeZ1lZyDCjzyuBi4OMq2Pdgr0qCZh03XcXE+vHIu6yb2amYmXNB2/XUTcRtwD/NkT4KY+bWZ9vLdQ1cOnqU0bANtkgmDC2DiYcvr95p3QBU75rzhu5mX2pLTJ8y/ijUYcBUD2CtIJX25nkSU6dGDpdldyqOjHxeqevPHmOEcj7G1fG5hwgOIvj7zDt+q5aYuUD3hOEu3H9M+74hVBritvMML4DV0CX9pJC+O6b+fKtXyubdh9A2uaStm6U2fwvyTA0RTS/ZZJft9n12sIrsb9W2puRHuebPpkv60QUYLzdh5kSREqW/Si+y1u37yORCjTrb7vhWQEQWOVvyPhGF3XWeZhV8nmL+e47iPLVluXkTZz7YY5CyZnphmpwAvrh3MwAkiXKKC+BB6/wv3jaSWZGpX13KEXIAZpZIMmgUwCfCaFEDBHclT295SZjuCPTdnWTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(2940100002)(52536014)(38070700005)(2906002)(26005)(66946007)(83380400001)(122000001)(4326008)(66476007)(64756008)(66556008)(110136005)(8936002)(66446008)(9686003)(5660300002)(8676002)(71200400001)(53546011)(55016002)(316002)(6506007)(33656002)(186003)(38100700002)(86362001)(76116006)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWs0YjV5Vy9DQ2lLRjdxVTRZYUFvbW1ZNC9kZWRQMU5Fd0hMNFM5SXdYOHht?=
 =?utf-8?B?V01XcjVsUXVPa29peUlsZ25qNTdaNE5rZmRFWU5hdXQwRXhwdHlNNHZjdFhF?=
 =?utf-8?B?TnNCM2FNZGIzMG0vbkE0RjFHVGp0L2JYN2crcDFUYlg1VjJjbWhMeGNoNzN0?=
 =?utf-8?B?VkZWcjNFVUVDZWwyZFRCRUxiYzdPVkVmWXYwMlByaGpHN1M2encyQXRtdm5Y?=
 =?utf-8?B?ZzVHTTEvbG5FYkZYcURhRGRSUlpONm9CRnhjd3lDeXh4WkRLaFFLWnBJSVZV?=
 =?utf-8?B?L0toTzQvekRITWJxMHN0SXppZThZOERiNS9KeVZBMnVTb3Q2akRTbm1qdnhG?=
 =?utf-8?B?UWU1dmJnMXRoTzEzR2YvVTlwN3JXMU5nZXNPL0wxWlc2ZG40MnJNOFYzU1Ur?=
 =?utf-8?B?VHVlMXdGbW96VjJvUFk0UmNUdkU4NjNiYWZZeEg0dE1PWTNTZ2FTbHlxWUlL?=
 =?utf-8?B?d1J0ZTc4NWZMU3dFQi9oNjEwWldsVnN5ZllOZ0FTNXVsZ2RuVW51N0FkRVFn?=
 =?utf-8?B?WTFoa2U0Y1FlbUZJNmdmaTUzY2oyV3ZvUVUwOG14bjEramRWWkEzQWhIWVZK?=
 =?utf-8?B?dXpOMmJaUkpiVThlSFp1N0l2UkV0MHlkd25DSkZJWTJvbm90T2t4ay9sQzRG?=
 =?utf-8?B?VEE4S3FnaFdYNXQxM1ZwNDJWQVp5R3BZa2R2c2tPcllUQk0wQ3JIUE4zSFVJ?=
 =?utf-8?B?WDRBcGp1ZHlvZE5ZbzZuZWtjeHEvdFZoUXRiZ3pwa20zZjdVOEJuOGFKWUFR?=
 =?utf-8?B?NzZkcEJpRVNzeFdtR2QwZForR1k2OHlMWXI5WGpxSkJFRXNxcWxRK1NvNzJN?=
 =?utf-8?B?c2V5TWhLMWRpWFFZYkVoM2pDcWMySGEwMXUzdGVXcnNrU1BySmVTcVJjeS9w?=
 =?utf-8?B?bU1RalN1eDVpdFdGQ1pWZFB1NENneXdSOXlOd1A2eDFBaDFoR05oNmFxZ2dp?=
 =?utf-8?B?OWs1YUNuN2dKRTN4c1RMaXVFS04vRHd6SVVvc3Q4bnZ4Sm1ydkxqRFZYME5y?=
 =?utf-8?B?WWtBNVVMSkY4bGIrc1pUWHpkNk5HNEZXRUhwRnllRWFiYzVETGlzMSt1Z0VM?=
 =?utf-8?B?eXVUcTVXSmhUTXk5aTRLYlBFV3BQZWE1RVc5Ty91RGxSQmJyd3JqYXI1WW9Z?=
 =?utf-8?B?eVRuaFZ6ZzlzZndaNG1qbDFCWGVFUHBrc0pndmVIS0l3Z3djS3FyUHZ3Q0tt?=
 =?utf-8?B?azMreDNSZk43bHNPbEpxMWxsZzdoUXRZYlVLZTFVWDUyVEJaYWtBRXJQRzFv?=
 =?utf-8?B?SnVOZVloZE9Ua2dWbUJjaDc4bWtKdmpGaE1Fb1VFUlcxZS8vQmFVN0lGQU0v?=
 =?utf-8?B?QXpJeUFJNVJlRlg0NWVzdWdUcTFRNjhCT1lORlpOdXpQdWNtY3ZNaTN1TVdy?=
 =?utf-8?B?aDhKL0cvSDVMQk13cVFYa0FVK2RjZnZxYlgyeXFHSU1CV0RiWmhZMzBqcTBn?=
 =?utf-8?B?dXVad3BxVXZHdEM1RVZkTzU3QWgrMjdnaG5mcHFjZ2hPTFhCcTc3bkpNU21u?=
 =?utf-8?B?L0RuUlpmblcwQUpNMlJ2SHNFY08yZHZselJPdVlla0laNkpzL29jdTBlR3da?=
 =?utf-8?B?bS9TeS9uQmlCRVhWbHRNQjF5TWtoRFF6aGFCNk5odThLRENQVngxQjFmS28v?=
 =?utf-8?B?T3R3WFRrMHR1T1ZqSDVBazF5N3FVL2MrVWdmenVIcFZDbnZLdGtPQnF0ZVpU?=
 =?utf-8?B?SmhOc29hY1FmekQ4Y3M3L1VnTTZES3RJbndGR3FLYjRWcXIrY051Zm1JUDFa?=
 =?utf-8?Q?Q6z2gdANQljPOlCPb51es0VYzY8iAiVqEnaWc9c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5147
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1cde06a-238a-479c-11e8-08d969d65037
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IpADwP6QrVifgWpGKz1tvVelae+A9BbRY0BCJO1vqzPvRoymDQlwACx3lF4g1IdBwc+m6gExGywB85iOwkbgFHd9e8r0v0qErIgU+By6r7hZ+1Cws38X1aSdryh94aSpxPyx8vr17EXSZOT+P36V1A24fAJ0AWDN9WZ3Py9wQuG5pN/4o5SKp8CeCR2Uve3DGq+LS05zieTiJHt/AA+hwki08pQqBJiCLmZhwSoSAzrJzsXJDxa4dTJUmrnjUAbVwJZ3D17jIgv1U+bel5XSK552uML0OKDzaUKtSXn+RKPsfZAeH3LF0KWJNf4JNmJeU99+I3agFfNGatznV6J2ZVfjO627fknljnSG7ll2BbTVvpi21vypYD0woX5jFqvBdDl81hTtcSEnVIVo+WTRXL+C/Tzxsdkft309vTh8F2xL9ZeixNpyZBWjtW+X5Yx3N+5xgaBpkQcXv4A2yTP2ssJpqBTx7dleXdPpYffGEH/rC5RMfu8b6JN24PA05DO8wxgcRcNRv2PeiS5jKpI/HOgKaLy0Yi2oqeBGcaPhdCGDHdtZfO2kMWoiYI5HOOA/j2CUd6U2ODr2GxLKXyVNJLFT/PPKk8/aZvf/xQ+KwC/VL7WYElABZKUxcmeOii+K8uTVuPvE6jP4bg8FMFO30Hyx0Snz+yrBVY8llH70UeSoDoEq+FrAygQ2tcbqEq2jIxnCisybhnZFOb33UZIP6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(8676002)(36860700001)(47076005)(110136005)(316002)(82310400003)(83380400001)(8936002)(81166007)(7696005)(26005)(53546011)(52536014)(2906002)(5660300002)(356005)(4326008)(6506007)(70206006)(186003)(55016002)(9686003)(508600001)(33656002)(336012)(2940100002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 03:45:57.6361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e5cc04-0381-4969-b9c1-08d969d65876
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1805

SGkgSnVsaWVuLCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBY
ZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhh
bGYgT2YgV2VpDQo+IENoZW4NCj4gU2VudDogMjAyMeW5tDjmnIgyOOaXpSAxMTowOQ0KPiBUbzog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSRTogW1hFTiBSRkMgUEFUQ0ggMzcvNDBdIHhlbjogaW50cm9kdWNlIGFu
IGFyY2ggaGVscGVyIHRvIGRvDQo+IE5VTUEgaW5pdCBmYWlsZWQgZmFsbGJhY2sNCj4gDQo+IEhp
IEp1bGllbiwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6Ug
MjI6MzANCj4gPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7DQo+ID4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hA
c3VzZS5jb20NCj4gPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAzNy80MF0geGVuOiBpbnRyb2R1
Y2UgYW4gYXJjaCBoZWxwZXIgdG8gZG8NCj4gPiBOVU1BIGluaXQgZmFpbGVkIGZhbGxiYWNrDQo+
ID4NCj4gPiBIaSwNCj4gPg0KPiA+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3Rl
Og0KPiA+ID4gV2hlbiBYZW4gaW5pdGlhbGl6ZSBOVU1BIGZhaWxlZCwgc29tZSBhcmNoaXRlY3R1
cmVzIG1heSBuZWVkIHRvDQo+ID4gPiBkbyBmYWxsYmFjayBhY3Rpb25zLiBGb3IgZXhhbXBsZSwg
aW4gZGV2aWNlIHRyZWUgYmFzZWQgTlVNQSwgQXJtDQo+ID4gPiBuZWVkIHRvIHJlc2V0IHRoZSBk
aXN0YW5jZSBiZXR3ZWVuIGFueSB0d28gbm9kZXMuDQo+ID4NCj4gPiAgRnJvbSB0aGUgZGVzY3Jp
cHRpb24gaGVyZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRvIHJlc2V0IHRoZQ0K
PiA+IGRpc3RhbmNlIGZvciBBcm0gYnV0IG5vdCB4ODYuIEluIGZhY3QuLi4NCj4gPg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+ID4g
LS0tDQo+ID4gPiAgIHhlbi9hcmNoL2FybS9udW1hLmMgICAgICAgIHwgMTMgKysrKysrKysrKysr
Kw0KPiA+ID4gICB4ZW4vY29tbW9uL251bWEuYyAgICAgICAgICB8ICAzICsrKw0KPiA+ID4gICB4
ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCB8ICAxICsNCj4gPiA+ICAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9udW1hLmggfCAgNiArKysrKysNCj4gPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hLmMg
Yi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gPiBpbmRleCA2ZWViZjhlOGJjLi4yYTE4Yzk3NDcw
IDEwMDY0NA0KPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+ID4gKysrIGIveGVu
L2FyY2gvYXJtL251bWEuYw0KPiA+ID4gQEAgLTE0MCwzICsxNDAsMTYgQEAgaW50IF9faW5pdCBh
cmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3JhbmdlKGludA0KPiBiYW5rLA0KPiA+ID4NCj4gPiA+
ICAgCXJldHVybiAwOw0KPiA+ID4gICB9DQo+ID4gPiArDQo+ID4gPiArdm9pZCBfX2luaXQgYXJj
aF9udW1hX2luaXRfZmFpbGVkX2ZhbGxiYWNrKHZvaWQpDQo+ID4gPiArew0KPiA+ID4gKyAgICBp
bnQgaSwgajsNCj4gPiA+ICsNCj4gPiA+ICsgICAgLyogUmVzZXQgYWxsIG5vZGUgZGlzdGFuY2Ug
dG8gcmVtb3RlX2Rpc3RhbmNlICovDQo+ID4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgTUFYX05V
TU5PREVTOyBpKysgKSB7DQo+ID4gPiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IE1BWF9OVU1O
T0RFUzsgaisrICkgew0KPiA+ID4gKyAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNlKGksIGos
DQo+ID4gPiArICAgICAgICAgICAgICAgIChpID09IGopID8gTlVNQV9MT0NBTF9ESVNUQU5DRSA6
DQo+IE5VTUFfUkVNT1RFX0RJU1RBTkNFKTsNCj4gPiA+ICsgICAgICAgIH0NCj4gPiA+ICsgICAg
fQ0KPiA+ID4gK30NCj4gPg0KPiA+IC4uLiB0aGlzIGltcGxlbWVudGF0aW9uIGxvb2tzIGZhaXJs
eSBnZW5lcmljLiBTbyBjYW4geW91IGV4cGxhaW4gd2h5IHdlDQo+ID4gbmVlZCBpdCBvbiBBcm0g
YnV0IG5vdCB4ODY/DQo+ID4NCj4gDQo+IFRoaXMgaW1wbGVtZW50YXRpb24gaXMgRFQgb25seSwg
Zm9yIHg4NiwgaXQncyB1c2luZyBhY3BpX3NsaXQuDQo+IEZvciBub3csIEkgYW0gbm90IHF1aXQg
c3VyZSBBQ1BJIG5lZWQgdG8gZG8gZmFsbGJhY2sgb3Igbm90Lg0KPiBPciBzYXkgaW4gYW5vdGhl
ciB3YXksIEkgZG9uJ3Qga25vdyBob3cgdG8gaW1wbGVtZW50IHRoZSBmYWxsYmFjaw0KPiBmb3Ig
QUNQSS4gSSBwbGFubmVkIHRvIHNvbHZlIGl0IGluIEFybSBBQ1BJIHZlcnNpb24gTlVNQSwgc28g
SSBsZWZ0DQo+IGFuIGVtcHR5IGhlbHBlciBmb3IgeDg2Lg0KPiANCj4gQEphbiBCZXVsaWNoIENv
dWxkIHlvdSBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbiBhYm91dCB4ODYgZmFsbGJhY2s/DQo+IA0K
PiANCg0KSSBoYXZlIGEgcXVpY2sgbG9vayBpbnRvIExpbnV4LiBXaGVuIEFyY2ggZG8gbnVtYSBp
bml0IGZhaWxlZCwNCnRoZSBudW1hX2ZyZWVfZGlzdGFuY2Ugd2lsbCBiZSBpbnZva2VkIHRvIHJl
dmVydCBudW1hX2Rpc3RhbmNlLg0KDQoNCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL251
bWEuYyBiL3hlbi9jb21tb24vbnVtYS5jDQo+ID4gPiBpbmRleCBkMTVjMmZjMzExLi44OGYxNTk0
MTI3IDEwMDY0NA0KPiA+ID4gLS0tIGEveGVuL2NvbW1vbi9udW1hLmMNCj4gPiA+ICsrKyBiL3hl
bi9jb21tb24vbnVtYS5jDQo+ID4gPiBAQCAtNDA1LDQgKzQwNSw3IEBAIHZvaWQgX19pbml0IG51
bWFfaW5pdG1lbV9pbml0KHVuc2lnbmVkIGxvbmcNCj4gPiBzdGFydF9wZm4sIHVuc2lnbmVkIGxv
bmcgZW5kX3BmbikNCj4gPiA+ICAgICAgIGNwdW1hc2tfY29weSgmbm9kZV90b19jcHVtYXNrWzBd
LCBjcHVtYXNrX29mKDApKTsNCj4gPiA+ICAgICAgIHNldHVwX25vZGVfYm9vdG1lbSgwLCAodTY0
KXN0YXJ0X3BmbiA8PCBQQUdFX1NISUZULA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICh1
NjQpZW5kX3BmbiA8PCBQQUdFX1NISUZUKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgLyogYXJjaGl0
ZWN0dXJlIHNwZWNpZmllZCBmYWxsYmFjayBvcGVyYXRpb25zICovDQo+ID4gPiArICAgIGFyY2hf
bnVtYV9pbml0X2ZhaWxlZF9mYWxsYmFjaygpOw0KPiA+ID4gICB9DQo+ID4gPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEu
aA0KPiA+ID4gaW5kZXggZGQzMTMyNGIwYi4uYTM5ODJhOTRiNiAxMDA2NDQNCj4gPiA+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL251bWEuaA0KPiA+ID4gQEAgLTI4LDYgKzI4LDcgQEAgZXh0ZXJuIHM4IGRldmljZV90cmVl
X251bWE7DQo+ID4gPiAgIGV4dGVybiB2b2lkIG51bWFfaW5pdChib29sIGFjcGlfb2ZmKTsNCj4g
PiA+ICAgZXh0ZXJuIGludCBudW1hX2RldmljZV90cmVlX2luaXQoY29uc3Qgdm9pZCAqZmR0KTsN
Cj4gPiA+ICAgZXh0ZXJuIHZvaWQgbnVtYV9zZXRfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9k
ZWlkX3QgdG8sIHVpbnQzMl90DQo+ID4gZGlzdGFuY2UpOw0KPiA+ID4gK2V4dGVybiB2b2lkIGFy
Y2hfbnVtYV9pbml0X2ZhaWxlZF9mYWxsYmFjayh2b2lkKTsNCj4gPiA+DQo+ID4gPiAgIC8qDQo+
ID4gPiAgICAqIFRlbXBvcmFyeSBmb3IgZmFrZSBOVU1BIG5vZGUsIHdoZW4gQ1BVLCBtZW1vcnkg
YW5kIGRpc3RhbmNlDQo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1h
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0KPiA+ID4gaW5kZXggZTYzODY5MTM1Yy4u
MjYyODBiMGYzYSAxMDA2NDQNCj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbnVtYS5o
DQo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0KPiA+ID4gQEAgLTIyLDQg
KzIyLDEwIEBAIGV4dGVybiB2b2lkIGluaXRfY3B1X3RvX25vZGUodm9pZCk7DQo+ID4gPiAgIHZv
aWQgc3JhdF9wYXJzZV9yZWdpb25zKHU2NCBhZGRyKTsNCj4gPiA+ICAgdW5zaWduZWQgaW50IGFy
Y2hfZ2V0X2RtYV9iaXRzaXplKHZvaWQpOw0KPiA+ID4NCj4gPiA+ICsvKiBEdW1teSBmdW5jdGlv
biBmb3IgbnVtYSBpbml0IGZhaWxlZCBpbiBudW1hX2luaXRtZW1faW5pdCAqLw0KPiA+ID4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBhcmNoX251bWFfaW5pdF9mYWlsZWRfZmFsbGJhY2sodm9pZCkNCj4g
PiA+ICt7DQo+ID4gPiArICAgIHJldHVybjsNCj4gPg0KPiA+IE5JVDogVGhlIHJldHVybiBpcyBw
b2ludGxlc3MuDQo+ID4NCj4gDQo+IE9LDQo+IA0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICAg
I2VuZGlmDQo+ID4gPg0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gLS0NCj4gPiBKdWxpZW4g
R3JhbGwNCg==

