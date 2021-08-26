Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603243F8073
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 04:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172654.315052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ56G-00057P-DU; Thu, 26 Aug 2021 02:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172654.315052; Thu, 26 Aug 2021 02:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ56G-000557-7o; Thu, 26 Aug 2021 02:26:40 +0000
Received: by outflank-mailman (input) for mailman id 172654;
 Thu, 26 Aug 2021 02:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ56E-000551-IC
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 02:26:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 086d7570-0615-11ec-a9c4-12813bfff9fa;
 Thu, 26 Aug 2021 02:26:35 +0000 (UTC)
Received: from DB6PR0301CA0046.eurprd03.prod.outlook.com (2603:10a6:4:54::14)
 by AM6PR08MB3398.eurprd08.prod.outlook.com (2603:10a6:20b:4e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 02:26:33 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::6e) by DB6PR0301CA0046.outlook.office365.com
 (2603:10a6:4:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 02:26:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 02:26:32 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Thu, 26 Aug 2021 02:26:32 +0000
Received: from e852e1f9f1eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5490678-DAD4-4EF5-A58C-402B0B2DE99A.1; 
 Thu, 26 Aug 2021 02:26:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e852e1f9f1eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 02:26:27 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6121.eurprd08.prod.outlook.com (2603:10a6:10:204::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Thu, 26 Aug
 2021 02:26:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 02:26:25 +0000
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
X-Inumbo-ID: 086d7570-0615-11ec-a9c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbn4mjJ2jxToEN5TilOhqTYts0V1eQ1gVjZhzT1+9Bw=;
 b=JoIczPacA+TcRSI2z5HQEewrms261Ysf8O9+yaZlQ0IWQBY3OWhk2iNbmPsRR+srV5Hu3rOS0EbkHH428pKh/LLE2W8xIZN26RD1JVw2lgHNc4J3sKTXuxe+iHzxv3not1gpAdg65JTgr7udoZ19pqyFgK0Rr8jWV+hevV0j7g0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaYSyR5VgQIEHeuuCqhwL8bV/JXhradZXoyGsMg7vIXU5GqrfJThlYyMQq7x5dk0jVUxnwrFW2vsiZNx8BVMBjUSpvot+WgkF/06gME/U3/NmUZs6S6N7R1sv+kFixRcsT8SR+VxecKzaCFiVpa41V92iqaYldcopK5u0gQnUAESH6Au/h76dVlTpEuVzh6h0urpOjNGnsVkCNi++2GCt7tlMr2t8uW+DFd4Mn/uOXWG5e2zZQQYeBRGL9aeDABrNg18RgqrBl4TD8f+QeuijcGlRmJsx2E1Ki12Zi/X81R80cAdZT7/EdXDh68BJ0/meo9JcwNoaClm3WSSXm6/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbn4mjJ2jxToEN5TilOhqTYts0V1eQ1gVjZhzT1+9Bw=;
 b=CIuti0ow/YxsOFaYgeGJj4bKdBCRj7pR2MoCg/RD2UaZ/9sURXGBiUvSc/OQ54lQIRW/+Kw3racxwNVogNwspAi8BD+Z9ElCKWKfufhIjwSQFfsohOx3ElpMbHdi5tNNnpWYEOQY1+uT9HWoAJt2eyMb2uS4H+yQVgMgePb4VmpB8TJTXckjUMLBSVD6YSCA+xB7oWe9pSyox2E8fH9bA1J1BznNxwqsUXEWlz0dCu/EHzC3aVB6PHo+ihQvv+Li8GPnf+zmhd+++AFI1fpNEiQJxnRBmzzHunbQNaUnYWkg8OtLbHLTZ6X8Qyj45C8qZdAlbPk9BDLgFIeC4eUdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbn4mjJ2jxToEN5TilOhqTYts0V1eQ1gVjZhzT1+9Bw=;
 b=JoIczPacA+TcRSI2z5HQEewrms261Ysf8O9+yaZlQ0IWQBY3OWhk2iNbmPsRR+srV5Hu3rOS0EbkHH428pKh/LLE2W8xIZN26RD1JVw2lgHNc4J3sKTXuxe+iHzxv3not1gpAdg65JTgr7udoZ19pqyFgK0Rr8jWV+hevV0j7g0=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [XEN RFC PATCH 14/40] xen/arm: set NUMA nodes max number to 64 by
 default
Thread-Topic: [XEN RFC PATCH 14/40] xen/arm: set NUMA nodes max number to 64
 by default
Thread-Index: AQHXjptAJmZokCLLIECfY7e+eVRE+6uETQoAgAACFICAANcfwA==
Date: Thu, 26 Aug 2021 02:26:25 +0000
Message-ID:
 <DB9PR08MB68575188CA45381744FF3EFE9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-15-wei.chen@arm.com>
 <dfde3e1a-be4b-cf14-8a75-8910760b2c3c@xen.org>
 <3b783bbf-dd96-856e-a9ec-4ac250d3760b@suse.com>
In-Reply-To: <3b783bbf-dd96-856e-a9ec-4ac250d3760b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 96969BF52892474CA3E6D079AF14FE25.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d2b23e8e-d324-4e1b-76c5-08d96838eb90
x-ms-traffictypediagnostic: DBBPR08MB6121:|AM6PR08MB3398:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3398232F27062867344C5F629EC79@AM6PR08MB3398.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +CPopuaPl2CNW5MclV7PjZyM7VqJD/rDn7NzB4OJAAfXEVaVV3ZXmuCIX6zHhUYJrbQHlNTuPXLTUNXqgW8+8t006P6qdzOFAn5s6Z68ONsn02IlRzxBk7HGEVHkZcGh8Kg0gdMoXtwEvd/AMG2vRdVbwgNEw0u7GaqtibHJ4iUzinTuptykDmchn/0zkeGdWqO8Jio6krPP4QPbmFAvw6aWVxHgZD3M/av1+SfCHklY1rJCLBDN0yNjgEf6EL5JgqmQmLlOnsdHhuwnSkNvXXFjcddCzFpjQqJoQzwXzy+AtIT/aJsRvQ+eYUQ/jOYfdCUtEtiP/DoC8u15EAUa1LzyZXhmlCif9Ai6OBtUBqSys2Pcle8qD12LnEkl3HWTJdxL+WpUtxulaG3bCioZMczm/9o50fYuv8pJI8i1uhETA0G/mWBETV7hcTYkBdGHse4cxGfvtBGxS6G2cduqdRIXG8fKWibp+S8KZ0gDSm2/dYGkH3BINxOLhV8Z18QRO2Ymm+7Ukbho1AxXkZ4pvACJL5uHvT0rS84YsPzZ01USCMN4lVPykbd4940x68p9D5aPvqm/ulKmjldi7+SIJVKrLmYaXPmBmv9TnzVS9NsX6J+4kvzQDj3HL0OEwRD7p/030ApHBfoZilFsvjwUlb53IC5gjNkESfxrDrZ2cP+L4xQkloNpoQtUlKmxqdE+eyjdy1HC1SNzfbwjCpa9xQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(52536014)(66476007)(66556008)(53546011)(26005)(64756008)(76116006)(66946007)(66446008)(122000001)(6506007)(4326008)(7696005)(8936002)(2906002)(8676002)(71200400001)(508600001)(86362001)(33656002)(186003)(38100700002)(316002)(38070700005)(5660300002)(9686003)(110136005)(55016002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFAwbDlHWVFsS0NjYmpOMVJsQStnSGNtcU5JRTZDRFJKcVBpbmRBLzN1THdo?=
 =?utf-8?B?SlVTdGIvL2ttdEp3TElJT3NrQmt4UjkzTTU5c2RDVEpYczlhVkJmZmd2Wmt5?=
 =?utf-8?B?emZ2WUwvbXE4ajRkUlBnZks1U1dkc2pEcndXUW1nVDUyUmY1cElvOU1saWRG?=
 =?utf-8?B?ZGJ6Q1pjNTNaTDByL0ZjMDJnUW4zZ1dacUd2bGVTbWpHSnh6YmUxQTlyVVVO?=
 =?utf-8?B?ZlVTUFBlN252WHpRa1ZadWg1RDdqUjI1MHFFb21PQTY4NXdBbG10QTR2cmhz?=
 =?utf-8?B?S3BaRzVSUnN4UGcxWDJXYjRzYVdrSXY4clg0TEFraGdDQUhHRjdXV2F6b2FV?=
 =?utf-8?B?eFB6Sjk3bithTkkrRjZsdDJvSFl1SDRvN2Q2MHJBWlRodkhsQkxUYVROZVdF?=
 =?utf-8?B?NTZLTFZxZGFmdWh2aG1zWW9haUErWXliT2xSbGozcjRNUG4rTm9RQzFoazRn?=
 =?utf-8?B?RFV1Zm5kRlJsTVFIdnJzWkJVK3BpRFRLMVJnV3dlWVg1NG15dFp6UXR3NUM2?=
 =?utf-8?B?S0Y5ZHVHdWIreEpMdjR6R0NRM2lhenZ1OE1PcmcrcllmQzg2bkhMdmlVUWV1?=
 =?utf-8?B?WTRoNkNJeVhUYUtSWWxYSEFEWVk1TjJaRzVQdXJzZ2JKVkFaRFhUckpVby80?=
 =?utf-8?B?QUdVRG9xUFQ3MGZSdmR5OTlMRFIrb2NaQ3N6aGo4ajY2WTBKTmdRUTFJYzFB?=
 =?utf-8?B?dU56TlAyVlBIMTRSeWs5T1VsV2V4M2NXWHhKVzI5V2ZYNXQ4b21IcElmSGNk?=
 =?utf-8?B?N2RGdTd4OGVRTTRuRzUxbzM1NFphSDJML1BCZ0E4QzN4eW85V1pIRzhGQkNW?=
 =?utf-8?B?OEthRVYzb3JSb0M3YWZHRmYyb2R5V3dGTXozTVU0dUMrNCtQV25iQjRoMVZ3?=
 =?utf-8?B?MStPTlV6OFkzZGtPZDlOcjRvRVh6ZVhyYUNEd1Q5ck9wa1JHTk5tWmpHeXV2?=
 =?utf-8?B?TUxvd24xb2s5dUxyZ3NxcW9RZTZ5RStQTFEvWGZiNzBWYUZ6dCtzUUE4NXdT?=
 =?utf-8?B?MEVQRVNEMS9uQnZKR1hnbkRHa2R4UzM1K1ZuRWgrYU01TWlqakhJcGZSbFRV?=
 =?utf-8?B?aExOTE90WXJHSW4wT1NkZlZxbVJHUzZraVRmWmk0T0NaYXdWS3JxWHJDTjVY?=
 =?utf-8?B?Rnk1ODE3UjY2MXZhMytncUp3ZzluVjBXQitQbGxGYXVIVnRnNU9PRWxQUE41?=
 =?utf-8?B?d25YaGZDTkhGR2JaQ1NpUXVVdmw0VlpmZm1wTnFNWWU1bnovdzd0K3VWVmxl?=
 =?utf-8?B?TWtNa0FSRTk1dmRMZ2svT1FGditKVHFBRTRGQjYrTkszb3VHVzBtMVV5MGV2?=
 =?utf-8?B?SlBrM2NPTnZMSDNEWnowUWMzVFY4WEJKS0pFQXliSUhSNW0wQ1FZaWZ2Wmsw?=
 =?utf-8?B?djVFMEZ1cXJxUkJtU3R5endLS05lZGFjVVhoVDYraTdKNnNQWCsrSG4xZHNI?=
 =?utf-8?B?OW1QOHNwMDhSWnNFbVNtS0oxbzhVVEkvMUhJdnUwYjFQZVNGeVZwQThhNE9M?=
 =?utf-8?B?eHc2cWZYNWo5RXhlVW9maW5qb2hpN1dlWXM3SXM1Z2R2aWhMQ2hLMlBCeERZ?=
 =?utf-8?B?NDdhU01XN0pRaVo4OE15Mjhnb0c2RzJFczQrTGRxTEhlZzBWNExyZXFuTmZr?=
 =?utf-8?B?WmY3WEpnUHd3MGo1NTlIdStoR3B2RkFMYmtSR2JPUUIyNkFON2RlM2FZWjNC?=
 =?utf-8?B?Q0tXYUIzYkJ1REVRaFcyS3lsazdxVGZFeS9IajJUbk05MU1yaTg2UWx4b1R1?=
 =?utf-8?Q?Cg74fii/SeyLF4n5FxqdpRiCxZv5UP1jot6HE0A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6121
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b74f2b1e-fb4f-4d76-0ba7-08d96838e75c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+1YJZkBtxIqzaEaqKDToXRk6npois9vOaK5akpb7fAS0HaXCgTiQmML4WDWBf2+SeJcgdYdAVEOOswa2eqPXzJiSEdUcWQPB/K27+yjFpC1Fce+DRi6pRe3Xk/cfPwyTa8n3LT7tI+Rp/L6Ci9nkLtn/dq4tTs7LfOvxPoKWtddW33HCFE/TiiB1WiArBD1f4bGD1Ge0Qfml0Vzym58SDe7Jl2hOZAHXQ+67kPYavESEV55mz64Wbdk2BERLd4/fsdzXqg7RZl20ogyliQTKhIzlN5AcVpiL9QN+OHrbCLlC4CatvQvO8OhVsZX2QBB0lKnJeCKDtipOGkz8ClD1qf2uioo2bDYVtN9XQlPyiqaBv/te2Fa69NpNDl6C0edjfRGuFy9evMnp+HTX9KUNXPRipYUjGeewqm2Db4rqJGBCSxmffLUMh7PwoKaQUkFPP/vzSKm+1519iOdVpI2UxW3VX1Kjb8VJ/qQT4beDkgp9C31dHwCQRqc6njaI3KMSAsqJNlv1yelT2iKpk63of06Ib1Bc8PySn3xV52eYX4YJlkr3Sxng8dl4oNtxXgzbWwd9hF5loUnWaAE5T2wp4aOgKA6Dal2HM9YetMqtR4crihmwqwYXMTQ+6md+ch+ZTLNPvravPIXSrE3q0NM3m/dqjTrzKRuZjpAM64jF8NfC9Ezwz4nDYPjMcsN6qZWTPMpzBBjlrPaSa/B+f3J3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(8936002)(2906002)(107886003)(336012)(36860700001)(316002)(82310400003)(356005)(8676002)(83380400001)(6506007)(33656002)(86362001)(55016002)(4326008)(82740400003)(53546011)(110136005)(52536014)(5660300002)(54906003)(7696005)(478600001)(81166007)(70206006)(26005)(9686003)(47076005)(186003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 02:26:32.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b23e8e-d324-4e1b-76c5-08d96838eb90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3398

SGkgSmFuLCBKdWxpZW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyMDIx5bm0OOaciDI15pel
IDIxOjM2DQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAxNC80MF0geGVuL2Fy
bTogc2V0IE5VTUEgbm9kZXMgbWF4IG51bWJlciB0bw0KPiA2NCBieSBkZWZhdWx0DQo+IA0KPiBP
biAyNS4wOC4yMDIxIDE1OjI4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gT24gMTEvMDgvMjAy
MSAxMToyMywgV2VpIENoZW4gd3JvdGU6DQo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
bnVtYS5oDQo+ID4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4+IEBAIC01
LDcgKzUsMTUgQEANCj4gPj4NCj4gPj4gICB0eXBlZGVmIHU4IG5vZGVpZF90Ow0KPiA+Pg0KPiA+
PiAtI2lmICFkZWZpbmVkKENPTkZJR19OVU1BKQ0KPiA+PiArI2lmIGRlZmluZWQoQ09ORklHX05V
TUEpDQo+ID4+ICsNCj4gPj4gKy8qDQo+ID4+ICsgKiBTYW1lIGFzIHg4Niwgd2Ugc2V0IHRoZSBt
YXggbnVtYmVyIG9mIE5VTUEgbm9kZXMgdG8gNjQgYW5kDQo+ID4+ICsgKiBzZXQgdGhlIG51bWJl
ciBvZiBOVU1BIG1lbW9yeSBibG9jayBudW1iZXIgdG8gMTI4Lg0KPiA+PiArICovDQo+ID4NCj4g
PiBTdWNoIGNvbW1lbnQgY2FuIHJvdCBlYXNpbHkgaWYgeDg2IGRlY2lkZXMgdG8gYnVtcCB0aGVy
ZSB2YWx1ZXMuIEJ1dA0KPiA+IGdpdmVuIHRoZSB2YWx1ZSBpcyB0aGUgc2FtZSwgSSB0aGluayBp
dCB3b3VsZCBtYWtlIHNlbnNlIHRvIG1vdmUgdGhlDQo+ID4gZGVmaW5lIHRvIHhlbi9udW1hLmgu
DQo+IA0KPiBUbyBiZSBob25lc3QgLSBpZiB0aGlzIGdldHMgbW92ZWQsIHBsZWFzZSBhdCBsZWFz
dCBjb25zaWRlciBtYWtpbmcgaXQNCj4gYSBwcm9wZXIgS2NvbmZpZyBzZXR0aW5nLiBKdXN0IGFz
IG11Y2ggYSB0aGUgbnVtYmVyIG9mIENQVXMgY2FuIGJlDQo+IGNvbmZpZ3VyZWQsIHRoZSBudW1i
ZXIgb2Ygbm9kZXMgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGNob29zZSBieSB0aGUNCj4gYnVpbGQg
bWFuYWdlci4gT2YgY291cnNlIC0gaWYgaXQncyBub3QgdG9vIG11Y2ggdHJvdWJsZSAuLi4NCj4g
DQoNCk9rDQoNCj4gSmFuDQoNCg==

