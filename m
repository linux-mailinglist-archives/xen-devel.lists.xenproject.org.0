Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C425A3F5701
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 06:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170635.311467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mINkt-0001Tn-L9; Tue, 24 Aug 2021 04:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170635.311467; Tue, 24 Aug 2021 04:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mINkt-0001Rw-I2; Tue, 24 Aug 2021 04:09:43 +0000
Received: by outflank-mailman (input) for mailman id 170635;
 Tue, 24 Aug 2021 04:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uHFs=NP=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mINks-0001Rp-0Q
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 04:09:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a555897-0491-11ec-a8a3-12813bfff9fa;
 Tue, 24 Aug 2021 04:09:40 +0000 (UTC)
Received: from AS8PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:312::15)
 by DB9PR08MB7132.eurprd08.prod.outlook.com (2603:10a6:10:2ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 04:09:30 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::f6) by AS8PR04CA0040.outlook.office365.com
 (2603:10a6:20b:312::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 04:09:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 04:09:30 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 24 Aug 2021 04:09:29 +0000
Received: from 6b88e920b3b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0771B27F-35A1-4EB0-AA75-1F91774CC797.1; 
 Tue, 24 Aug 2021 04:09:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b88e920b3b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 04:09:23 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1880.eurprd08.prod.outlook.com (2603:10a6:4:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 04:09:21 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 04:09:20 +0000
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
X-Inumbo-ID: 1a555897-0491-11ec-a8a3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdKfiIynHaGGXuF93I1P98Gdn/vNHevgPoSJOQ6VeJQ=;
 b=uq4ix+3/7iw6MMMvyMn7b0fBY4bsYeTaGdBbXQQLZ6pAKYA63So+1Hg4lXSQIqoFF7DThc32pTRaAACdx4ra3iJQRlvJ3+0Q7rFKlbSlbnhB3WR8Dw+GnKqi2epXd6WDFzdTzA8vzgFdXfSV0PiY1qD8E92f2dEytYefBpW8alQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBDgKAOkZBx9T6MfR+cpyxXLecRtWy0Mrm7I4NeFQ7/KnHlHQVdg+E/h6JVXC0P0fLsIlY/7N90oXCCYgo/bgh59AzQlPTW4YIW04AbxUOZmk5DotmwIpddpcs90kMdvJctGO/jEmRltXD5eUbA8OMbwKEhUbN5KKILjxXhpfUInvUUlOCDUQjzZXWoNOqhGfz6W6Ohh6XAHsnOWGqhDS/CojjjpKvFNZIS0qedfaoY2AKPr9qbfiUeUUCcnuyp+D9csQj6RGXTfB7cdfPZhs0Kr4zBuxT3RN2jcUBEe6D30hXfaa7x3eY++t4lbeB9+hcYmpuu2DtOUJ9RMIiu9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdKfiIynHaGGXuF93I1P98Gdn/vNHevgPoSJOQ6VeJQ=;
 b=BiJaiPuTAIS/yuPV/Ycr57gyEUkKH0DYbDLkWYFJttJ1WRW84ibMG/LxHglphWuRqPMUYYpatvG9KHynE40IQkIgmKzu4iToP4bU/vGUCYI+6YqrM/P8+vweHXG/5tol6pbHG2gZGzApve3Un1ZvHO4I1BGxhaXb4tYdFNnBl9sYGkZg7/1SHShczd27dreBZ7cX/SltLrqqpkFm2iNGK9H/DPorXoC2T3MASTI7jphZ9TsDvaCz8CN3ntO5/4gnORIUC0bxtHH+GAJGvAgP9dh/EnIN9WVw7mxJas/B39HFsRLb7lwYLmigbL7BKp7xEe9kXJiVrY56ubboDPETsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdKfiIynHaGGXuF93I1P98Gdn/vNHevgPoSJOQ6VeJQ=;
 b=uq4ix+3/7iw6MMMvyMn7b0fBY4bsYeTaGdBbXQQLZ6pAKYA63So+1Hg4lXSQIqoFF7DThc32pTRaAACdx4ra3iJQRlvJ3+0Q7rFKlbSlbnhB3WR8Dw+GnKqi2epXd6WDFzdTzA8vzgFdXfSV0PiY1qD8E92f2dEytYefBpW8alQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjat7LeMAgAWqo3CAACYEAIABH2PQ
Date: Tue, 24 Aug 2021 04:09:20 +0000
Message-ID:
 <DB9PR08MB6857668227DE26ED4A9FF8799EC59@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <167bbcea-e797-c924-81d9-20e626e320cb@xen.org>
 <DB9PR08MB6857D1E22305A7878103EBC99EC49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <3b5d47cf-95c1-cb56-9246-57a94a6f9b1e@xen.org>
In-Reply-To: <3b5d47cf-95c1-cb56-9246-57a94a6f9b1e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DC8C0C488265C043A50B93B25DDCC260.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4d9bedd-968f-4833-a0f0-08d966b4f8ca
x-ms-traffictypediagnostic: DB6PR0801MB1880:|DB9PR08MB7132:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7132EE5819212BCE537E32DC9EC59@DB9PR08MB7132.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 skx4B+GwdHhAgvrPpQHC8MrsICbIIjLfPtLbJXXy/wURQzSnUE+ZrZ9hWqfSWSV58RhoUdvCaeZ/i+aZRtxJjW5L/I3yt5cMz/YUzuja87xwAeVl3kjnddYZbaHSEjxV4t6u10UtZxciW8dHEPHAHQtvZ7zLUjK2jC7QexoCX8x4F6qElzvsZ3tmJaLiAZYtQHQja4dRQE/JVXtqdZAr38Ts1PH+jnosxeP4e1GzvYDHQ1/UZ7cfiFXSff+0cb6ZZTLVWroItd2kgdoWdD9g0qxNXkN6Vfot/fOvnuBFjW+h6hWhfjwsYRm+DVLLheGWD/LfEOvZq6DG0WKDs6qQYoGIbwBvRPo/oDM6evpf37z5SRuPOfDSZDt7fktxHizn1xFTEXL6ZKXt0V9G9Tk5SJWJnLHr9UgoVR4UtLR4nHIaF749lwLGdVUJb+U60D80PGK4MTeYV2uAGTxQBT9Eu5KBLU1DH7nKOBQCtTkIXXHYHdt5HV9EBN1wJ3iX7A/JYFs/lshtyJsejDPwrHh7ZAJWYnEaWQUHf56Jhs34pNatVKH4N/MZ8pTksDzfm1Yi5yI53NPKPmtKTQ5mgCy52Qs43omtXBGVn/w+Qu49V/wGtL4Pxg+cMswlkn025zgYkxDGUbDqvW5iWRhD2Pn8rwmJHa5hsd3MqrQyCOPzfKIGW7scEGU1jgZ5HI66Vgu2YROZpm/CSl4IKTeI99yyrg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(4326008)(83380400001)(64756008)(66556008)(66446008)(76116006)(66476007)(55016002)(8676002)(38100700002)(122000001)(38070700005)(33656002)(86362001)(2906002)(6506007)(53546011)(26005)(186003)(71200400001)(7696005)(110136005)(478600001)(5660300002)(66946007)(316002)(9686003)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bE9mQ01Jc0o2Y0JqL2JCY0tmK29KaDh6a0JVbWdYY3FzMUNCVDNEc3U3L3dv?=
 =?utf-8?B?SERqZnN3S2V4U2xRdzd4cUJ3Q1hLMDRUQWQ4UTRrbnNiYVN1ai9pR0pjWHZn?=
 =?utf-8?B?UFNWdEZsMDgrRGRjWkdtWUFWSWdyYkdOUTh2VkFZcVR6VnA1ZXZqajhPOWJE?=
 =?utf-8?B?Y2xNUkdWaEl2akF6TUc2b3g5ZUZyVFJrVjVROFNrM1V5MVVyNHgvRkF0MGJm?=
 =?utf-8?B?bW81dG5NOFJTWGxRSVIrR1RKL2RnMFN0Y1hhVWorWS9zUDd2YWNMZ1YvT3F2?=
 =?utf-8?B?TE5NNFdYNVF1Yi90VmNjNzFEQVFjazV5dEJtTERtVFpxSmtsTWQ5STlwc0dM?=
 =?utf-8?B?RG1YOXQwTXpaOU80cmpTTTZ2ZkV3WVVlWnU0WVdKdGhoQ2U5RThxVk8wV1p4?=
 =?utf-8?B?b0ZoS0Y5bXk0Y2Rya05kRHQxUERURWpqdmxRRU5tOUphbm1tR3J5MzY5YUg3?=
 =?utf-8?B?Y1hrcW9qQndGY0RGTTlhc1BuelNUaGp2bXVJL05xM2pwS1Q2aWVYU0t6bWJy?=
 =?utf-8?B?bjVQd1JqOHMzRWdacXUzbzh0ZCtnMzdJWDc1bm9La3NRT0Npek4wOFg2SE5Y?=
 =?utf-8?B?SzZFbVYxYUFGWU12UUJsQlA5aUxhUjRWQzhGNEhhLzhYZng1R3BUOXlSamxS?=
 =?utf-8?B?VHQ3bGV4QUxLL0VnOFpldVZIcHhnaFJhUnJUZnA2dHlySVJRdGxIVExLbDdR?=
 =?utf-8?B?MzZTejlpVW1va2JvUkU0ZWhlR2FTY1RqM3NuMExYdjY1TVpJNjZwcWVGTTlo?=
 =?utf-8?B?SmJIMTBJa2ZhZmdhaFFrWmJUVlFhOEZ6RG1WQVpkZVZoNm9HUVcvSENsaklF?=
 =?utf-8?B?QndIdmc5b3p1OTRMeHRTak9vNnJuZWhCY2lWMEtzdzErR2tmZU5sdWtFakQ4?=
 =?utf-8?B?TGVrQlczSmo4L0pKUTNiTVdUN1RKZFFHbklTNGpQbVNNSHJsWEZMYmdlNWlS?=
 =?utf-8?B?UTc2dllyVkhYOWNEakFpaTNLMlVIa1F0MDlOcVluSjZuVzlydzlPOGk0MHJk?=
 =?utf-8?B?VjN1Y1UzY2J1K1BXMU4vZXc0M1VsVTBQdElSZmFsbjc1Y2VGcDZleEpTMFlF?=
 =?utf-8?B?L2NnczkvUzdUOEgyUklVRE4vczdsd0JOWEJaQzJJMVM2TlhLMzVTTmdwdkRx?=
 =?utf-8?B?WlVyWnZPNjNhdUVqZXZjdjY1aWE0UWlnM1NKU1MxY2piYXZ2b0lzUXlBbUdz?=
 =?utf-8?B?dXFPNDcvdE1pOGR5YkMzVWpRbW1WQ0hnY2kxa29Ddy90UnpueENKdGdpdlFq?=
 =?utf-8?B?VmV3Z1ZnbHdvK1ZPWE1wMHFEdHVWL1k0UlB1ZE1idkF4L2pyM0JRWUo4Z05N?=
 =?utf-8?B?UHY3bVYxVXUzWGhlTWwxZHlGWjVyMEkzKzRQdG1GMGY2bnUyVDdEME5ObUIw?=
 =?utf-8?B?eHdCYWhnMWtmZ2huY3RkWVFnR2RMRWMvLzFmVjRwcEdvSzByblgwWWNNS3pz?=
 =?utf-8?B?V2VaT2UvVDkvWTNaNmxheC83UDlZeWdFY0s0bzJKcDk3MmpGRHZGSHNoVzFa?=
 =?utf-8?B?VlhSNnVLYnBVY2QrMjBzUEY0azBrbk1aM3U1R3E5ZW1NRDdLeWVWTUt1cHBx?=
 =?utf-8?B?dXp2Ukw5ZU9SNVdQdHNzZnZ1UnJwT1hMaVFoZ3JUL294TCtPaDBBK05yMkhr?=
 =?utf-8?B?ZGdtdHRCcGZGMlVrckRubmQ0ZmlOWlJjd3dkZmhkc0hSbVhFSklyc0VwTjJj?=
 =?utf-8?B?SUFIczRjQml5c1BCZllyUjh3YUZvUDFZTnVidE9PNVhPdFVYbnVoclFOTFJN?=
 =?utf-8?Q?ni6UG6W3tUm5fkr6luYIr1Orb6dT/bg+gK+zRyb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1880
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6fda35c-828d-4ead-f317-08d966b4f32d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXrwgyVPKmpSb/fAxC1j68IgSNC9030gesGpPE49J55XZ8zn/+VDdFBx+Keo0JGRX+ega+D40FawVCqqbsviCyDLWBUrhro69FLh7I36q7a5dbVWUmnpzoRQ/wJCoUsWxeDfdbr90UBeqGp20Bpj+9IHzCnCey4HZtjgoNUOIMURGZyHWZBDnKmdFPyx+EuAnXAWI6vBa1oAKgG92i1X3p3+zpTNqCg5hWxIIIGWIz6fVgwejVKt+NQejoiXlSlevpgHyYuQVY1Dq2VT+7ZbHWa0SYLTAsWnw9Y83ofEjUjHB6oQXEekONNnHevbRRJJCTemPQzc57q9VcI9xSHzUQVaSDiTUrmm60KKp68IdGaSJvLIK6hPgiMnGcH8nQuCTUUOWTdbXOlka1Q2liLgzCpq9lM9KEeCFZxld2hmy+dTOECtBFD9vNWPoqBLpH0Dic55celYmQqxEsZMFKGoDOVMsv3KbIR9rWstfMxgZLQveSAF/NQrdOKEYHL+5XLnKi1o0a3NkKuIP3jyLXL22QGDeanGcEqvBKxgcaH4eKDZCenecFQflf/mWg5jaJcD15rJLkYutQ6mYJ/Eo7ua0cJYeSHR5imBc4Gg8r8e85kgYmTDWwuv7Xug3MoPzheMkV4Sbftk3LoKTPlW4R7eMYsXjRClS0AxztEjNd36IA7DgXLnZ469cgnGFVDdPIOrqSQDojHTzPHKUr6xnZABTA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(478600001)(336012)(81166007)(5660300002)(9686003)(26005)(52536014)(356005)(55016002)(82740400003)(53546011)(2906002)(8676002)(7696005)(82310400003)(70586007)(186003)(8936002)(70206006)(36860700001)(110136005)(316002)(47076005)(4326008)(83380400001)(33656002)(6506007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 04:09:30.2711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d9bedd-968f-4833-a0f0-08d966b4f8ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7132

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjPml6UgMTg6NTkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAyMi80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+IGRldmlj
ZSB0cmVlIHByb2Nlc3NvciBub2RlDQo+IA0KPiANCj4gDQo+IE9uIDIzLzA4LzIwMjEgMDk6NDcs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMjoxMQ0KPiA+PiBUbzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7DQo+ID4+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+ID4+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMi80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVs
cGVyIHRvIHBhcnNlDQo+ID4+IGRldmljZSB0cmVlIHByb2Nlc3NvciBub2RlDQo+ID4+DQo+ID4+
IE9uIDExLzA4LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gUHJvY2Vzc29yIE5V
TUEgSUQgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRldmljZSB0cmVlJ3MgcHJvY2Vzc29yDQo+
ID4+PiBub2RlIGFzICJudW1hLW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJz
ZSB0aGlzIElEIGZyb20NCj4gPj4+IHByb2Nlc3NvciBub2RlLiBJZiB3ZSBnZXQgdGhpcyBJRCBm
cm9tIHByb2Nlc3NvciBub2RlLCB0aGlzIElEJ3MNCj4gPj4+IHZhbGlkaXR5IHN0aWxsIG5lZWQg
dG8gYmUgY2hlY2tlZC4gT25jZSB3ZSBnb3QgYSBpbnZhbGlkIE5VTUEgSUQNCj4gPj4+IGZyb20g
YW55IHByb2Nlc3NvciBub2RlLCB0aGUgZGV2aWNlIHRyZWUgd2lsbCBiZSBtYXJrZWQgYXMgTlVN
QQ0KPiA+Pj4gaW5mb3JtYXRpb24gaW52YWxpZC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gICAgeGVuL2Fy
Y2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYyB8IDQxDQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQ0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1h
X2RldmljZV90cmVlLmMNCj4gPj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+
ID4+PiBpbmRleCAxYzc0YWQxMzVkLi4zN2NjNTZhY2YzIDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVu
L2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL251
bWFfZGV2aWNlX3RyZWUuYw0KPiA+Pj4gQEAgLTIwLDE2ICsyMCw1MyBAQA0KPiA+Pj4gICAgI2lu
Y2x1ZGUgPHhlbi9pbml0Lmg+DQo+ID4+PiAgICAjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+
ID4+PiAgICAjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPj4+ICsjaW5jbHVkZSA8eGVuL2Rldmlj
ZV90cmVlLmg+DQo+ID4+PiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+Pj4NCj4gPj4+ICAg
IHM4IGRldmljZV90cmVlX251bWEgPSAwOw0KPiA+Pj4gK3N0YXRpYyBub2RlbWFza190IHByb2Nl
c3Nvcl9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPj4+DQo+ID4+PiAtaW50IHNyYXRfZGlz
YWJsZWQodm9pZCkNCj4gPj4+ICtzdGF0aWMgaW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4gPj4+
ICAgIHsNCj4gPj4+ICAgICAgICByZXR1cm4gbnVtYV9vZmYgfHwgZGV2aWNlX3RyZWVfbnVtYSA8
IDA7DQo+ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gLXZvaWQgX19pbml0IGJhZF9zcmF0KHZvaWQp
DQo+ID4+PiArc3RhdGljIF9faW5pdCB2b2lkIGJhZF9zcmF0KHZvaWQpDQo+ID4+PiAgICB7DQo+
ID4+PiAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJEVDogTlVNQSBpbmZvcm1hdGlvbiBpcyBub3Qg
dXNlZC5cbiIpOw0KPiA+Pj4gICAgICAgIGRldmljZV90cmVlX251bWEgPSAtMTsNCj4gPj4+ICAg
IH0NCj4gPj4+ICsNCj4gPj4+ICsvKiBDYWxsYmFjayBmb3IgZGV2aWNlIHRyZWUgcHJvY2Vzc29y
IGFmZmluaXR5ICovDQo+ID4+PiArc3RhdGljIGludCBfX2luaXQgZHRiX251bWFfcHJvY2Vzc29y
X2FmZmluaXR5X2luaXQobm9kZWlkX3Qgbm9kZSkNCj4gPj4NCj4gPj4gSSBmb3Jnb3QgdG8gYW5z
d2VyLiBJdCBzZWVtcyBvZGQgdGhhdCBzb21lIG9mIHRoZSBmdW5jdGlvbiBuYW1lcyBzdGFydA0K
PiA+PiB3aXRoIGR0Yl8qIHdoaWxlIG90aGVyIHN0YXJ0cyBkZXZpY2VfdHJlZV8qLiBBbnkgcGFy
dGljdWxhciByZWFzb24gZm9yDQo+ID4+IHRoYXQgZGlmZmVyZW5jZSBvZiBuYW1pbmc/DQo+ID4+
DQo+ID4NCj4gPiB5ZXMsIGluIHRoZSB2ZXJ5IGJlZ2lubmluZywgSSB3YW50IHRvIGtlZXAgZGV2
aWNlX3RyZWVfIHByZWZpeCBmb3INCj4gPiBmdW5jdGlvbnMgdGhhdCB3aWxsIGhhbmRsZSBkdGIg
ZmlsZS4gQW5kIHVzZSBkdGJfIHByZWZpeCB0byByZXBsYWNlDQo+ID4gYWNwaSwgdG8gaW5kaWNh
dGUsIHRoaXMgZnVuY3Rpb24gaXMgZGV2aWNlIHRyZWUgdmVyc2lvbiBudW1hDQo+IGltcGxlbWVu
dGF0aW9uLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gVGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiAiZHRiIiBhbmQNCj4gImRldmljZV90cmVlIiBpcyBxdWl0ZSBzdWJ0dGxlOiB0
aGUgZm9ybWVyIHJlZmVycyB0byB0aGUgYmluYXJ5IHdoaWxlDQo+IHRoZSBsYXR0ZXIgcmVmZXJz
IHRvIHRoZSBmb3JtYXQuIE1vc3Qgb2YgdGhlIHJlYWRlcnMgYXJlIGxpa2VseSB0byBpbmZlcg0K
PiB0aGV5IG1lYW4gdGhlIHNhbWUuIFNvIEkgdGhpbmsgdGhpcyB3aWxsIGJyaW5nIG1vcmUgY29u
ZnVzaW9uLg0KPiANCg0KVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4NCg0KPiA+DQo+ID4g
SWYgdGhhdCdzIG5vdCB0aGUgcmlnaHQgcmVhc29uLCBJIHdpbGwgdW5pZnkgYWxsIHByZWZpeCB0
byBkZXZpY2VfdHJlZV8NCj4gPiBpbiBuZXh0IHZlcnNpb24uIEhvdyBkbyB5b3UgdGhpbmsgYWJv
dXQgaXQ/DQo+IA0KPiBBRkFJQ1QsIHlvdXIgcGFyc2luZyBmdW5jdGlvbnMgd2lsbCBhbHdheXMg
c3RhcnQgd2l0aA0KPiAiZGV2aWNlX3RyZWVfcGFyc2VfIi4gSSB3b3VsZCBwcmVmZXIgaWYgdGhl
IHNldCByZXBsYWNpbmcgdGhlIEFDUEkNCj4gaGVscGVycyBzdGFydCB3aXRoICJkZXZpY2VfdHJl
ZV8iLg0KPiANCj4gSWYgeW91IGFyZSBjb25jZXJuIHdpdGggdGhlIGxlbmd0aCBvZiB0aGUgZnVu
Y3Rpb24gbmFtZSwgdGhlbiBJIHdvdWxkDQo+IHN1Z2dlc3QgdG8gcHJlZml4IGFsbCB0aGUgZnVu
Y3Rpb25zIHdpdGggImZkdCIgKFdlIGFyZSBkZWFsaW5nIHdpdGggdGhlDQo+IGZsYXR0ZW5lZCBE
VCBhZnRlciBhbGwpIG9yICJkdCIuDQoNClRoYXQgbWFrZXMgc2Vuc2UsIEkgd2lsbCBkbyBpdC4N
Cg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

