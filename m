Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHbAMtWvDWrW1QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:57:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE5B58E5A3
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313950.1583976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgUT-0001CU-Gm; Wed, 20 May 2026 12:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313950.1583976; Wed, 20 May 2026 12:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPgUT-00019a-Dm; Wed, 20 May 2026 12:57:37 +0000
Received: by outflank-mailman (input) for mailman id 1313950;
 Wed, 20 May 2026 12:57:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edwin.Thankachan@electrifex.com>) id 1wPgUR-00019O-FR
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:57:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPgUQ-0045TN-O7
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:57:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edwin.Thankachan@electrifex.com>)
 id 6a0dafb4-5cb7-0a2a0a5109dd-0a2a4504a6fa-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:57:34 +0200
Received: from [3.110.59.181] (helo=repost.tmes-in.trendmicro.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edwin.Thankachan@electrifex.com>)
 id 6a0dafbd-1dec-0a2a45040019-036e3bb5c06f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:57:34 +0200
Received: from 52.101.227.96_.trendmicro.com (unknown [172.26.60.77])
 by repost.tmes-in.trendmicro.com (Postfix) with SMTP id 560E910000699
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:57:32 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (unknown
 [52.101.227.96])
 by repre.tmes-in.trendmicro.com (Trend Micro Email Security) with ESMTPS id
 67B34100002F0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:57:03 +0000 (UTC)
Received: from PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::6)
 by PNYPR01MB11012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:57:01 +0000
Received: from PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::81f0:38bd:ddb5:ab49]) by PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::81f0:38bd:ddb5:ab49%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 12:57:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-TM-MAIL-RECEIVED-TIME: 1779281823.424000
X-TM-MAIL-UUID: f19e9acd-0f21-43d1-929f-844febccb025
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNv7k2HbeZ3C60kCVReRWyKQ2b1uY5puHJRtuIazPF1oVM8qKGxiG/5Pc5zp3C9ZttwMQymp7iXVpiJaHeH/CcLMXEzUFGW64Wb/fG1XjiyMDc9oYbizU9dZRj4LokDPNMCsZ3QoAa8viQTRiPGvFspKjMvv0yxIv3IxSleUl8Z3/vlL0V14GjeImQJnZ3tldKHeUBSnAkyJamq9mreejEj9O1XApLyWNmMxGPZHHOe6c9HL9tQvTaPTqbxRVX5zFRRaCcSSMz5ngWtX9YEBBlrQ7D59wvmm3yy7DX2XZIIN+exxObCf0amdTb17BEKswD88EOOxiPKocZ0TYSzulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/rHjlZbXHG+RAYrjfiUIq+PxBLk66amCccPTg02BgA=;
 b=PJr2mk/wJQy2ZO2fgVm1Its76aTtuH2SOG0bqcNiIliMv6xxC6yqRf7aTWRW/h6uNt8O0ZAeokX9BT3ZdTzEAoUeQGAr/rpJNopmzzzPFUdxXUE7kFmcMuHYCqcRo8RE8t+/JKSLNDzVUgOKvKEJYH62jJ16GqZ+m939PZ05LyqH/4As+0DJQEcNdGfWyohBz2xg4dWFJc0oyMdw5Z2iXxumPXxp7b0ZTrHx8rVJ1mGOZcAwcSvfZqoNVSc1G7WTlT56ksxkLrRr6iuR+QEVR022KikRLCsREHizESGYJ2IYCLsbvBkywJ8rWhduYOrxIpvPazpXM7Y53vXQU7pauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=electrifex.com; dmarc=pass action=none
 header.from=electrifex.com; dkim=pass header.d=electrifex.com; arc=none
From: Edwin Thankachan <Edwin.Thankachan@electrifex.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: unsubscribe
Thread-Topic: unsubscribe
Thread-Index: AQHc6FghEC3STlxKe0KikvTZD7+mZw==
Date: Wed, 20 May 2026 12:57:01 +0000
Message-ID:
 <PN0PR01MB892424B0AE38BCAAACB0C659EC012@PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=electrifex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB8924:EE_|PNYPR01MB11012:EE_
