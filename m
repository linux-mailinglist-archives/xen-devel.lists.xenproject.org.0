Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B596031DC4B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 16:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86321.161995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOqc-0004Nu-2G; Wed, 17 Feb 2021 15:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86321.161995; Wed, 17 Feb 2021 15:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOqb-0004NV-Up; Wed, 17 Feb 2021 15:34:37 +0000
Received: by outflank-mailman (input) for mailman id 86321;
 Wed, 17 Feb 2021 15:34:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrto=HT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lCOqa-0004NQ-Tm
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:34:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 198bdae3-bee6-48b6-ab39-857eb3266086;
 Wed, 17 Feb 2021 15:34:35 +0000 (UTC)
Received: from DB6PR0301CA0049.eurprd03.prod.outlook.com (2603:10a6:4:54::17)
 by AM7PR08MB5429.eurprd08.prod.outlook.com (2603:10a6:20b:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 15:34:33 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::c6) by DB6PR0301CA0049.outlook.office365.com
 (2603:10a6:4:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 15:34:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 15:34:32 +0000
Received: ("Tessian outbound e7cb4a6f0881:v71");
 Wed, 17 Feb 2021 15:34:32 +0000
Received: from 7b3ff4ef2141.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC02212B-DD35-41CD-B325-27E9A1E7F914.1; 
 Wed, 17 Feb 2021 15:34:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b3ff4ef2141.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Feb 2021 15:34:07 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB4703.eurprd08.prod.outlook.com (2603:10a6:802:b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 17 Feb
 2021 15:34:03 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 15:34:03 +0000
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
X-Inumbo-ID: 198bdae3-bee6-48b6-ab39-857eb3266086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FFOxwcZQWPFVOqUytxRxL4okfTTAXoZjcIiUuYeV6M=;
 b=HjddhZpeRrnj4pqMNDi5d7yca4Ek0xoD1hcB9pP+EMwVMb6UYP/NEo+kFKSRY7bZ47b9Vhmir4+6rLjj2Uvvr2B3OJfRKFxnKZ693OvGe9hBIcdt1xRCgreipgJVBtGoj/YB7TF8l5rnY9TJmbkj7YE9JuRV6/Ng69STPCiYBqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13e1fe07bdfb62e6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cITNV7LyOe7PKrfxu3okr3WWp3/0mIHf4VUwMy/b4D1a07y6JoiGcYpsb9EaPnu44PvLKXnZaksqGVOGdVMtSJUnKArVJyzpIFTEhYZx7nNzCpz+d19Ar8kobyuJcMhUNGB/I6VvAsk66+PdURhRn1GozqBIFAuCE1boWdVLc3CPe5ZY9c0TV6ZnOLuneASR6gQLiNRXz8ZeK1L30q/cHNF12+OKoKHF9GuY20o6IfwOMD3VcXYJSuFmlIHuSwfYumq67LGDPNW6ykqd4OMXucznbPd9thglhfJ5unalCRH2/gPt+6591uRlejantn3ztyMbJoFisk3WKlGPB1A1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FFOxwcZQWPFVOqUytxRxL4okfTTAXoZjcIiUuYeV6M=;
 b=ZzcT2IA58AMH5cFT93ylLbI61+I+WrgqiXnFjIpE6k3Y7TRmZH1zJac0LXuxdx7KUIzigY/ONCGfAf+Ip4hTGo2HsCyb3i5DYXSM9QIGewRSRMy3gik6t2FyVFeCS2RAmgp5ViyGwSbS7+xTXhLoyX2wM732uXatn+f6JmQK3gWNQqsadwzEnUPmjzSlLqFdMedI1vYCzAX3qxV7FKKKRbJG2JWaee2wvOHaAHv4Rb8MyJ8y8za1LW8ab4p6jWY6veS58+iM6EKsGb1gjkEym6Bhyy1L1dQ0OmXCQ1rapUDFf57sWC0QHkaL6KTa1hoyY5fKzt1IvYnz9NLapWqH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FFOxwcZQWPFVOqUytxRxL4okfTTAXoZjcIiUuYeV6M=;
 b=HjddhZpeRrnj4pqMNDi5d7yca4Ek0xoD1hcB9pP+EMwVMb6UYP/NEo+kFKSRY7bZ47b9Vhmir4+6rLjj2Uvvr2B3OJfRKFxnKZ693OvGe9hBIcdt1xRCgreipgJVBtGoj/YB7TF8l5rnY9TJmbkj7YE9JuRV6/Ng69STPCiYBqM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Topic: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Index: AQHXBNDUDoMffJM9X0qFA5iW4kfZOqpcev+A
Date: Wed, 17 Feb 2021 15:34:03 +0000
Message-ID: <538F9995-6D8D-4B02-A9B6-7C5F26F95657@arm.com>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8c375bc-a885-4c0b-f25c-08d8d35985fb
x-ms-traffictypediagnostic: VE1PR08MB4703:|AM7PR08MB5429:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5429EDE9F994804AB5704B579D869@AM7PR08MB5429.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FDwAcvwurpPZuI7Wn8D+WvxAo+WpUuZkbXYc3DruCXYqa2o8d4sA8NWr+yDb6+vszvVKpYYPG9C3+qtGiqteph3xvr+AuHM1iJug6+4eU8f1Q3sCmD1GyIq/Yj4xToP0dq5o8GA8Zt+3J/MipY+BuICH47QvN5JQTEBcfNJAscMlqZmY/8pgLeJoXj2YwSEZJQ1h24feoOgGDgXYgpmswG5e6FEgkH2giLON8kzT9xiJbY5VEFzOURaMLDEdVhEZaHhV1UN5RwV5sCk6wfCzTbb8vKmBF147N8CbtcEdc46SlPma0rTKQJvjlAK3Mw6UoH1kjcoyjO4oBuWSZ6kvtq2epGAGnRdJbq9kOOIqlteR7c1GYyhdPeUOOYDQrMNOInmVDcZKBe1DpucVZb+Qx3PM9Q7crxsRT6xfO8vvOCiGlDv9yxTxxhtaifUssDGhU75BprDRmQtCcjU8/2pyjgjdhQ9DwJ+IqEWVz8g29O2+bS4kmZACLgMYdUu/hx8shHskS3k6CB0rYtljfhQa9wnOt0ijzHhsbGAqsjdghHGLB2SUYiq/YIFbgvjfy1Ci8vgilYIKFbimaRRPWngLNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(5660300002)(2616005)(54906003)(33656002)(316002)(6506007)(53546011)(55236004)(6486002)(2906002)(91956017)(76116006)(66946007)(66556008)(186003)(64756008)(66446008)(26005)(66476007)(6916009)(6512007)(478600001)(86362001)(71200400001)(36756003)(83380400001)(8676002)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VGxGbTFBR09TNjhwWnU3eDJNM3lxQzVDaGd6WjNNZ0NSbEk1YWRZTDZiSnhG?=
 =?utf-8?B?ZFlhSjdqSVpCVldXanZkdS9WNktQQ0kveHNZd2pHMUFQQnN1UkIwZkRtTk42?=
 =?utf-8?B?Qm1KVS9HU2lHSjJBOVZoWkxFVUswRTJkWTAxdGJEU21hVVVseVlwSCtFZVhD?=
 =?utf-8?B?QU02b2xoYUxkSU9hMjB1cTR6Mk5VM1h4aFJhL2tlV3lKeXplWFl5V1BFZ3g5?=
 =?utf-8?B?ZnJ3L2xaOGNsWi9udnlmSDI5SFpXK2RxMERnRXJmd0Y5WFlIKzF5Zk15MXpx?=
 =?utf-8?B?NzJBdWV2WUUvL25maG1NbnJxdnlWS2V5R0lMcEFWVGUzYzE0ZTE0UllMa3hX?=
 =?utf-8?B?eXA1dVVoV0NkbU5ZME02R2laZ3F1R1c5eDZhZHZPY0NJcFRBSVJ1NkplemRE?=
 =?utf-8?B?UllFQlQ3NEhlcUdsWVgrMkdtdGVnQlVrdWZTcjArWTF3dVJTSXlOSi8xdGdL?=
 =?utf-8?B?ZmdxOHBhS1RwYzV3QkRKNGphQVJjT3orOHZLdjlUWDFhYlNjU1NrMldVdFZv?=
 =?utf-8?B?VUtkWXkvSTlRTmZ2emF1cVpTM1d3dWJLZFpYQ1QvL3BzaUtqZTB3a0NUMXp0?=
 =?utf-8?B?QkNib2U1N0JLdmdNekl4ZFJTNDJXNzRpbUFoY3JqTmg1WEpRQlI1c05JTVA4?=
 =?utf-8?B?RGtIS3NvSU1KeFRhNWFRb3hZVCs0OTFCUDdTanltd0kyNkZZVjdSazRGRERK?=
 =?utf-8?B?UHV2eTEyaVBYZXJMZFdZcnBkSnI4S1l3cW9YRUlPU3dvSGd6Sk5kVTdhMysr?=
 =?utf-8?B?VWxFa0hKOUJjWUtNeFdJYUVLTENPNnpMRWFac3g3VGhJRXVQOHJ4Q1UrNDF4?=
 =?utf-8?B?T1hqbnZTTHBnK3puNFRXdjZYcWtZY2hXYjQ2aEtiaG1ZZFM5MldYTm5JZXhC?=
 =?utf-8?B?T0lWeXlvTU11QTkyQU9ISGtaQ05RdzMweEZ1YjJ0QVhmTFl2bGJ6dEI5d0lQ?=
 =?utf-8?B?b3Z2VUlQMEdDaHRmemdVNDdnVFpQOUJtQ1dqbis3VW0vZW52TWpyUUtIL1Y3?=
 =?utf-8?B?aGdRa0FFdk9rY1dqaHFianBGRksvbWxqY1JjZ2haMzdyUDJUaG9tTFc1elhH?=
 =?utf-8?B?VS9xblpENVcwSldXOWtKQXBaRWdYVTVuRGJudC9OR0JaSzdFMmJEd1ZIaDRt?=
 =?utf-8?B?cW9pRVRLWlJjblMwaHNDV0YxL2FTMUpFeVBFL0RTLzlPUUJiV1FnTVhsQjNG?=
 =?utf-8?B?UjhvK1loamZkU3htWXJ2OFZ5dmFDS3NadEZoT0FLNzlGc3VMZWtFRUZ2S0Zq?=
 =?utf-8?B?TFJIeG9XcmpKSzZMOERza3dZMXB4c25HTWZweWZSM2phYUlTWXo2YUVFQnB6?=
 =?utf-8?B?cnZZL2p0bkJOVkZHN1JHQmpwMVhodXFET0tYVzdtREJTSUd0L1pVSnRBdStl?=
 =?utf-8?B?eThYcmM3cldobWRabHdBcTN1TTBQdW5reFV1eFljTTFsVmJ5bkdCS3dyejk3?=
 =?utf-8?B?cnozV3dwK2plNlYxOTdYSzNjOW44UUpQUUZZRWl0NkQwVXVkK3gxSWRMMWEv?=
 =?utf-8?B?bDFkTCtPNm1VSHM3VjJHcFBGaXp3ekt0NllBa0g2SGFNeGwxNFB4TEFad3Yw?=
 =?utf-8?B?WXFjbUlWOFp0WFNTdkUwcWZNVE44SmZhQmNxMi83UnB0VXhVeHNBYUhoTVBU?=
 =?utf-8?B?WmlrNFpPWDBEdWJPQWlaTXNSMEoxeGNmOHY0WjdZdjRxc3pWekNLMTgwZnFZ?=
 =?utf-8?B?YVJyRWNZVkJhNlRHcGNMa1lHb0xnd095eGNveXJWZHJzR1pCajlQdHJ0dytN?=
 =?utf-8?Q?NDTjB43T1zVNbv7EW/AKciCu1xW0bKw1rvxmmA9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31DDAD82CB9EBC469C6A7FA3B429C9BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f62ad6ff-094c-4359-c45f-08d8d3597485
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPqoGl64iC8BI9EbBMA6PX8YL1Znnn900K/+u5b7ZYzIiL/FwbZKdGDL31PeljiEhvlARJGyprolakS3FY2jUjXxikSgEew7KjaiIXGcFSMbkHLyjE0wUXKIUa8MfOx4tcHwFKgEl+yCYLWEbIVMCY57pKFupJdReaOD1sGV3WYql+l5JafIljoaYN6Rjy+WGhNY9AHPlIjpQsZtHGlPbkIKxTG0Y7NGbfnfBlW34w8cDO/XoXS5iYHtR58LU3NYucOAACo0GS8CNCgCmMlIbi4XrxHdYASb72fdiQnjqgwDpQYwP9Kr0FFrAYfDug+73xnbs5eqwLY/20TNQSm4LNX1sEteTSY52aj+nvscdgEUDRFS5pWlmCSaXTLXNaAmTt3f/OmxapEZTiHTHLXNSZ/cv/MjKP4Wg1DuUyrANd6fWf36uUDhfe6FJDuTPxsimPSvQjh9LvaoiEW178oxs9BkSOyVUmYr3ybWcLyhKYV/mHd/KOVYNRVJ4Ohqls7ZNvK+yVx3Uf1zTnMNzTislMSrRd3MvN4n/9Cd5IoWlbhUqLTAwRB0MxfOKwoc3GQmojNfFRRRjLmFM/XNrBkFp0KN+3dEAnTXwvbgw4dMEahtsy07DMHSOmMvWJ9Z7FjNO1AU2KD825z/eAZlK/9A5oRg0Sn0VoeTW27k/2W0Aug=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(8936002)(86362001)(55236004)(336012)(82310400003)(70586007)(83380400001)(2906002)(36756003)(2616005)(356005)(186003)(26005)(8676002)(81166007)(53546011)(6506007)(6512007)(6486002)(478600001)(82740400003)(36860700001)(70206006)(54906003)(47076005)(33656002)(4326008)(5660300002)(316002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 15:34:32.6256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c375bc-a885-4c0b-f25c-08d8d35985fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5429

SGkgU3RlZmFubywNCg0KPiBPbiAxNyBGZWIgMjAyMSwgYXQgMDI6MDAsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBhbGwsDQo+IA0K
PiBUb2RheSBMaW51eCB1c2VzIHRoZSBzd2lvdGxiLXhlbiBkcml2ZXIgKGRyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMpIHRvDQo+IHRyYW5zbGF0ZSBhZGRyZXNzZXMgZm9yIERNQSBvcGVyYXRpb25z
IGluIERvbTAuIFNwZWNpZmljYWxseSwNCj4gc3dpb3RsYi14ZW4gaXMgdXNlZCB0byB0cmFuc2xh
dGUgdGhlIGFkZHJlc3Mgb2YgYSBmb3JlaWduIHBhZ2UgKGEgcGFnZQ0KPiBiZWxvbmdpbmcgdG8g
YSBkb21VKSBtYXBwZWQgaW50byBEb20wIGJlZm9yZSB1c2luZyBpdCBmb3IgRE1BLg0KPiANCj4g
VGhpcyBpcyBpbXBvcnRhbnQgYmVjYXVzZSBhbHRob3VnaCBEb20wIGlzIDE6MSBtYXBwZWQsIERv
bVVzIGFyZSBub3QuIE9uDQo+IHN5c3RlbXMgd2l0aG91dCBhbiBJT01NVSBzd2lvdGxiLXhlbiBl
bmFibGVzIFBWIGRyaXZlcnMgdG8gd29yayBhcyBsb25nDQo+IGFzIHRoZSBiYWNrZW5kcyBhcmUg
aW4gRG9tMC4gVGhhbmtzIHRvIHN3aW90bGIteGVuLCB0aGUgRE1BIG9wZXJhdGlvbg0KPiBlbmRz
IHVwIHVzaW5nIHRoZSBNRk4sIHJhdGhlciB0aGFuIHRoZSBHRk4uDQo+IA0KPiANCj4gT24gc3lz
dGVtcyB3aXRoIGFuIElPTU1VLCB0aGlzIGlzIG5vdCBuZWNlc3Nhcnk6IHdoZW4gYSBmb3JlaWdu
IHBhZ2UgaXMNCj4gbWFwcGVkIGluIERvbTAsIGl0IGlzIGFkZGVkIHRvIHRoZSBEb20wIHAybS4g
QSBuZXcgR0ZOLT5NRk4gdHJhbnNsYXRpb24NCj4gaXMgZW5zdGFibGlzaGVkIGZvciBib3RoIE1N
VSBhbmQgU01NVS4gRG9tMCBjb3VsZCBzYWZlbHkgdXNlIHRoZSBHRk4NCj4gYWRkcmVzcyAoaW5z
dGVhZCBvZiB0aGUgTUZOKSBmb3IgRE1BIG9wZXJhdGlvbnMgYW5kIHRoZXkgd291bGQgd29yay4g
SXQNCj4gd291bGQgYmUgbW9yZSBlZmZpY2llbnQgdGhhbiB1c2luZyBzd2lvdGxiLXhlbi4NCj4g
DQo+IElmIHlvdSByZWNhbGwgbXkgcHJlc2VudGF0aW9uIGZyb20gWGVuIFN1bW1pdCAyMDIwLCBY
aWxpbnggaXMgd29ya2luZyBvbg0KPiBjYWNoZSBjb2xvcmluZy4gV2l0aCBjYWNoZSBjb2xvcmlu
Zywgbm8gZG9tYWluIGlzIDE6MSBtYXBwZWQsIG5vdCBldmVuDQo+IERvbTAuIEluIGEgc2NlbmFy
aW8gd2hlcmUgRG9tMCBpcyBub3QgMToxIG1hcHBlZCwgc3dpb3RsYi14ZW4gZG9lcyBub3QNCj4g
d29yayBhcyBpbnRlbmRlZC4NCj4gDQo+IA0KPiBUaGUgc3VnZ2VzdGVkIHNvbHV0aW9uIGZvciBi
b3RoIHRoZXNlIGlzc3VlcyBpcyB0byBhZGQgYSBuZXcgZmVhdHVyZQ0KPiBmbGFnICJYRU5GRUFU
X0FSTV9kb20wX2lvbW11IiB0aGF0IHRlbGxzIERvbTAgdGhhdCBpdCBpcyBzYWZlIG5vdCB0byB1
c2UNCj4gc3dpb3RsYi14ZW4gYmVjYXVzZSBJT01NVSB0cmFuc2xhdGlvbnMgYXJlIGF2YWlsYWJs
ZSBmb3IgRG9tMC4gSWYNCj4gWEVORkVBVF9BUk1fZG9tMF9pb21tdSBpcyBzZXQsIExpbnV4IHNo
b3VsZCBza2lwIHRoZSBzd2lvdGxiLXhlbg0KPiBpbml0aWFsaXphdGlvbi4gSSBoYXZlIHRlc3Rl
ZCB0aGlzIHNjaGVtZSB3aXRoIGFuZCB3aXRob3V0IGNhY2hlDQo+IGNvbG9yaW5nIChoZW5jZSB3
aXRoIGFuZCB3aXRob3V0IDE6MSBtYXBwaW5nIG9mIERvbTApIG9uIFpDVTEwMiBhbmQgaXQNCj4g
d29ya3MgYXMgZXhwZWN0ZWQ6IERNQSBvcGVyYXRpb25zIHN1Y2NlZWQuDQoNCldvdWxkbuKAmXQg
aXQgYmUgZWFzaWVyIHRvIG5hbWUgdGhlIGZsYWcgWEVORkVBVF9BUk1fc3dpb3RsYl9uZWVkZWQg
Pw0KDQo+IA0KPiANCj4gV2hhdCBhYm91dCBzeXN0ZW1zIHdoZXJlIGFuIElPTU1VIGlzIHByZXNl
bnQgYnV0IG5vdCBhbGwgZGV2aWNlcyBhcmUNCj4gcHJvdGVjdGVkPw0KPiANCj4gVGhlcmUgaXMg
bm8gd2F5IGZvciBYZW4gdG8ga25vdyB3aGljaCBkZXZpY2VzIGFyZSBwcm90ZWN0ZWQgYW5kIHdo
aWNoDQo+IG9uZXMgYXJlIG5vdDogZGV2aWNlcyB0aGF0IGRvIG5vdCBoYXZlIHRoZSAiaW9tbXVz
IiBwcm9wZXJ0eSBjb3VsZCBvcg0KPiBjb3VsZCBub3QgYmUgRE1BIG1hc3RlcnMuDQo+IA0KPiBQ
ZXJoYXBzIFhlbiBjb3VsZCBwb3B1bGF0ZSBhIHdoaXRlbGlzdCBvZiBkZXZpY2VzIHByb3RlY3Rl
ZCBieSB0aGUgSU9NTVUNCj4gYmFzZWQgb24gdGhlICJpb21tdXMiIHByb3BlcnR5LiBJdCB3b3Vs
ZCByZXF1aXJlIHNvbWUgYWRkZWQgY29tcGxleGl0eQ0KPiBpbiBYZW4gYW5kIGVzcGVjaWFsbHkg
aW4gdGhlIHN3aW90bGIteGVuIGRyaXZlciBpbiBMaW51eCB0byB1c2UgaXQsDQo+IHdoaWNoIGlz
IG5vdCBpZGVhbC4gSG93ZXZlciwgdGhpcyBhcHByb2FjaCB3b3VsZCBub3Qgd29yayBmb3IgY2Fj
aGUNCj4gY29sb3Jpbmcgd2hlcmUgZG9tMCBpcyBub3QgMToxIG1hcHBlZCBzbyB0aGUgc3dpb3Rs
Yi14ZW4gc2hvdWxkIG5vdCBiZQ0KPiB1c2VkIGVpdGhlciB3YXkuDQoNCldvdWxkIGl0IGJlIHJl
YWxpc3RpYyB0byBzYXkgdGhhdCBjYWNoZSBjb2xvcmluZyBjYW5ub3QgYmUgdXNlZCB3aXRob3V0
IGFuIElPTU1VID8NCg0KSGF2aW5nIGEgZmxhZyBmb3IgdGhlIHN3aW90bGIgaXMgYSBnb29kIGlk
ZWEgYmVjYXVzZSBpbiB0aGUgY3VycmVudCBzdGF0dXMgdGhlIHN3aXRjaA0KdG8gdXNlIG9yIG5v
dCBzd2lvdGxiIGlzIG1vcmUgb3IgbGVzcyBpbXBsaWNpdC4gDQpCdXQgc29tZWhvdyB0aGVyZSBh
cmUgdXNlIGNhc2VzIHdoZXJlIHdlIHNob3VsZCBzaW1wbHkgc2F5IOKAnG5vdCBzdXBwb3J0ZWTi
gJ0gYXMNCndlIGRvIGZvciBleGFtcGxlIGZvciBwYXNzdGhyb3VnaCByaWdodCBub3cuIE1heWJl
IGNhY2hlIGNvbG9yaW5nIGlzIGEgY2FzZSBsaWtlDQp0aGF0Lg0KDQo+IA0KPiANCj4gRm9yIHRo
ZXNlIHJlYXNvbnMsIEkgd291bGQgbGlrZSB0byBwcm9wb3NlIGEgc2luZ2xlIGZsYWcNCj4gWEVO
RkVBVF9BUk1fZG9tMF9pb21tdSB3aGljaCBzYXlzIHRoYXQgdGhlIElPTU1VIGNhbiBiZSByZWxp
ZWQgdXBvbiBmb3INCj4gRE1BIHRyYW5zbGF0aW9ucy4gSW4gc2l0dWF0aW9ucyB3aGVyZSBhIERN
QSBtYXN0ZXIgaXMgbm90IFNNTVUNCj4gcHJvdGVjdGVkLCBYRU5GRUFUX0FSTV9kb20wX2lvbW11
IHNob3VsZCBub3QgYmUgc2V0LiBGb3IgZXhhbXBsZSwgb24gYQ0KPiBwbGF0Zm9ybSB3aGVyZSBh
biBJT01NVSBpcyBwcmVzZW50IGFuZCBwcm90ZWN0cyBtb3N0IERNQSBtYXN0ZXJzIGJ1dCBpdA0K
PiBpcyBsZWF2aW5nIG91dCB0aGUgTU1DIGNvbnRyb2xsZXIsIHRoZW4gWEVORkVBVF9BUk1fZG9t
MF9pb21tdSBzaG91bGQNCj4gbm90IGJlIHNldCAoYmVjYXVzZSBQViBibG9jayBpcyBub3QgZ29p
bmcgdG8gd29yayB3aXRob3V0IHN3aW90bGIteGVuLikNCj4gVGhpcyBhbHNvIG1lYW5zIHRoYXQg
Y2FjaGUgY29sb3Jpbmcgd29uJ3QgYmUgdXNhYmxlIG9uIHN1Y2ggYSBzeXN0ZW0gKGF0DQo+IGxl
YXN0IG5vdCB1c2FibGUgd2l0aCB0aGUgTU1DIGNvbnRyb2xsZXIgc28gdGhlIHN5c3RlbSBpbnRl
Z3JhdG9yIHNob3VsZA0KPiBwYXkgc3BlY2lhbCBjYXJlIHRvIHNldHVwIHRoZSBzeXN0ZW0pLg0K
DQpBbnkgc3lzdGVtIHdoZXJlIHlvdSBoYXZlIGFuIElPTU1VIGJ1dCBub3QgY292ZXJpbmcgYWxs
IGRldmljZXMgaXMNCmFsbW9zdCBpbXBvc3NpYmxlIHRvIG1hZ2ljYWxseSBoYW5kbGUgc21vb3Ro
bHkgYW5kIHdpbGwgcmVxdWlyZSBzb21lDQpjYXJlZnVsbCBjb25maWd1cmF0aW9uLiBTYWRseSBh
cyB5b3Ugc3RhdGVkLCB3ZSBkbyBub3QgaGF2ZSBhIHdheSB0bw0KYXV0by1kZXRlY3Qgc3VjaCBh
IGNhc2UuDQoNCj4gDQo+IEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IGlmIHdlIHdhbnRlZCB0byBl
eHRlbmQgdGhlIGludGVyZmFjZSB0byBhZGQgYQ0KPiBsaXN0IG9mIHByb3RlY3RlZCBkZXZpY2Vz
IGluIHRoZSBmdXR1cmUsIGl0IHdvdWxkIHN0aWxsIGJlIHBvc3NpYmxlLiBJdA0KPiB3b3VsZCBi
ZSBjb21wYXRpYmxlIHdpdGggWEVORkVBVF9BUk1fZG9tMF9pb21tdS4NCj4gDQo+IA0KPiBIb3cg
dG8gc2V0IFhFTkZFQVRfQVJNX2RvbTBfaW9tbXU/DQo+IA0KPiBXZSBjb3VsZCBzZXQgWEVORkVB
VF9BUk1fZG9tMF9pb21tdSBhdXRvbWF0aWNhbGx5IHdoZW4NCj4gaXNfaW9tbXVfZW5hYmxlZChk
KSBmb3IgRG9tMC4gV2UgY291bGQgYWxzbyBoYXZlIGEgcGxhdGZvcm0gc3BlY2lmaWMNCj4gKHhl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvKSBvdmVycmlkZSBzbyB0aGF0IGEgc3BlY2lmaWMgcGxhdGZv
cm0gY2FuDQo+IGRpc2FibGUgWEVORkVBVF9BUk1fZG9tMF9pb21tdS4gRm9yIGRlYnVnZ2luZyBw
dXJwb3NlcyBhbmQgYWR2YW5jZWQNCj4gdXNlcnMsIGl0IHdvdWxkIGFsc28gYmUgdXNlZnVsIHRv
IGJlIGFibGUgdG8gb3ZlcnJpZGUgaXQgdmlhIGEgWGVuDQo+IGNvbW1hbmQgbGluZSBwYXJhbWV0
ZXIuDQo+IA0KPiBTZWUgYXBwZW5kZWQgcGF0Y2ggYXMgYSByZWZlcmVuY2UuDQoNCkkgcmVhbGx5
IHRoaW5rIHRoZSBuYW1pbmcgb2YgdGhlIGZsYWcgd2lsbCBuZWVkIHRvIGJlIG1vZGlmaWVkLg0K
DQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBTdGVmYW5vDQo+
IA0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24va2VybmVsLmMgYi94ZW4vY29tbW9uL2tl
cm5lbC5jDQo+IGluZGV4IDdhMzQ1YWU0NWUuLjRkYmVmNDgxOTkgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9jb21tb24va2VybmVsLmMNCj4gKysrIGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KPiBAQCAtMTYs
NiArMTYsNyBAQA0KPiAjaW5jbHVkZSA8eGVuL2h5cGZzLmg+DQo+ICNpbmNsdWRlIDx4c20veHNt
Lmg+DQo+ICNpbmNsdWRlIDxhc20vY3VycmVudC5oPg0KPiArI2luY2x1ZGUgPGFzbS9wbGF0Zm9y
bS5oPg0KPiAjaW5jbHVkZSA8cHVibGljL3ZlcnNpb24uaD4NCj4gDQo+ICNpZm5kZWYgQ09NUEFU
DQo+IEBAIC01NDksNiArNTUwLDkgQEAgRE8oeGVuX3ZlcnNpb24pKGludCBjbWQsIFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPiAgICAgICAgICAgICAgICAgZmkuc3VibWFwIHw9
IDFVIDw8IFhFTkZFQVRfZG9tMDsNCj4gI2lmZGVmIENPTkZJR19BUk0NCj4gICAgICAgICAgICAg
Zmkuc3VibWFwIHw9ICgxVSA8PCBYRU5GRUFUX0FSTV9TTUNDQ19zdXBwb3J0ZWQpOw0KPiArICAg
ICAgICAgICAgaWYgKCAhcGxhdGZvcm1faGFzX3F1aXJrKFBMQVRGT1JNX1FVSVJLX0RPTTBfSU9N
TVUpICYmDQo+ICsgICAgICAgICAgICAgICAgIGlzX2hhcmR3YXJlX2RvbWFpbihkKSAmJiBpc19p
b21tdV9lbmFibGVkKGQpICkNCj4gKyAgICAgICAgICAgICAgICBmaS5zdWJtYXAgfD0gKDFVIDw8
IFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUpOw0KPiAjZW5kaWYNCj4gI2lmZGVmIENPTkZJR19YODYN
Cj4gICAgICAgICAgICAgaWYgKCBpc19wdl9kb21haW4oZCkgKQ0KPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9ybS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wbGF0Zm9y
bS5oDQo+IGluZGV4IDk5N2ViMjUyMTYuLjA5NGE3NmQ2NzcgMTAwNjQ0DQo+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcGxhdGZvcm0uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Bs
YXRmb3JtLmgNCj4gQEAgLTQ4LDYgKzQ4LDExIEBAIHN0cnVjdCBwbGF0Zm9ybV9kZXNjIHsNCj4g
ICogc3RyaWRlLg0KPiAgKi8NCj4gI2RlZmluZSBQTEFURk9STV9RVUlSS19HSUNfNjRLX1NUUklE
RSAoMSA8PCAwKQ0KPiArLyoNCj4gKyAqIFF1aXJrIGZvciBwbGF0Zm9ybXMgd2hlcmUgdGhlIElP
TU1VIGlzIHByZXNlbnQgYnV0IGRvZXNuJ3QgcHJvdGVjdA0KPiArICogYWxsIERNQS1jYXBhYmxl
IGRldmljZXMuDQo+ICsgKi8NCj4gKyNkZWZpbmUgUExBVEZPUk1fUVVJUktfRE9NMF9JT01NVSAo
MSA8PCAxKQ0KPiANCj4gdm9pZCBwbGF0Zm9ybV9pbml0KHZvaWQpOw0KPiBpbnQgcGxhdGZvcm1f
aW5pdF90aW1lKHZvaWQpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbGF0
Zm9ybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wbGF0Zm9ybS5oDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjU0MjdlOGI4NTENCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BsYXRmb3JtLmgNCj4gQEAgLTAsMCArMSwxMyBA
QA0KPiArI2lmbmRlZiBfX0FTTV9YODZfUExBVEZPUk1fSA0KPiArI2RlZmluZSBfX0FTTV9YODZf
UExBVEZPUk1fSA0KPiArDQo+ICsjZW5kaWYgLyogX19BU01fWDg2X1BMQVRGT1JNX0ggKi8NCj4g
Kw0KPiArLyoNCj4gKyAqIExvY2FsIHZhcmlhYmxlczoNCj4gKyAqIG1vZGU6IEMNCj4gKyAqIGMt
ZmlsZS1zdHlsZTogIkJTRCINCj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0DQo+ICsgKiBpbmRlbnQt
dGFicy1tb2RlOiBuaWwNCj4gKyAqIEVuZDoNCj4gKyAqLw0KPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvcHVibGljL2ZlYXR1cmVzLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZmVhdHVyZXMuaA0K
PiBpbmRleCAxNjEzYjJhYWI4Li5hZGFhMmE5OTVkIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvZmVhdHVyZXMuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZmVhdHVyZXMu
aA0KPiBAQCAtMTE0LDYgKzExNCwxMSBAQA0KPiAgKi8NCj4gI2RlZmluZSBYRU5GRUFUX2xpbnV4
X3JzZHBfdW5yZXN0cmljdGVkICAgMTUNCj4gDQo+ICsvKg0KPiArICogYXJtOiBkb20wIGlzIHN0
YXJ0ZWQgd2l0aCBJT01NVSBwcm90ZWN0aW9uLg0KPiArICovDQo+ICsjZGVmaW5lIFhFTkZFQVRf
QVJNX2RvbTBfaW9tbXUgICAgICAgICAgICAxNg0KPiArDQo+ICNkZWZpbmUgWEVORkVBVF9OUl9T
VUJNQVBTIDENCj4gDQo+ICNlbmRpZiAvKiBfX1hFTl9QVUJMSUNfRkVBVFVSRVNfSF9fICovDQoN
Cg==

