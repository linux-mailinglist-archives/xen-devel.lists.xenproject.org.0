Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD836223A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 16:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111800.213804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPSy-00072i-W8; Fri, 16 Apr 2021 14:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111800.213804; Fri, 16 Apr 2021 14:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPSy-00072N-SX; Fri, 16 Apr 2021 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 111800;
 Fri, 16 Apr 2021 14:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tm2+=JN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lXPSw-00072I-Vh
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 14:29:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8230bf5c-fa80-4e45-b5cf-028424f81772;
 Fri, 16 Apr 2021 14:29:01 +0000 (UTC)
Received: from AM6PR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::29) by AM8PR08MB6468.eurprd08.prod.outlook.com
 (2603:10a6:20b:360::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 14:28:59 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::be) by AM6PR01CA0052.outlook.office365.com
 (2603:10a6:20b:e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 14:28:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 14:28:58 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Fri, 16 Apr 2021 14:28:58 +0000
Received: from addbca057cb3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DFB7C95-D522-4CEF-8702-BADA653DEB8F.1; 
 Fri, 16 Apr 2021 14:28:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id addbca057cb3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Apr 2021 14:28:51 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5421.eurprd08.prod.outlook.com (2603:10a6:803:132::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 14:28:50 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 14:28:49 +0000
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
X-Inumbo-ID: 8230bf5c-fa80-4e45-b5cf-028424f81772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLoCrhU05SB41bqOWVg+Hxm8NldNj2WvUXUJiMRpR+4=;
 b=Nw6VV4e0CJ/HL8sJ6UORhtE0RxYtYozraUkJT5Rxka+dmih9v9CKXlBAcKomaRizmSD5wudhTVqRk0uhyOdlCsdcYU+NJFn1D3pltmnu8jl6jZ68HNWDZkELwaaGcQyeZ2qSnWKWR/svl3cFnIvvNzYuMntuWNRDWnXK1ghAlf4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a0ea13b4fdba13e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noKrk6kzsHxfzer6buoUC/gATjQCWqfdrww5JgOgS7K63tQQEtsMmtYpDJviZ3NRPZV0zTt+U+62Kgh4bzvNaDVjlDEucaug8qZC/oaXfGuAO2Z80HKR6KEkhAiDqA7pB8oysmNWjZBKWAJFD1Wxc171FMKY/ZxBn+XT9O66tH4VFOFMf4/eQgheCKZ0QcbF2u9DM8bkGBR6X7GgVQyc22b5IEKFH7PBUgOcGysA6DAomxxsdChtBKP9R7LFOGzJAmD9UKnz9Jvl4TEY+NdOHYnHUC/QOwZbv7I+yXWEtTRpdO7luMZE9ZLuJmxqMZ3BZk+dDq+Co0Pgtw5E3vBpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLoCrhU05SB41bqOWVg+Hxm8NldNj2WvUXUJiMRpR+4=;
 b=SxyWiKb2240cV7TgZ1G+8KbR7CCcCzzOYFENen5o9MUoM7giKQJrjdJSqChB2l6m8ine5A7RKoYbYhTzuM+22/MgaJjzPuwlV9si37N9+QxwIYO5BdNUj0TS7QAzRBEdzc0umfhfWnjjNg5T2Ds1d2Mx2iefQNEDWKwJ4J9zshqGSzpFYY7TbthL5utGNA0ocXNYi+nCv/MJsLE1E1SzbB+ouDXFgz6fYehGRDg8NqDRApYkiqMWvxk/1zT0rmIdGMS7GInh6iDWoEO2cfdDkGG3CF2jBO/NJaGAi4U/pb4kBAcJuXMoaHNsxjB1pzka8K6BjXNN9oIiS8NPYr+gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLoCrhU05SB41bqOWVg+Hxm8NldNj2WvUXUJiMRpR+4=;
 b=Nw6VV4e0CJ/HL8sJ6UORhtE0RxYtYozraUkJT5Rxka+dmih9v9CKXlBAcKomaRizmSD5wudhTVqRk0uhyOdlCsdcYU+NJFn1D3pltmnu8jl6jZ68HNWDZkELwaaGcQyeZ2qSnWKWR/svl3cFnIvvNzYuMntuWNRDWnXK1ghAlf4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index: AQHXMrMxWiLHM7/9fEaAK+771/NYWqq3NDuA
Date: Fri, 16 Apr 2021 14:28:49 +0000
Message-ID: <E46F097B-B4DC-4FBB-8068-FC9F178F8BF7@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
In-Reply-To:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea36aeb-e1bf-4a76-ab10-08d900e3f926
x-ms-traffictypediagnostic: VI1PR08MB5421:|AM8PR08MB6468:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6468F9562DD8236C1A7082AE9D4C9@AM8PR08MB6468.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:366;OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wzvNybsJ/0Y36wpyfjMhjK/Qas/pMkSvgosGnI7fUvSXlZS19owLAv3z63K1msmzk9i611zuiS7hf336EI67x5rjHvJBhvxfPHK8oNxmVV+U7BlkwqiiadS4c1ai4DMDjlwVwn97QGBl0ECcl2KBjC/+nDgu86t14ucG1DQXnGcyZ/W+NLP6qPX8bUsjgUsfyzGY3s8lVUJuts85bwpjQEB3jOo/83FVUErRX8B01o1vIrjJksVlZ5W5hnKHR5A4+pFDL7L7Tw9x+zxrSZ+GmZQpOgP6DWbtq8FTlkcM/I8JADDcKmZ/pmGtek/O5JzpYLxkMq6px8wgOp6TUGOJjZshS92LC/Z4nu3yf3DT0HDD9QZ7+aaGXDpg2l6fZR2eT44v0uVaz8HJoAILXINLGXgkYhx7tErbUBG0lETejs6avTVDd0aqeUC9HLwWS1TYUP3aeJRU+Gu5+5BXjJx4YlZcowj5SOAf/2IWisNAsaa0OEU5YnoWSzz6J906EhB39RJeTjtjO8tJQg6aHmaZH1AsJ1cYQ5jEU53sCUPco7EMBgEIwG4l1bAy5nNDqbO9Fd9aQkFcH5+uEtQ3VOwV2onKqh1RZQ6Nqx1PpWYwyjLCR1u/VZ/NvfIbr+zYPVXxjOpX665s7tq1sehu4wA8yMymHdrM5XDDgJVz9ncBd+4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(478600001)(6636002)(6506007)(53546011)(38100700002)(37006003)(6862004)(2906002)(4326008)(71200400001)(316002)(122000001)(83380400001)(64756008)(54906003)(8676002)(8936002)(86362001)(91956017)(5660300002)(6512007)(186003)(26005)(2616005)(66446008)(66556008)(66946007)(66476007)(36756003)(6486002)(33656002)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?N1MyOU5zTlBKb2VYOVplbWlGY1ExZUs3Ym9nL2NGRFZudjlYeW9XalQ5b2Na?=
 =?utf-8?B?cDI2S01vUllGSWN2M21aek9LL1VwRG1GRGdTMkJyejhVeTBMeFFOUE0zY2Nn?=
 =?utf-8?B?Um1vOXM4YzVJcTczQVJWRExxT3UvOEwwcldBbFpBNFM5Q1lUR1dBMkoyamx5?=
 =?utf-8?B?ZzRHOS83b2sybnYzV1VFZHNDbmZkOFdnVDZJMG9xYnNldTJ3SGcxWjRnYVQ5?=
 =?utf-8?B?UklUOUVjMDRFVXdLdVo3Q0t0bHNINExiZUJ4NzZiRUphZ2lqOGFDbGdZd0E3?=
 =?utf-8?B?ZDVCM3FkS1FtbGQ3a2dEck9vNlZUMVllWFV4MUIxbnl4OHpod3JjcUtvbWRY?=
 =?utf-8?B?WTVOWERqcnhDcVluamdDN29mNXYzakFRcWNnZVRuT3NYT2FWOGdSUlpMWFYx?=
 =?utf-8?B?Nk1WMUhLU1pIcGtVNWNtRjBZN2h1WnFqeEM3bzV6RUppNEpjNFhkNEZVWE9l?=
 =?utf-8?B?WEVGT1pjQjdmL0MwNUFId0F2c3V0Z2xyaG9iaHhaOTkzYllNRk85MW5zTTFY?=
 =?utf-8?B?UmdwQW9ZL2c1NFZ1T0k2NzNML0pzZnBza3lzMnV6TXBIUjVnTzYrSC9xMVRt?=
 =?utf-8?B?TG9yelFSZGU1ZnVwdFlQZHp1RVRaNk85c1IxbUY4alFWbWdUR3NFWi9ORkNG?=
 =?utf-8?B?b3I1ZnJVVWVwa1VPSUpBcXhSMHlXdTM2aFRLRnFkbjhlOWllVFhVU0NwTWJK?=
 =?utf-8?B?V0ZTQ0FHaWFSWm4veWE5QTFKTDU0cjFDelhWOWpuYUlhM3hSYzFWS0lLZVIr?=
 =?utf-8?B?TWRsd0tBSWdId2VTdUF1UHNGTFlLSG5SYlpXMEl5RW1aYm9xYTdsaEdUbUZi?=
 =?utf-8?B?SFdJcXZxcFVIcUpWRmR0eHZJai9aS0VHTHZJd1RtRlF3c2pnRzV1L2FrbnVV?=
 =?utf-8?B?S2FCbEpYQ2MzNzIydTBja2EvVHhXOTNoQlVEQzFaUEhzWEMwZThGcExwSG5D?=
 =?utf-8?B?UDNVSktUNm1zTVQ3UkpLVlg5V3hwNzdxUHdLME1LZytoODVFN1dKaFRPdVAw?=
 =?utf-8?B?aVpuWlB3ck9ncDdEdTcvY2xxZTRPeDFuS0ZUWkJLMEMzR001R3hyb0Q5KzAv?=
 =?utf-8?B?Vm9SdUZ1LzFkczF0eVRrb3lxaUUzSmlLNTFuL09XZktVYW4zMm5qM3F5em54?=
 =?utf-8?B?allaZDZ2WURpZHJaZmpRaktzRkxxSzUxcDlaVzBuMXhCeWdpcWRMRnNYRk1h?=
 =?utf-8?B?UEt5bXZxMWcwQWloN2VDbzhSSGFRL3dTdDRTaWI0aWVNazkvSk1Qdld2RlJk?=
 =?utf-8?B?aFRTM2h3M3M5cmo3SUF6UUZpWkpHUmpQbHFGQU80RHROditzU2hCOXNhVU1W?=
 =?utf-8?B?UHpJdnFjYnArWVc3Vm5lQzlJZktERWg2OWtHbFluU0Jmb0QvZkRETVpBOEYy?=
 =?utf-8?B?L1BUOTV0Z3cvZnpNWTVWTUY0SS9RdnRaVWVZZTZVaEtsSVVIRzJVVVNyM28w?=
 =?utf-8?B?NkZxb3ZoV1RpNFI1TG5UZW9mT3NSVU9GUEdPQmtha2Jzc0tFN1JGZVpFQ2NU?=
 =?utf-8?B?cStLaTlVajdlSngwd3JoVXdmWDJSL3NvdWNLQ054M3pKbVJWYzdyaXd0dWd0?=
 =?utf-8?B?Um1VN1ZwSWJGVHkxOEpOL20xRzAwR2I2amU2RCtrbmowODFsR09VSks4UWsz?=
 =?utf-8?B?ZUdWSEZRMW0xZDExdXpVaTZ3a2t6U1lvUm9EZjB3Wm5YYVdvWVZNUUZWdHl5?=
 =?utf-8?B?TEFiVThrMk92dlVyYXFYa0VsRm9jTnFvTlNCeUhTRVA5VGtScTJxUERRUHJn?=
 =?utf-8?B?Z0JKamFKaWJjWmJRS2Z4VGtmK3RDdGpBMUlNYUUyVkVvckp1dnVaV0kraDRy?=
 =?utf-8?B?dnV0eStIN1p2TDhVMkl3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B01751C7F647845B372E65C6738CA68@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5421
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c22001cd-c05e-418b-7083-08d900e3f3e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EAbi4KUxBUgGSS+CxN4qG3oS3KExzQS7Vq9paQf8Wf0TizBwqmaz6H+kqJM3/A83jql5v3Dt9VAtqAzYrShvhOUjhQ1NDhCwCWxwtmFA/qENfGh4YONrSqLg5OMwfYF2NHCwqo9mKltlFPvDe/yrisM7k5pz/rmmY8JNEN77YFjUubk38h3h6N+p2w2RRrh9C39/O/K8HAQ/gRAwX7I5jaPBU5HTnWrXVdWiwAjeuFenAEbTWEqjJtJd/cHvzCzossL7ssgOh+5ESVIut2Vd/aqLKOuaFWq4r7nIZPYd65Bs0+JU2bczAbtkzb4a27OdOi08bv9g87GuztjdsLHfsAMb13hpvII2NkvYslYNvOPSIfcmEfYOZDMo6QWPVQVbsAxNNEFNtdHD/Y0vhjpmVOSXCeQqHfpBBR7+VTbiFlQF1zikBT3xBMDXWYxtWEC3f7jO6KkALHcyQdc/+5KAfD99UDIpSj4nTkpKKHS+xLaWd7cZUSdsiLSb87pvs2SffCmjSs9cdXXEcjPP0XQe49kHdQXGCM/IfI9/a5b58J/GTxHFyUQqb0fjYUBxqRxboLk8M0HwlATjo6pW5WUDH3j3T0m1bYGqR91gpnVNgitpmfCN+Ii2tLLZW86heB3YQ2C74gADDMYwH6j2Z0yd8lppXfyMmCo5Z1tMH5o48jc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(36840700001)(46966006)(186003)(70206006)(478600001)(26005)(70586007)(86362001)(5660300002)(33656002)(6486002)(47076005)(2616005)(82310400003)(336012)(6862004)(81166007)(54906003)(2906002)(83380400001)(4326008)(356005)(36756003)(82740400003)(6512007)(53546011)(36860700001)(8676002)(6506007)(8936002)(316002)(6636002)(107886003)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:28:58.6743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea36aeb-e1bf-4a76-ab10-08d900e3f926
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6468

SGkgUmFodWwsDQoNCj4gT24gMTYgQXByIDIwMjEsIGF0IDEyOjI1LCBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBSZXZlcnQgdGhlIGNvZGUgdGhhdCBhc3Nv
Y2lhdGVzIHRoZSBncm91cCBwb2ludGVyIHdpdGggdGhlIFMyQ1IgYXMgdGhpcw0KPiBjb2RlIGNh
dXNpbmcgYW4gaXNzdWUgd2hlbiB0aGUgU01NVSBkZXZpY2UgaGFzIG1vcmUgdGhhbiBvbmUgbWFz
dGVyDQo+IGRldmljZS4NCj4gDQo+IFRoaXMgY29kZSBpcyBtZXJnZWQgd2l0aCB0aGUgY29tbWl0
ICAieGVuL2FybTogc21tdXYxOiBJbnRlbGxpZ2VudA0KPiBTTVIgYWxsb2NhdGlvbuKAnS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KUmV2
aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0K
Q2hlZXJzLA0KQmVydHJhbmQNCg0KPiAtLS0NCj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3NtbXUuYyB8IDQ0ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3NtbXUuYw0KPiBpbmRleCAyNGFjNGYzYTgwLi4xYTY4YzJhYjNiIDEwMDY0NA0K
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCj4gQEAgLTU5Nyw3ICs1OTcsNiBAQCBlbnVt
IGFybV9zbW11X2FyY2hfdmVyc2lvbiB7DQo+IH07DQo+IA0KPiBzdHJ1Y3QgYXJtX3NtbXVfczJj
ciB7DQo+IC0Jc3RydWN0IGlvbW11X2dyb3VwCQkqZ3JvdXA7DQo+IAlpbnQJCQkJY291bnQ7DQo+
IAllbnVtIGFybV9zbW11X3MyY3JfdHlwZQkJdHlwZTsNCj4gCWVudW0gYXJtX3NtbXVfczJjcl9w
cml2Y2ZnCXByaXZjZmc7DQo+IEBAIC0xNDk4LDcgKzE0OTcsNiBAQCBzdGF0aWMgaW50IGFybV9z
bW11X21hc3Rlcl9hbGxvY19zbWVzKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gCXN0cnVjdCBhcm1f
c21tdV9tYXN0ZXJfY2ZnICpjZmcgPSBmaW5kX3NtbXVfbWFzdGVyX2NmZyhkZXYpOw0KPiAJc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IGNmZy0+c21tdTsNCj4gCXN0cnVjdCBhcm1fc21t
dV9zbXIgKnNtcnMgPSBzbW11LT5zbXJzOw0KPiAtCXN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXA7
DQo+IAlpbnQgaSwgaWR4LCByZXQ7DQo+IA0KPiAJc3Bpbl9sb2NrKCZzbW11LT5zdHJlYW1fbWFw
X2xvY2spOw0KPiBAQCAtMTUyMywxOSArMTUyMSw5IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfbWFz
dGVyX2FsbG9jX3NtZXMoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAJCWNmZy0+c21lbmR4W2ldID0g
KHMxNilpZHg7DQo+IAl9DQo+IA0KPiAtCWdyb3VwID0gaW9tbXVfZ3JvdXBfZ2V0KGRldik7DQo+
IC0JaWYgKCFncm91cCkNCj4gLQkJZ3JvdXAgPSBFUlJfUFRSKC1FTk9NRU0pOw0KPiAtCWlmIChJ
U19FUlIoZ3JvdXApKSB7DQo+IC0JCXJldCA9IFBUUl9FUlIoZ3JvdXApOw0KPiAtCQlnb3RvIG91
dF9lcnI7DQo+IC0JfQ0KPiAtCWlvbW11X2dyb3VwX3B1dChncm91cCk7DQo+IC0NCj4gCS8qIEl0
IHdvcmtlZCEgTm93LCBwb2tlIHRoZSBhY3R1YWwgaGFyZHdhcmUgKi8NCj4gCWZvcl9lYWNoX2Nm
Z19zbWUoY2ZnLCBpLCBpZHgpIHsNCj4gCQlhcm1fc21tdV93cml0ZV9zbWUoc21tdSwgaWR4KTsN
Cj4gLQkJc21tdS0+czJjcnNbaWR4XS5ncm91cCA9IGdyb3VwOw0KPiAJfQ0KPiANCj4gCXNwaW5f
dW5sb2NrKCZzbW11LT5zdHJlYW1fbWFwX2xvY2spOw0KPiBAQCAtMTk2NiwyNyArMTk1NCw2IEBA
IHN0YXRpYyB2b2lkIF9fYXJtX3NtbXVfcmVsZWFzZV9wY2lfaW9tbXVkYXRhKHZvaWQgKmRhdGEp
DQo+IAlrZnJlZShkYXRhKTsNCj4gfQ0KPiANCj4gLXN0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAg
KmFybV9zbW11X2RldmljZV9ncm91cChzdHJ1Y3QNCj4gLQkJCQkJCWFybV9zbW11X21hc3Rlcl9j
ZmcgKmNmZykNCj4gLXsNCj4gLQlzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gY2ZnLT5z
bW11Ow0KPiAtCXN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXAgPSBOVUxMOw0KPiAtCWludCBpLCBp
ZHg7DQo+IC0NCj4gLQlmb3JfZWFjaF9jZmdfc21lKGNmZywgaSwgaWR4KSB7DQo+IC0JCWlmIChn
cm91cCAmJiBzbW11LT5zMmNyc1tpZHhdLmdyb3VwICYmDQo+IC0JCSAgICBncm91cCAhPSBzbW11
LT5zMmNyc1tpZHhdLmdyb3VwKQ0KPiAtCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+IC0N
Cj4gLQkJZ3JvdXAgPSBzbW11LT5zMmNyc1tpZHhdLmdyb3VwOw0KPiAtCX0NCj4gLQ0KPiAtCWlm
IChncm91cCkNCj4gLQkJcmV0dXJuIGdyb3VwOw0KPiAtDQo+IC0JcmV0dXJuIE5VTEw7DQo+IC19
DQo+IC0NCj4gc3RhdGljIGludCBhcm1fc21tdV9hZGRfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gew0KPiAJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdTsNCj4gQEAgLTIwMjcsMTMg
KzE5OTQsMTAgQEAgc3RhdGljIGludCBhcm1fc21tdV9hZGRfZGV2aWNlKHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4gCQljZmctPnNtbXUgPSBzbW11Ow0KPiAJfQ0KPiANCj4gLQlncm91cCA9IGFybV9z
bW11X2RldmljZV9ncm91cChjZmcpOw0KPiAtCWlmICghZ3JvdXApIHsNCj4gLQkJZ3JvdXAgPSBp
b21tdV9ncm91cF9hbGxvYygpOw0KPiAtCQlpZiAoSVNfRVJSKGdyb3VwKSkgew0KPiAtCQkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUgSU9NTVUgZ3JvdXBcbiIpOw0KPiAtCQkJcmV0
dXJuIFBUUl9FUlIoZ3JvdXApOw0KPiAtCQl9DQo+ICsJZ3JvdXAgPSBpb21tdV9ncm91cF9hbGxv
YygpOw0KPiArCWlmIChJU19FUlIoZ3JvdXApKSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVk
IHRvIGFsbG9jYXRlIElPTU1VIGdyb3VwXG4iKTsNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZ3JvdXAp
Ow0KPiAJfQ0KPiANCj4gCWlvbW11X2dyb3VwX3NldF9pb21tdWRhdGEoZ3JvdXAsIGNmZywgcmVs
ZWFzZWZuKTsNCj4gLS0gDQo+IDIuMTcuMQ0KPiANCg0K