x-ms-office365-filtering-correlation-id: f1a7b0bc-d3cc-4b6f-0cc3-08deb66f48e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|56012099003|18002099003|38070700021|13003099007;
x-microsoft-antispam-message-info:
 j6qVIh6e/95Y0T0ZGMPGLtrNM1bmkTVm6aYR6EXMuRW8Tjq3ueNVj6KCKL4l4/3ICJGAG+hZoMnp4zoqh0FBzatQWNbzG3gBNEgAt5q9sHpcbovJdYlAMt3EH3SLN1lvsjm3wud0r3g7kbs0TQ4ecNR8qhmE1eItqmBdnL5RqZphVQQ2UomRdkOcUe1zLG3lFD8g05jmjfNLPqe+7KtGw1sV24qTKNEApkbj1GZJ1Lg9CWdHBSqb3WE7wuRV3Ltk/rYoXcTzQSwKBPY4HKBjZkYgPe1mtNopX168vB+WZG1yYEDIpxOeA1eJrbGs38xFzxeveNe43bhqQ8QQu6WTJMBzlkA9bZaqTV0ZjQEFCNFdLBA1erthxPP2aVGS+3tcnjkT63lcp8J5WmTQ+Qyd+YyHdfiBzcvuJsgFOfxlRxUZE7mZ0GUKIagpQ3XFVowBNQU2H8JiKYleeuZifkiYIrFeFI42B7frilh4mwyeVdHvwjbAtUStJjau/EFd7Z5AIcIMlqC7zbv+2eYUUZLjMCzTPv+X8PtZLRZrPr71jXSxWGlWkz3ATm6uM14qX+vCFmIMHs22NVSGEhHf6CP/RYAWsVCI7no2zjCdkLXfpge82PJnFCPJcr/7bf3b/cmntJDX8gMWV7h1+mGN4JXXDxQIHNnTtC4ThLnWZ/gFswDM2NmrgSvW+r5SGds4QEDG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(56012099003)(18002099003)(38070700021)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tMiW3J176mOqoidxLCl1Ve8RkFm5BsVUc/u3RGE1hW0PCxvvbFKMqbn0dU?=
 =?iso-8859-1?Q?b36U5dB6vE/o9dx/CUeUbFO0HnrVthj7NSR+BTsG6o5QFKbFSC046ftymC?=
 =?iso-8859-1?Q?FBRGGQ1KEL5leLSa4YJi9vye57PnYnJSmiddqnVYws/H2viU4bGcDDAgZc?=
 =?iso-8859-1?Q?aX3o0qeSZcgRGBG2RURXdaolHKn/izSczJHBBwDOM/6QPEjrv0ioreOZkK?=
 =?iso-8859-1?Q?1f0hDaORps5ubrKzFTgHY/qWxErzE6dAogar/L5I0WbRXYRfzYcnJmDgkf?=
 =?iso-8859-1?Q?/m0FvYDCa85CBQdwChArRCXUU2lClBUsIsmw10xlEEUMxP5pGqsAW/8MPn?=
 =?iso-8859-1?Q?RQd1n88imVmbZcv/9D0OO+zVZ/wt8i62k8ykoaM1ms+0JBIFKm3p2rqxPQ?=
 =?iso-8859-1?Q?DDqBp1aEldYhwAdGr6GCqaorJZAnoOatIOPIoqXjf9QXb6qKXH+XSvybbU?=
 =?iso-8859-1?Q?ikrqFhP7o7g9VJOeGuYGFVP76BUG83lPqTJ8AOVpXIfs4EHcP33rEsp9en?=
 =?iso-8859-1?Q?pTo1F7TuBF04nuMIzkznzBP84QppI4IBvdBBHtd5kvNscdO/S9EsAB1FvJ?=
 =?iso-8859-1?Q?KhX5Idc8MDV9CQOHk+NKxUschgrDqkca3m2XR5Iqg8Wi5aCZvNkppp1jms?=
 =?iso-8859-1?Q?VcYCRbDrI24dmje+rnmJ0+ZFSEYbsZ5mAWI8PU6dYDSDr+FwdpKPrw/rPU?=
 =?iso-8859-1?Q?o8Hmr+cUX98tovJzZm0u5KEtRBsW30T74U12GTfAlFkNdfxNAW03wKJiMd?=
 =?iso-8859-1?Q?vzNbn7UBgMZN3+JqUvhFSYbz6jP7mka/NDR4cyfW4g1bTvfsHkTd/2917a?=
 =?iso-8859-1?Q?D9Aksuc4mSe1m5JR8apXJXO3U9eSoWHp8x7+chZyb6LtNUyIIIIzTctW36?=
 =?iso-8859-1?Q?+r+M38AXo9Vdz7s80fc+a3H4r+groUpv1eUQJsorWqBZ3ZfJO5wa6kff0q?=
 =?iso-8859-1?Q?ecVpqjQPALMyAzvnap40PoYLxkTZZL1RREsSqzs57BX6igT06pqzrNAnKN?=
 =?iso-8859-1?Q?o8Px4LSBxtkarXl3sNFFGUVX/J3WOoNUmAewCCEKAgIUaPcQwtHrr6ru6T?=
 =?iso-8859-1?Q?d/qBWZXj6vCkMQHmCiikVt5vJArgwENDZC+7ASh+1d5+ccqZrG7LESJX9u?=
 =?iso-8859-1?Q?O4ByBZXrqsXK404V2i2u59Ip/x3pqQjmvQ3jdmW89H6lYHUBtlqb9n6ei+?=
 =?iso-8859-1?Q?JciBcPHzmZYhI4HtZeMgkJKlW6v4uiqU2fHAtDZA93UxuW6GM1DFGwXQDe?=
 =?iso-8859-1?Q?Hrh6aBV6epEYsyHNALcDdmIFiYKZl40aYHEYOiFTKD/k1y0jSAmYS0rb8y?=
 =?iso-8859-1?Q?K4+LtTSNzEpIj7emvA5SC7I4y+N/D+9gm/NoY+uE32vuec6mHg/GvGdPpX?=
 =?iso-8859-1?Q?WwM35PMG2IGqByGyIxg+T0dw57KDpf2V6CMESw4MyGprtOOPeOGYAd0j5y?=
 =?iso-8859-1?Q?wiTgdQWHFyhIqko5Sl9IZnZKpqqtEgxlWPUwp9jdFBNdwGOSer6ZaSggfQ?=
 =?iso-8859-1?Q?P3AYz1rHnbKoUyRA6kqfpUevRgEQeyUQxtMfHaVT4trKaQgA1qCj3f3ISc?=
 =?iso-8859-1?Q?MG0OjyBPoHq9XN5AleleSpCrrst0YXT/4gkSG0p0ebf4YEGGK5v8DvTaxt?=
 =?iso-8859-1?Q?vvfo4tFckA6QlwkD8FjnLaNZ6sylBtsdXau25pNoXrEW84VlWDfbbCiEAZ?=
 =?iso-8859-1?Q?5bISTjV4H9dfwJsDaGj9Y2BPyk2LOOGhkR/TFtL1gqaJGDrQw3WgaXo64Y?=
 =?iso-8859-1?Q?ThyP0rdM12tHfPdHCutH7gHQc4xoYQeoo8bjFVSxtB+kA+o7dFGewc2fQG?=
 =?iso-8859-1?Q?V5PcyMV7+mPPnobJG4M5b1eNZa/BZZQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0PR01MB892424B0AE38BCAAACB0C659EC012PN0PR01MB8924INDP_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	JpaM87Zpxgz1W7KrN1DRAylwoiQiYMr8dM5sYdk6F2tNBu+tvqUCGepmF2/VZvwyhz0k0xlmYbDkMj51Wv7N79WB8E+QtES4U78xH57Dr8Iq5i7KsUuZ34Ull20CN+75VQRTMbyttmQoG4TgncuBSwbvVuA+eGRlTbpfn8mB6r/O8oDIf8Xa0oOxKKMwooD3CVEetQngMDXY05Wkuimk8pexC/f8+whs45dZtMjyq/+etuM6d7MRwugGDge36VH98dwIsIANEJIdwT1a+ybhxg1+TRV6EtiLdE4+l2mS5sxORexNBnCIqsfSVI3giiX3Jro+w7Onm5BsTGgg4GWRXQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PSTOvTWdEDWPuZIRhdXXXa6qftjJVhU6snDFuckaUGVT83rrXk0sZ/AJKJ+J2aWyuD0apz0AnKP98YjoqO6kZCwqNM00Kxar80OUelpmMaHc1niczjzfhLIR2Zbl+Lcr1V0lo19QBC+S+NqcSfU/4zwPYRkw9w0nVCZ4pYxDfBCxUz1rKHp0ctXhs4/XU8HKLAYARGQMrVcFKbvVPXMSPGQfs/fEzzPGiCzseRRdU5zz/+4wKKQs7wIWTFui9pZkcXw+o2xkLJbTc2sQhs+EwYBs5kkTCGDjq/L4LLsA586CPxyQByGSSAkY6n/qB0TH1sg8CDkqXkPx1mQGUR/hlx0d9hFByhbgUh9zxrBPP/6LkhY8kT081IshJc+OUN+Qjn98R+6Zkahnn4V6eQ/H1shFVKgQylXfLgahtX5u76gObx4bbAr8JUWWaYDoa49PpxR3ebIPVX99gZFozrPh+7kc2fZjxzaTwa/6YdITlZ0PVVPHSo3/4suHsbIX+zp5jq6NDfTBuFpOmOS7fBSaGQuXoaXhmpbsi/Ybrq/zCFrZsUk7LSiEiwN5RTqDiPfvjtqsd9m1HgWiZ2aNMThqv3em5xIO8mwuqJixWWiWG4U=
