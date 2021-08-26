Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A173F831B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172749.315234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9my-0003kX-Un; Thu, 26 Aug 2021 07:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172749.315234; Thu, 26 Aug 2021 07:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9my-0003iY-RX; Thu, 26 Aug 2021 07:27:04 +0000
Received: by outflank-mailman (input) for mailman id 172749;
 Thu, 26 Aug 2021 07:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9mx-0003hf-Hx
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:27:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c795e812-1255-4345-867e-1cc035e533e5;
 Thu, 26 Aug 2021 07:27:00 +0000 (UTC)
Received: from AS8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:310::15)
 by AM8PR08MB5651.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:26:55 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::71) by AS8PR04CA0010.outlook.office365.com
 (2603:10a6:20b:310::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 07:26:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:26:55 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Thu, 26 Aug 2021 07:26:55 +0000
Received: from bcfc66db3996.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8347EF50-D2C9-4A8F-BD02-E49120D95EBF.1; 
 Thu, 26 Aug 2021 07:26:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcfc66db3996.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:26:44 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:26:43 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:26:43 +0000
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
X-Inumbo-ID: c795e812-1255-4345-867e-1cc035e533e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcepO3YwAqQF4g357xfzB3MMI6heacQgv7cTAtMWD2Y=;
 b=IyT/7+Tl+H0zFJjhBxowmvk/wu4tzjsMX8UZnadUbNvoSYrMMGn8/FMhNPAP5ge019kJEA65kMHVhIHYKzy1nJpH7HiF/S86nmEPEnnH0nSBaHx9H1fjwefg1yUInLEZY4+ciwelRcvoXLVJ7pmjPXSNBMP7McCtRxk2UqXi+YE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm4XmVJ1+xSAEzgIF9cxAPP5BQ8ifN8RhLN+r7JC6KsDNv7PaE5LJzEg2EV+RFz8S6J4WhVgblHZY41zkZglRt31GnPbNWJKcov1iTC5vPTT4uUX+6YyHudGr0KaRPvKhQcd2jD2iCKe6WrzpQF9OM/ZsesPg4KvTcwAk9wGQVp4tutPAIkAgptqPZAZ+IMsqZT8daZnjBQYUMXHT97kYVIxaR85BYmR91WF0sOSaWtp3TYShTFins12CVGyi+jj8FeOPTBiW54cE7l2aY7v0kCAFDbP1fEtrTwiAdiuasYwvTx9kFJuE5IcfhlSVCklyITsHR6E9VCT7Yb9nt0TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcepO3YwAqQF4g357xfzB3MMI6heacQgv7cTAtMWD2Y=;
 b=VjwQzbGbCgfsRgnzi0zBoVIfZcHSSqYRTcJUMjUWfOeZ8LMyu30378JGNEvL1Sfe1quCzBzUOhnljMJ2Ld1cvRs7BY8BCeaoC362hmNi06oN+yxNzdsOdRnkJrieKcJeFv7nzgUXyXoUG+Wiamq6t0XLOxl2byGH+KGGAlg9ttTDSmOaBDzzVIbamoOwFIkg4VixeqeKkCkI/Ko0WiVnw6yalephefkgr4dDobYPmGgnkH1+H5VWZl3tlsuhfrKPbNtwI/yzhFJmvG+WmEdn8BH223N73nZumudc2sGO9P4mQxs0g6Vys0ONQoKp+SQ7gCxOEP1ZRBvp7zkLmsZrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcepO3YwAqQF4g357xfzB3MMI6heacQgv7cTAtMWD2Y=;
 b=IyT/7+Tl+H0zFJjhBxowmvk/wu4tzjsMX8UZnadUbNvoSYrMMGn8/FMhNPAP5ge019kJEA65kMHVhIHYKzy1nJpH7HiF/S86nmEPEnnH0nSBaHx9H1fjwefg1yUInLEZY4+ciwelRcvoXLVJ7pmjPXSNBMP7McCtRxk2UqXi+YE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 27/40] xen/arm: build CPU NUMA node map while
 creating cpu_logical_map
