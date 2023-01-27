Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7A67E2E6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485451.752703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhv-00044G-Ho; Fri, 27 Jan 2023 11:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485451.752703; Fri, 27 Jan 2023 11:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhv-000413-Df; Fri, 27 Jan 2023 11:15:47 +0000
Received: by outflank-mailman (input) for mailman id 485451;
 Fri, 27 Jan 2023 11:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLMhu-0003zK-0h
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:15:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0fa60c8-9e33-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 12:15:44 +0100 (CET)
Received: from AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17)
 by AM8PR08MB5729.eurprd08.prod.outlook.com (2603:10a6:20b:1de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Fri, 27 Jan
 2023 11:15:42 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::c3) by AM5PR04CA0004.outlook.office365.com
 (2603:10a6:206:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 11:15:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:15:42 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Fri, 27 Jan 2023 11:15:42 +0000
Received: from 4411fa24753b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D751F962-8F4F-436F-9CA2-BF6B06454AC5.1; 
 Fri, 27 Jan 2023 11:15:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4411fa24753b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:15:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:15:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:15:29 +0000
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
X-Inumbo-ID: f0fa60c8-9e33-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9lgnEcGVC/efddQ/CrfPikrjF0gpC28yMH8eiTwciU=;
 b=cBviRByDJoRjhxtwIgpV1MLkHShRIsgOdXxVxLnIaWDc01l/0dj8ytKsGNeQjVPulWSbFRXCX/9JNir15yG9gsdX/3mcjap7EgTNcEakqAShzgsQr228siqpx4GJqSFawxyPXEKkBjCSYf6TiS2IApIMyKBinbQaBzUAdcWwBsU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btGH44JcsbuPIVD7C9278no175282NuC+pajB8hofCkc5FzoVJ9gPtqpH3ySUNAaE1zORFe2IjUihzzVHXY7848uoZhb+KwVUetrfCsuqkOW3q/jB6UxzxDZr2X6ks9r3denjnR3drbSSY9B+lHNR5U0ItXKvnFKMc3SugnejvJqoa5YwCqcpKSDNhlXQrItCzqDdf77bGH7kh/oyLetNr8fPM7hudPASp2DQqNiLGrVsJaWEjlxlvkoh8p69oL3YPn0Vn3WF5NY4EoSpT5mVLFdoJcTppkdSk3drwDbdMTKfT4j/eYDqv11dCGQjFKVt9NaZQPcsr1gctSi6ctUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9lgnEcGVC/efddQ/CrfPikrjF0gpC28yMH8eiTwciU=;
 b=Onh/tBDJ0QB1IBALYxkrxdTuBkf5K4gk8krOgCsDYBbFfBVJ48izWXSuFhLENTuv5EZt7J5+J33psP1LPsgCOHmwRYNe2lWbEEBZwUrA18Cseds5wesfjdsFy7VnRfIwpB3fOz3OEY7X3ciEn6G6PRCMmFP4cjrRIlSIIdXcDvHdOVOwMJl+oRKrGoCUeu5APt90QXhh+CYeYTq3wC9TVZMVJACK85ofd8by2EDIR1jgZbM5L4BGgVhSklxHHyNRRCa6jXCXhL0tJzHsk9cbqQCWAvKgGyVUCY7nG182ZxOMJHeY1SKo+vIrgzOH/l4BktqO9YpADL2ia7mfpgUqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9lgnEcGVC/efddQ/CrfPikrjF0gpC28yMH8eiTwciU=;
 b=cBviRByDJoRjhxtwIgpV1MLkHShRIsgOdXxVxLnIaWDc01l/0dj8ytKsGNeQjVPulWSbFRXCX/9JNir15yG9gsdX/3mcjap7EgTNcEakqAShzgsQr228siqpx4GJqSFawxyPXEKkBjCSYf6TiS2IApIMyKBinbQaBzUAdcWwBsU=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Topic: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Index: AQHZKU4fKh9kG5Xa7kmVEqYgCVpcz66nH76AgAbPKgCABD7DYA==
Date: Fri, 27 Jan 2023 11:15:29 +0000
Message-ID:
 <AS8PR08MB7991A2641FCF28C39F0D2FD692CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-4-Henry.Wang@arm.com>
 <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
 <25264dca-acf6-7ad1-e8a5-a1b893eab30d@xen.org>
In-Reply-To: <25264dca-acf6-7ad1-e8a5-a1b893eab30d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8F1ED35A6B17E7499665B327F6AE5C51.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM7PR08MB5399:EE_|AM7EUR03FT017:EE_|AM8PR08MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: db815b97-4c82-45ac-9f2e-08db0057d42c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jRnkvV4b09vlHo8GTUI2YUYJzNnFcAVnUwqRPqVtLJokG6sPpuz8kEu801VBaocObyKqAZyXaLtuZADph2miRxsxnRhxxTlgN9Ohk+k0eJ4Yu/AsdilkDDguh0H24FhK4B3GZLLAyzKOVqSc4o4VM2Oxztk239YUVjyhBs6EDX08gL5geDSNO2n8SKoPJMEz46cUkMJdq0vgUaneOpdZWSJJqInKkyO04UyG0GVWGZvYIZ6gmOv2ozXW8EEuYdpD59MhYHvrsQtBWxIJ/zQtPpeqWvP9lBjPU7K93llwtVlvmh+BNP3FPTVnVEYThaW0dz7vs7obZNCCJ9kOdoS2qWXi0TdrVU9Mict4+aZevSu7N7oetiuXyZHbSjfRKlcvJDDUkQtGDz/gG6RVXkGCYDt+XuCmDetitZFCAcW1xnV02JIc30eUU1d9322rNoFzdjJd1tBuyZQYEpZiDtdTGBPcXCiwCMkp2Gn9zB74CFfLhBsS9iR/ACNoGnfEiQGs+hm6Zm1Kvxm2I7tV48v/fT/TjZ2IdvrwTuwJrTWrs5A9v0jWN3anZC0F04fVyEv3Z7cBNjqN8gRZya4cislto1ErXT9+rYdYoNyvYlNTbb8q99wJ8A1eANMg+MWftjjAm7VddaLALFHAYrmVVvHHAEEKZbIjj3zC6hP0ai2tCr9RTWzXQw1ceW7X9ptpxKCFVXM+6n1GsNSAJoVmX+eV3w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199018)(7696005)(38070700005)(33656002)(41300700001)(83380400001)(64756008)(66556008)(316002)(66476007)(8676002)(66446008)(66946007)(55016003)(86362001)(76116006)(478600001)(4326008)(54906003)(110136005)(122000001)(5660300002)(4744005)(186003)(26005)(9686003)(2906002)(8936002)(71200400001)(52536014)(38100700002)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c1ce10b-e148-4648-0700-08db0057cc99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lIMG/Xel+bs3sbsuePGIAvSaMOyA3hSxyqf+zF1rGsu9zFqOuAsPYEnG4ui2BVGvDXz/f75BncxIZ4TzyD6uWkWSRcMClHTkatqRiBcEBxjbzMDpBRSfJEdKNof3GzFry2ik+LdFdrnfAoK0AQuTALkpqCFKTLgQ3uXEQdAgRQihCRzsqQ29FXscsGEtKtHiDIrRb0JC65meUeIyHisISd4UpiGHMKEPdLrdNJ1sws6r7notioNvsO2DB3XPfzpyK6dZah9QLm9fGmCuoP4a3mVIOXJaWkT5N7exfNw+GPj4vDRLr0HSOn+jKys+whd/aazZNM5ZL4r5mo1uwr0fHfup5dpb9LwPU31Vq6R1VoRlC4u4ixDWDar8AZThMWDmvn3g08t3R9D04WgzpKyMoyxJnakSarweLxynAmpdyoTIQer+HS5PGqPza/pPch/6mRoJ8WhxEf03fH3gdwXuRfmR+vl42qYsExRqVHvt6wMtZeOAK1X9vi2gaskdKZgsR4p+h73HUiypk1dfJrVvTmqKTRFW9vmgPN6mvhQ5fgBNiqq+fP3/8K3AqS6zBjP0IdWzj0rVYoZPxPaEZaAsKnfBMADK0vrZzGwNaK5GmtY251LXj6dzpiCDsc3JAsP0FUD91/pDhcN/iNLwHe41PvkrJCdtb6QsyHoT1tI7vIsH12hTIUD2Ir/W+XeQU2ir2wkbatIEMad7iZn6xwcG4w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(83380400001)(82310400005)(47076005)(336012)(186003)(26005)(9686003)(36860700001)(6506007)(82740400003)(2906002)(81166007)(4744005)(5660300002)(110136005)(54906003)(356005)(316002)(86362001)(8676002)(40480700001)(4326008)(8936002)(70586007)(52536014)(40460700003)(41300700001)(7696005)(33656002)(478600001)(70206006)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:15:42.4281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db815b97-4c82-45ac-9f2e-08db0057d42c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5729

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+DQo+ID4+IC0g
ICAgQlVHX09OKHAybV90ZWFyZG93bihkLCBmYWxzZSkpOw0KPiA+IEJlY2F1c2UgeW91IHJlbW92
ZSB0aGlzLA0KPiA+PiAgICAgICBBU1NFUlQocGFnZV9saXN0X2VtcHR5KCZwMm0tPnBhZ2VzKSk7
DQo+ID4geW91IG5vIGxvbmdlciBuZWVkIHRoaXMgYXNzZXJ0LCByaWdodD8NCj4gSSB0aGluayB0
aGUgQVNTRVJUKCkgaXMgc3RpbGwgdXNlZnVsIGFzIGl0IGF0IGxlYXN0IHNob3cgdGhhdCB0aGUg
cGFnZXMNCj4gc2hvdWxkIGhhdmUgYmVlbiBmcmVlZCBiZWZvcmUgdGhlIGNhbGwgdG8gcDJtX2Zp
bmFsX3RlYXJkb3duKCkuDQoNCkkgdGhpbmsgSSBhbHNvIHByZWZlciB0byBoYXZlIHRoaXMgQVNT
RVJUKCksIGJlY2F1c2Ugb2YgdGhlIGV4YWN0bHkgc2FtZQ0KcmVhc29uIGFzIEp1bGllbidzIGFu
c3dlci4gSSB0aGluayBoYXZpbmcgdGhpcyBBU1NFUlQoKSB3aWxsIGhlbHAgdXMgdG8NCmF2b2lk
IHBvdGVudGlhbCBtaXN0YWtlcyBpbiB0aGUgZnV0dXJlLg0KDQpNYXkgSSBwbGVhc2UgYXNrIGlm
IHlvdSBhcmUgaGFwcHkgd2l0aCBrZWVwaW5nIHRoaXMgQVNTRVJUKCkgYW5kIEkgY2FuDQpjYXJy
eSB5b3VyIHJldmlld2VkLWJ5IHRhZz8gVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