X-OriginatorOrg: electrifex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB8924.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a7b0bc-d3cc-4b6f-0cc3-08deb66f48e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 12:57:01.3366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f2626450-e675-4872-bae6-db17376f7643
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJFTomfYFu1BcHPABh6G0j6F4GTlP5tvTN/qJ30tGSII8Jt7Q7GK9TXSLcNVXaOsPm1i7Gu1xLXJ6o+dI8mF/GT4H4vraVmovkocZBewcfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB11012
X-TM-AS-ERS: 52.101.227.96-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.2.1014-29954.006
X-TMASE-Result: 10--13.282000-7.000000
X-TMASE-MatchedRID: UTY1qVrtKF9loDh19hwAerQD5tVOK8yYrVnDQjOPUSHvl/sSkP3Ta16n
	qcxwgJci72nfH9xa/ZiDzVKzxtpbxripA0mFNtPDMtANETYcEGtayaf9MuAM8ZwmoyicyUk4Iia
	XEuKQ0BKif1w5aAHlEujWIKCroftba1MlcefkD6XzHErngGz1SYnzDhr8bhSP4gefAI4RchD7Jq
	mA7t7dY2joepJqlXhIZaJ+QcJBnf6O3MZEKZpyL/Qu6ZqDKgUEuUeJCuB9aL1SMzx3ql2YQ8yfx
	QnKP1ktleSnBtsiioMjkgvxkEq0rOH7RHkgEpGy4z6zHqVW+oLkDloO+14I74mRx7OV7pazHeL4
	9luCA8ViyuQOZndK/eaOLqeqLSisprKwPj9bdNtK6tUNC8nCvL7hGwTSDQ8bVZnNYkc0+t4+FfD
	c5UEa8Q==