Thread-Topic: [XEN RFC PATCH 27/40] xen/arm: build CPU NUMA node map while
 creating cpu_logical_map
Thread-Index: AQHXjptIMAmulM0QRkycTkQ5UeyYAauEifIAgADv7oA=
Date: Thu, 26 Aug 2021 07:26:43 +0000
Message-ID:
 <DB9PR08MB6857E33AB16EE4520E9E2C349EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-28-wei.chen@arm.com>
 <59529fea-199d-09af-dbb3-a5067ec86550@xen.org>
In-Reply-To: <59529fea-199d-09af-dbb3-a5067ec86550@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2812E5D3823BF041B5E430EACF29A406.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b5ddb69-010f-405e-8a0c-08d96862e1c5
x-ms-traffictypediagnostic: DB9PR08MB6505:|AM8PR08MB5651:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5651E6947B37E802817BBFBB9EC79@AM8PR08MB5651.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:586;OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q7ZuqWCzazrf7MityT6a/QhOHLAgAQkwUxL/jJhqKmzjdzaONFZONW/cLXUNbizeUS7sEl7YYvDgXKDbKxK86QxdgCkS0HZqW3YYcAZY50I8gj5xAJ37eofe69daCdQb3H8Fy38DDUazEItvpwz/zBKeQTzwFTLIizqFrnNr5EcyDdRUhDC6JqQS0aoBfSvwGIQZAkGwRylKN6H4FRR8QP45XD+PppCvcyCUhgVYPGlOMIJ3bNW94oNHn2XYQUHxjq2UE1TCeHOAp3fHJN+juKwZwLlHnzVT+3/SKdNW0OBJL9gtb7TjviPsV6OizaKSlK8lFaoPg24XiAF2ipO3jFYDS4I1pVlxhvNu0nnxpjRJNEySl2AroZJmtPnz1/ORpM5BRCV6CnrLmfK/818W//zgnlGqI3BhHyCVPfIkcN+wNRU3UfoHlnMtBKjsLTcQi5t2xyBoKNy2K7SLOZwHjpp9zWZctVryMspzoNu96hFktt1meQJUFo41s65NQeI5klzgPqDlJqRjShO8u1ohZdrl0ADURw3mggTGbiLQkAueAmTTOfPKngUxJl0DQZbsXUoHTNNJ/295apjjStyXZ/6MQZ7tGg3pZsoA/6rtjODSxj7WF1DFzU1bB9U4QoLy0iKdwH9OpALwaM76cJwq1AsqyevWZvvQo66EimSvxDU5eszoiKHd9OBCqTJvylbxIWliuBNjTWNGXbozNYlXaA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(38100700002)(8936002)(122000001)(26005)(66476007)(76116006)(66556008)(478600001)(66946007)(53546011)(8676002)(186003)(33656002)(71200400001)(66446008)(38070700005)(64756008)(9686003)(4326008)(5660300002)(2906002)(7696005)(110136005)(55016002)(86362001)(6506007)(83380400001)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTl5bG85TWhiUDZQZ255SDZXSXNZNUhqZC9MYVljckl2a0t1bEVZRU1ZRWhV?=
 =?utf-8?B?TnU0RjFKVVpyeFcvOTl0SDRQbU90dDBybjRrbm5jVmlGdzR6TjNsQkNwTXp0?=
 =?utf-8?B?SWpNc1A0OVVCcjg4b3pyZVY3SmxGUnRrV3U1VVR6UDc3WEQyNm5sdnRKTFlU?=
 =?utf-8?B?eFBRR05maEdiT0FHaHIyY1kzNjc5bHVHTjBRWmM3MElIbnRwV0JnVVg3S3Rq?=
 =?utf-8?B?NFhDZ2wyNjZ4OUF5ajVjaWN4U1pFT1BKYkZzeDBjWm1xQ2poUDZNNC9Hdkkr?=
 =?utf-8?B?VkxSWUtoR3VLVE14OHpmZ0QyTFNDQ1lNN2t2bDlncDRVcUcybStYYm15MjBU?=
 =?utf-8?B?WDFiTGIzaSs5R0xGQ3N5MEF2QjV6eWllS21Id0JoQjVYSzdIV2NjaVpJaHFh?=
 =?utf-8?B?K3Ywc1lTTUFrdjBYRWQzVFloK0NYeVdwUytSM2JuOEVncFpLelgrVVVLekRD?=
 =?utf-8?B?MDg4NzJCNnA2cm9RU0l5cW1vNUYybmdoRGh4eUxBYWhJblYvaEVaYWpCZTVC?=
 =?utf-8?B?QWtJVnBaUjJyY0NOMXVpaUNTa1VSVS9QbXNvdDgwOWVmOUVHaFkveXc0OFZG?=
 =?utf-8?B?a3JiOGN3NGMyY2dTTU5PMnZCWjZYYUdXZ2RDK0s3dXRpTGo5dkdINURBSTVX?=
 =?utf-8?B?ZnNyanQ1TXdTbGtHRlJkbUhOMUxjSlFkVU1LbG1UMXA0cDRJMitWcmcxZFhG?=
 =?utf-8?B?OUdvYlBMR21CcnFCeEdhVGdJQlBTMGtMb3dMVnptRGh4QUJQZWs2WlRUU1VK?=
 =?utf-8?B?b2p5aXBnMysxdmxYU1lYWXVqN01zRG5MeGVWNFBOY2E1RlMvcEhweERWMTAr?=
 =?utf-8?B?d2twVFZoazdUaXRxeXZacHZNRk53dGd1dkdOM0EyN3d2dDhaa2tmdGJKRXdi?=
 =?utf-8?B?SVRmZ1ZFUFdLZkJYU0ZwZng0SHo0WHl6c09HL2oxYkYxMVpBd29NUjJRSURh?=
 =?utf-8?B?aklOQThxYzJFVFNrWUt1RnF6SVBhR2RnQ2c5NkpRQ2YzNXFYVXhQU0cwc2Z0?=
 =?utf-8?B?N2E3VHJGbUZDSDBHS1c4TkljaUN0bUlkNXg5eFhrS2lQWXRld2drR2FZbks2?=
 =?utf-8?B?djViRmVtNFNOcVB1RHBndU5mN1E5bnB5Y01WZjA2RlFSN0J5MVBHRG9INzRG?=
 =?utf-8?B?dnBiR3pqa1VrSm44ZjhMSlgyK1V6QlVNK2ZnZlVOK2pZb0JZWGtDNXFyOERK?=
 =?utf-8?B?UHR3dlVPSHgvMkpkNUV0RW52eTcwTDV0OUx2VXk2bWhDMlA2ais5ekkvWVpF?=
 =?utf-8?B?aFBweGdPMmQvUlBEQ29nVXZIY2lVbnQrRktVY1dReEhHdk9YT2U4cUo1OFFw?=
 =?utf-8?B?dDhRMDRybUdvVVorb0hFZE5TU3oxbys2TDBNVm5ZbWVrdDVsMXlLOUFORjFp?=
 =?utf-8?B?a1lhaTc2eUJQd3lvZWdsWjFrb0x4SUt2eW0rb1lRRXNXWm16WVRvVkRzSVFD?=
 =?utf-8?B?VnhWQW9kZ2M3ZTZJSGEzZGpCMEowZ3hwRlpLcFZ6c3dKU2laZVN5VWRhSitE?=
 =?utf-8?B?b2RMNG5MbnpOYkc3QWpzOXE2MnlkNkFDWGl0SUJPRHJlWUI3UnlrZTB5TWdz?=
 =?utf-8?B?ekUzeUJuTEV1bzR0U3JJUXE4KzIveXY5b3lEVEFUUHdUakZtZmFkbG5ZWXVY?=
 =?utf-8?B?SXRKNjdWd2hVSStnc2FTNFNvVVhKc1NQWUs5UndOZTNwSm1rMy9nN2NpeVND?=
 =?utf-8?B?UFhaVVJMV0RGVUJUQVk5RTVQa2ZXTmdBUmF4bzljNG0rOUV6bnVXdGhKd3VW?=
 =?utf-8?Q?leghXCBPMXA3cCpM5PqsRhYHL8O24fKjcfjdmXq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb915341-6571-4776-be85-08d96862dac2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+90WM4HCPb1/sv50IH4MOt/+fkulsmJo2i+yxE6cWlvaJbq3T9Nh8Mhl95UMXZb05BrcKhogt4LXIK2F/VyNJSjHfhGasbYChi8m9syl2zbrLdS77yE01uh2RA+pYrWjtO9mZ+TdxKXd0pUCeFVkds6VYcu2MLOKrJCjazmwH7Uit9kkQIMDeakizUqs6hzhGaqis0GJGfBn9y0bAMF9Cm//sxXvfF/FI+rI7RphbCQeofrzZLBx7gCeCwtaUptiB0W/X+V0QLXaL13VTZYT+8iJyuDXViskx/9yB6w1JtBNewPwC4NRuxqZZHgH48WVlRGeNu37YWr+W0SbgPdXvnbGztnwaXSKeWnSoLAm98aunuBUP08vHYmQun53xjCTY+5PppMf89OXul2vkI3YAHH6k3NyWCIP24jsAK1F92bwCb1c1GqgZcTHgVoO6Ye+0uoyxlV5qQBuJsUf1M1AwyNUoXWOYCW0oNYX5kn4nUoimEsU1n5mKDM3D9xCQmfQ7HtaCrisi4Yp2QMx4cB+ufis0TEGM/yewteGCAkIyElSbnSpr9926oksU10xtWVn0UdUYdRE4GHir/j0hT+gkJe1xUth0e22ePINkGEzqlWnjZH8ZZh14pLbU1YLxiR/+bhQbuVhhwvPPtF1+Puy60D3Mq0bEtcQRWiN1Fb3rTkRJZ4EHk2dGVp/2YOiXVwd+pa2ss5nff4bQvpExE/hg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(2906002)(83380400001)(9686003)(33656002)(8936002)(5660300002)(81166007)(82740400003)(86362001)(8676002)(356005)(36860700001)(52536014)(478600001)(55016002)(186003)(26005)(7696005)(336012)(47076005)(110136005)(316002)(82310400003)(70206006)(70586007)(4326008)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:26:55.2909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5ddb69-010f-405e-8a0c-08d96862e1c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjbml6UgMTowNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYRU4gUkZDIFBBVENIIDI3LzQwXSB4ZW4vYXJtOiBi