X-TMASE-XGENCLOUD: b9071cae-6cf2-487d-8aa1-5e1fd76a34e5-0-0-200-0
X-TM-Deliver-Signature: AC2BCFEB34BD7A0F3935DF3D7888CA61
X-TM-Addin-Auth: RTgpVicZ8LJXWeWfrMxi9SpMJiUQl/HNcGOrX6GtZfOAvEcwzPiv9GljyRR
	3d+Gv2bMbUMEGmNK1IeLYGRDQmoiRqM1iOykiZiEEevndFPvNDSFdRJ/UA0FZAWPFFald0+baD0
	BMaxwZui2HntY3IUyxiWLD43HL+vUMDZXJXd/m7xbcTuX1xUTQbH/BH3pXdnDm2W6tuKxEj6bOj
	lVaRuOVLMl8pPPlKgvD7+5agyVpOe+a3/+sD0roFoH5l+krh1XZvZ+6iueABxVZ1VJoU6HZPk3D
	B+dvdlIyfDRJwsKX946G/G9EyfpAxDofL+93pLyASnuKOQuO9a/QbVJTuw==.p32+CUB2VKEYP9
	dLTFbZd7dQg1TnoMJRD+wXuROBd8yJept6rs8TJM9Q8LbSO27m1/BBU1zM8+lCQHUOO21DJSSQ3
	lzThdvbfFBQj7Y9wqVY6PQGnecHp/teGhoLpD3Xx/HKwa4GeUSLzD+hX0oRynjfHmNNBD7PRwY3
	WLSo3HSNKqyJnzI7xTTNE5ezJyMEjl/+pfappd0fVKxzXw2OPlK4W7zMsGbzElQMHryEBZiwGxo
	IVh7cVxyYF4XPiA/wZDke/9RMxLveoqxcvSprulrOVajYEhQjf+GJheOwxuZ6dRjjk2ltTjuGyO
	BgWec0ugSVdZXuUEheQODx6HM1Sg==