dWlsZCBDUFUgTlVNQSBub2RlIG1hcCB3aGlsZQ0KPiBjcmVhdGluZyBjcHVfbG9naWNhbF9tYXAN
Cj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3Rl
Og0KPiA+IFNvbWV0aW1lcywgQ1BVIGxvZ2ljYWwgSUQgbWF5YmUgZGlmZmVyZW50IHdpdGggcGh5
c2ljYWwgQ1BVIElELg0KPiA+IFhlbiBpcyB1c2luZyBDUFUgbG9naWFsIElEIGZvciBydW50aW1l
IHVzYWdlLCBzbyB3ZSBzaG91bGQgdXNlDQo+ID4gQ1BVIGxvZ2ljYWwgSUQgdG8gY3JlYXRlIG1h
cCBiZXR3ZWVuIE5VTUEgbm9kZSBhbmQgQ1BVLg0KPiANCj4gVGhpcyBjb21taXQgbWVzc2FnZSBn
aXZlcyB0aGUgaW1wcmVzc2lvbiB0aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGZpeCBhDQo+IGJ1Zy4g
SG93ZXZlciwgd2hhdCB5b3UgYXJlIGV4cGxhaW5pbmcgaXMgdGhlIHJlYXNvbiB3aHkgdGhlIGNv
ZGUgd2lsbA0KPiB1c2UgdGhlIGxvZ2ljYWwgSUQgcmF0aGVyIHRoYW4gcGh5c2ljYWwgSUQuDQo+
IA0KPiBJIHRoaW5rIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgZXhwbGFpbiB3aGF0IHRoZSBw
YXRjaCBpcyBkb2luZy4gWW91DQo+IGNhbiB0aGVuIGFkZCBhbiBleHBsYW5hdGlvbiB3aHkgeW91
IGFyZSB1c2luZyB0aGUgQ1BVIGxvZ2ljYWwgSUQuDQo+IFNvbWV0aGluZyBsaWtlICJOb3RlIHdl
IHN0b3JpbmcgdGhlIENQVSBsb2dpY2FsIElEIGJlY2F1c2UuLi4iLg0KPiANCj4gDQoNCk9rDQoN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+
IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyB8IDMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3Qu
YyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiBpbmRleCBhYTc4OTU4YzA3Li5kZDVhNDVi
ZmZjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiArKysgYi94
ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+ID4gQEAgLTEyMSw3ICsxMjEsMTIgQEAgc3RhdGljIHZv
aWQgX19pbml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkNCj4gPiAgICAgICB7DQo+ID4gICAgICAg
ICAgIFswIC4uLiBOUl9DUFVTIC0gMV0gPSBNUElEUl9JTlZBTElEDQo+ID4gICAgICAgfTsNCj4g
PiArICAgIHN0YXRpYyBub2RlaWRfdCBub2RlX21hcFtOUl9DUFVTXSBfX2luaXRkYXRhID0NCj4g
PiArICAgIHsNCj4gPiArICAgICAgICBbMCAuLi4gTlJfQ1BVUyAtIDFdID0gTlVNQV9OT19OT0RF
DQo+ID4gKyAgICB9Ow0KPiA+ICAgICAgIGJvb2wgYm9vdGNwdV92YWxpZCA9IGZhbHNlOw0KPiA+
ICsgICAgdWludDMyX3QgbmlkID0gMDsNCj4gPiAgICAgICBpbnQgcmM7DQo+ID4NCj4gPiAgICAg
ICBtcGlkciA9IGJvb3RfY3B1X2RhdGEubXBpZHIuYml0cyAmIE1QSURSX0hXSURfTUFTSzsNCj4g
PiBAQCAtMTcyLDYgKzE3NywyNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHRfc21wX2luaXRfY3B1
cyh2b2lkKQ0KPiA+ICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAgICAgIH0NCj4g
Pg0KPiA+ICsjaWZkZWYgQ09ORklHX0RFVklDRV9UUkVFX05VTUENCj4gPiArICAgICAgICAvKg0K
PiA+ICsgICAgICAgICAqICBXaGVuIENPTkZJR19ERVZJQ0VfVFJFRV9OVU1BIGlzIHNldCwgdHJ5
IHRvIGZldGNoIG51bWENCj4gaW5mb21hdGlvbg0KPiA+ICsgICAgICAgICAqIGZyb20gQ1BVIGR0
cyBub2RlLCBvdGhlcndpc2UgdGhlIG5pZCBpcyBhbHdheXMgMC4NCj4gPiArICAgICAgICAgKi8N
Cj4gPiArICAgICAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3UzMihjcHUsICJudW1hLW5vZGUt
aWQiLCAmbmlkKSApDQo+IA0KPiBZb3UgY2FuIGF2b2lkIHRoZSAjaWZkZWYgYnkgd3JpdGluZzoN
Cj4gDQo+IGlmICggSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1RSRUVfTlVNQSkgJiYgLi4uICkN
Cj4gDQo+IEhvd2V2ZXIsIEkgd291bGQgdXNpbmcgQ09ORklHX05VTUEgYmVjYXVzZSB0aGlzIGNv
ZGUgaXMgYWxyZWFkeSBEVA0KPiBzcGVjaWZpYy4gU28gd2UgY2FuIHNob3J0ZW4gdGhlIG5hbWUg
YSBiaXQuDQo+IA0KDQpPSw0KDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgICJjcHVbJWRdIGR0cyBwYXRo
OiAlczogZG9lc24ndCBoYXZlIG51bWEgaW5mb21hdGlvbiFcbiIsDQo+IA0KPiBzL2luZm9ybWF0
aW9uL2luZm9ybWF0aW9uLw0KDQpPSw0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgY3B1aWR4
LCBkdF9ub2RlX2Z1bGxfbmFtZShjcHUpKTsNCj4gPiArICAgICAgICAgICAgLyoNCj4gPiArICAg
ICAgICAgICAgICogVGhlIHRoZSBlYXJseSBzdGFnZSBvZiBOVU1BIGluaXRpYWxpemF0aW9uLCB3
aGVuIFhlbg0KPiBmb3VuZCBhbnkNCj4gDQo+IHMvVGhlL0R1cmluZy8/DQoNCk9oLCB5ZXMsIEkg
d2lsbCBmaXggaXQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAqIENQVSBkdHMgbm9kZSBkb2Vz
bid0IGhhdmUgbnVtYS1ub2RlLWlkIGluZm8sIHRoZSBOVU1BDQo+IHdpbGwgYmUNCj4gPiArICAg
ICAgICAgICAgICogdHJlYXRlZCBhcyBvZmYsIGFsbCBDUFUgd2lsbCBiZSBzZXQgdG8gYSBGQUtF
IG5vZGUgMC4gU28NCj4gaWYgd2UNCj4gPiArICAgICAgICAgICAgICogZ2V0IG51bWEtbm9kZS1p
ZCBmYWlsZWQgaGVyZSwgd2Ugc2hvdWxkIHNldCBuaWQgdG8gMC4NCj4gPiArICAgICAgICAgICAg
ICovDQo+ID4gKyAgICAgICAgICAgIG5pZCA9IDA7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsjZW5k
aWYNCj4gPiArDQo+ID4gICAgICAgICAgIC8qDQo+ID4gICAgICAgICAgICAqIDggTVNCcyBtdXN0
IGJlIHNldCB0byAwIGluIHRoZSBEVCBzaW5jZSB0aGUgcmVnIHByb3BlcnR5DQo+ID4gICAgICAg
ICAgICAqIGRlZmluZXMgdGhlIE1QSURSWzIzOjBdDQo+ID4gQEAgLTIzMSw5ICsyNTYsMTIgQEAg
c3RhdGljIHZvaWQgX19pbml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkNCj4gPiAgICAgICAgICAg
ew0KPiA+ICAgICAgICAgICAgICAgcHJpbnRrKCJjcHUlZCBpbml0IGZhaWxlZCAoaHdpZCAlIlBS
SXJlZ2lzdGVyIik6ICVkXG4iLCBpLA0KPiBod2lkLCByYyk7DQo+ID4gICAgICAgICAgICAgICB0
bXBfbWFwW2ldID0gTVBJRFJfSU5WQUxJRDsNCj4gPiArICAgICAgICAgICAgbm9kZV9tYXBbaV0g
PSBOVU1BX05PX05PREU7DQo+ID4gICAgICAgICAgIH0NCj4gPiAtICAgICAgICBlbHNlDQo+ID4g
KyAgICAgICAgZWxzZSB7DQo+ID4gICAgICAgICAgICAgICB0bXBfbWFwW2ldID0gaHdpZDsNCj4g
PiArICAgICAgICAgICAgbm9kZV9tYXBbaV0gPSBuaWQ7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICAg
ICAgIH0NCj4gPg0KPiA+ICAgICAgIGlmICggIWJvb3RjcHVfdmFsaWQgKQ0KPiA+IEBAIC0yNDks
NiArMjc3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkNCj4g
PiAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICAgICAgICAgICBjcHVtYXNrX3NldF9jcHUo
aSwgJmNwdV9wb3NzaWJsZV9tYXApOw0KPiA+ICAgICAgICAgICBjcHVfbG9naWNhbF9tYXAoaSkg
PSB0bXBfbWFwW2ldOw0KPiA+ICsgICAgICAgIG51bWFfc2V0X25vZGUoaSwgbm9kZV9tYXBbaV0p
Ow0KPiA+ICAgICAgIH0NCj4gPiAgIH0NCj4gPiAgICA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAt
LQ0KPiBKdWxpZW4gR3JhbGwNCg==