X-TM-Addin-ProductCode: EMS
X-purgate-ID: tlsNG-ebf023/1779281854-2B96A3FF-B4FB2D9E/0/0
X-purgate-type: clean
X-purgate-size: 3227
X-Spamd-Result: default: False [2.01 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[electrifex.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Edwin.Thankachan@electrifex.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edwin.Thankachan@electrifex.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.718];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 3AE5B58E5A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--_000_PN0PR01MB892424B0AE38BCAAACB0C659EC012PN0PR01MB8924INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Best Regards,

Edwin Thankachan

Embedded Software Engineer


Electrifex Technologies Pvt. Ltd.,

Trans Asia Cyber Park, Infopark SEZ Phase 2,

Kochi 682303, Kerala, India

Web:     www.electrifex.com<http://www.electrifex.com/>


--_000_PN0PR01MB892424B0AE38BCAAACB0C659EC012PN0PR01MB8924INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<p style=3D"text-align: left; text-indent: 0px; background-color: rgb(255, =
255, 255); margin: 0px;">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt; color: black;">Best Regar=
ds,</span></p>
<div style=3D"background-color: rgb(255, 255, 255); margin: 0px;">
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-famil=
y: Calibri, sans-serif; font-size: 11pt; color: black;">Edwin Thankachan</s=
pan></p>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Calibri, sa=
ns-serif; font-size: 11pt; color: black;">
<br>
</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Calibri, sa=
ns-serif; font-size: 11pt; color: black;">
Embedded Software Engineer</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Calibri, sa=
ns-serif; font-size: 11pt; color: black;">
<br>
</div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-famil=
y: Calibri, sans-serif; font-size: 11pt; color: black;">Electrifex Technolo=
gies Pvt. Ltd.,&nbsp;</span></p>
<p style=3D"margin: 0px;"><span style=3D"font-family: Calibri, sans-serif; =
font-size: 11pt; color: black;">Trans Asia Cyber Park, Infopark SEZ Phase 2=
,&nbsp;</span></p>
<div style=3D"margin: 0px; font-family: Calibri, sans-serif; font-size: 11p=
t; color: black;">
Kochi 682303, Kerala, India<br>
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, sans-serif; font-size: 11p=
t; color: black;">
Web: &nbsp;&nbsp; &nbsp;<a href=3D"http://www.electrifex.com/" id=3D"LPlnkO=
WAd7422fc4-03a2-5f56-4d3e-22e985e7e014" title=3D"http://www.electrifex.com/=
" style=3D"margin: 0px; text-align: left;">www.electrifex.com</a></div>
</div>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Calibri, sa=
ns-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
</body>
</html>

--_000_PN0PR01MB892424B0AE38BCAAACB0C659EC012PN0PR01MB8924INDP_--


