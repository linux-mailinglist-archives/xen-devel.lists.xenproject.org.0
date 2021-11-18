Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A481945573E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227195.392872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnd20-00052e-HH; Thu, 18 Nov 2021 08:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227195.392872; Thu, 18 Nov 2021 08:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnd20-0004zG-Cl; Thu, 18 Nov 2021 08:44:32 +0000
Received: by outflank-mailman (input) for mailman id 227195;
 Thu, 18 Nov 2021 08:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bdp6=QF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1mnd1z-0004zA-9A
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:44:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe09::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdc7a26f-484b-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 09:44:29 +0100 (CET)
Received: from AS9PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:20b:46a::10)
 by DB6PR0802MB2488.eurprd08.prod.outlook.com (2603:10a6:4:a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 08:44:26 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::11) by AS9PR04CA0031.outlook.office365.com
 (2603:10a6:20b:46a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 08:44:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Thu, 18 Nov 2021 08:44:25 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Thu, 18 Nov 2021 08:44:23 +0000
Received: from 9c0c994e0549.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EE7BE924-0566-4884-ADA8-0252CD003CDA.1; 
 Thu, 18 Nov 2021 08:44:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c0c994e0549.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Nov 2021 08:44:13 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0802MB2599.eurprd08.prod.outlook.com (2603:10a6:4:a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 08:44:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b974:8325:d5ae:e8a5%3]) with mapi id 15.20.4669.013; Thu, 18 Nov 2021
 08:44:10 +0000
Received: from [10.169.172.97] (203.126.0.111) by
 SG2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:4:188::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 08:44:00 +0000
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
X-Inumbo-ID: bdc7a26f-484b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXqUrR5GD4K4RlH7p8iQ4qKd7fvKkIm6p9iJXqJ2xvM=;
 b=K4Sjvg0KGT6tIzFUV9Ew0TYSiv4CIaAKydindGR0hkgmaF04yBd7FmeGcBOyi8NRrpmG+E2AOSGmI1b8QyshrdOPPnUiPbr1FVbE0qHa658C5nHj64dXXttgkH5/gfziGADh8Ianra/76dfWayZLfXFPA9WVLMT+B2c9+Sw9UB0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f612e0e3cf4e25ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mgs0Yrce+9DpbT1P+Yk3NoHWoySy5nvhed35IFuMp0mj+iAhwF3xwqefQXClGvIxO+na22AyqYuwTwaSFqO/UcCFclCoxiRqvyGnbQuXwZDpg5U6OKdW0+Qhe7UbqLTAj5VodMwmemAtW4RhXUS5KSmp7T/3lbyv3XS8l7yn5pYodbvkMexYLmoopT7CIFxrYtA9hxfTD9IBobwROmPFin0RI9LljNCrTxQiv7gcVZWYGKrqb9Td76bJUSWVR7k6jh/tsNN7vN0opRXTr7WZtvpKsk4F4TeXymd+4EbsbjENKVbCk2B07vwc4J42MjdsRnwrE3Hy1s7gB8ge3cZw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXqUrR5GD4K4RlH7p8iQ4qKd7fvKkIm6p9iJXqJ2xvM=;
 b=DkAniO1eBTbdEJ8U3FWREqA+WQTGw5nKgBZBV63J+73lDMRlATIy4Em/0EguPt8brdKHgaV2f+vjJJmDVh/y5VxJF7JAL+q1kxUl1BG95swIWk+bpqjxM7n4ESUp4eZem1+Xf2J9SVXuHcVl71p41H/ZfznNUzAg5QEP3TR9z/CktXXI4qywUK2RR/dIsUnD/hZKP5rVhZJQ3hvsDz5JI/HoyPjtvm4RgvhIfK71ZzYTRrI4h54ZgKxvpBDndDWNT1n1+vxmEltUUi6AmgutyLXQeAInbgvEIcSIC0TTR9LToQ8urmfuFZrSN9ezRivDF1UOm2V1SYCgg0b0y6gypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXqUrR5GD4K4RlH7p8iQ4qKd7fvKkIm6p9iJXqJ2xvM=;
 b=K4Sjvg0KGT6tIzFUV9Ew0TYSiv4CIaAKydindGR0hkgmaF04yBd7FmeGcBOyi8NRrpmG+E2AOSGmI1b8QyshrdOPPnUiPbr1FVbE0qHa658C5nHj64dXXttgkH5/gfziGADh8Ianra/76dfWayZLfXFPA9WVLMT+B2c9+Sw9UB0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <251f2baf-548f-f7e6-852e-9ccc9ab11beb@arm.com>
Date: Thu, 18 Nov 2021 16:43:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Dario Faggioli
 <dfaggioli@suse.com>, David Scott <dave@recoil.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To DB9PR08MB6857.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8197cde9-870b-44c1-e12c-08d9aa6fa068
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2599:|DB6PR0802MB2488:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB248890E8B9AB5663B133B4179E9B9@DB6PR0802MB2488.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3P5A3icBA5f2iaWGn8lroIFrJqQjo7GRjWHyb+H4e1Mmok9uBwkHUQVd12cC7WEUe58kD7iAeqCw0XLmQSHfg/BOnfFrf7v7wiYasmo9tcOU+FpZmrcG1rU5+C+QmBTngoqE6Ea64JPrHJN2rHvJ3885iRkkJGPlLCyyOKtb4Kj7/rfFes3rgg8suHT20Ek+m3CA4rQuW3FWzCzPXejdw5Ms+JcB5uH9FFdZ/1a6bdr++powQYUSEY2Q0M4mtCOuWFxOUqkSBZi5NemV+nZqul2hbS6vQoMvSzvQ5u7u5tKO8+hxRAigxoMkfOAcTOXjq+8AvJlFYnlYlsjKItMNGfXCdviDUtUz5HHNRXrp3ZobSqdr5s7GcnGyw6vPQBcH+Zr3B6Gj4+S1xFJW5CQfnQJ/kIvaolPnx4/J1wpZqcwRk91ZgXE9uZKaw0NMzetTg+M8e+q1h6Wn25QahHhIabaYXvmlxylZICwSV5gccGBcnFZFGXPd/mGCcn2bf1SIo6rhvxBuVPL0vkBbqrWck6ItujoUDsLqQnpcrpDtYLaXZ+GEfjPvQndzb0gmO4XUagcPSd/blyJfehuVPAK/co57GJ9qOciPznHqpxsTpPS2zRLgUp4LFe1p0j0oFQX242/HhBQ5UYVkivKsmKjk4qE9F6GwCiXtCs0y9AFYIe/VdJO6ZJ6oqBNWqtZA0aqdxlTewhd3pDhkcrSMiZlMvTk0j8x88wdn+yLelgqBo61vCkU+kT2g23tWigHbcz29h+KszbdfLmxUPBY+OMmZiBbwNFNnD16JUoxK6duHgTTqB9cU+0v4FFS1wmE+i4F/fmjXGoQQO9BQBr2oRd0IKh2lHczjr168p5h/Zd4PpDdRscW/4/EJLEAlrnbxD+yJSC0vKnku/PeOgphWBqJJcg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(2616005)(38100700002)(53546011)(31696002)(6486002)(316002)(5660300002)(508600001)(16576012)(2906002)(110136005)(36756003)(66556008)(66476007)(31686004)(956004)(7406005)(8936002)(8676002)(7416002)(26005)(6666004)(86362001)(66946007)(186003)(83380400001)(59356011)(219803003)(207903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2599
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	480a121e-7b9a-42f1-88ce-08d9aa6f969d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	udBiINHNiE7HYEOZyVm5RuazukW83H2H0gBsamOiZ9LYLOnbcOEmzYSCpd43o3JGlS8eBRyTFa0PRp5KsvuxDU8Ok3VaZFPVJKL+xfoMOBOcEUmthsEhHQnYOmyp8LGbTqEP7xtRme6bR3OKvCS5Zw+pILlBxh95xNhygseV952r4Qm/rDPePxnUc2PI9czO0bwL34MW73GXZW3OoKsZgq50xx6fCVVTNWjhWUXLgH0OJsI1vlJrXhaM9D/Kq+LdCHiz2KbRVnZOb7GrWr2K8TfYNX48aiQG+nmVCfTEZ0FoR/fENVAiPhvfANt9Cppi/LonyHmwmRMuFQ97im7PEJwzldVi3qS8N3MJKa4kFmaZxGLYOleV2IQ/xmvJ7XGZWcy3vVDylUVzGi9If71U3l+MvS07xn78sKtp5v/ymSR3N4UoHZSDgp7de88akZ8quhZs8eYhdyQtok4NmDf6mLrmLb0Ygj5YQW8UnpucVPIMHqpeTGGJuGyxw2gq/EmpzaXvtz9Y0Cc6mescMERXsi1StABYsFSukuyag7tUGsrOz7mGlW42pGZcaZKn/sVjpqsa7HoJV1zhM6l/LlDTmTabA811oOo1FGlLGrVElJ9zxMv6ylJyz1AzjhKSjXBaZfXT0OHNcUcJe9urhv0THCcK9IGCDGHoBTfkjYwuLbs4BdbZhbOIRa1o+3VSqrFC7aoSWaOyDGteZrz8NjRkyAWB0YIYEl/1MUPH74AFQDuK7fcP0SmhdY2E9osYAIZp1/cB3l1E6lxXexZ583JP/DuUL3tSn2f2XhkQH23X8Y/eG1hSeDcxHdGrJ97W00KQI4sdz7q6jTOQtg0bIpIZAWUkFJ63JcRbxAa9+t6vV29aCvaWYkc2Tx0jLiEn72P3+D81lFUUxwCsHFYia8Pwow==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(82310400003)(70586007)(8676002)(83380400001)(336012)(81166007)(110136005)(86362001)(47076005)(36756003)(31696002)(356005)(31686004)(16576012)(70206006)(316002)(8936002)(26005)(2906002)(4326008)(53546011)(6666004)(54906003)(186003)(36860700001)(956004)(5660300002)(2616005)(6486002)(59356011)(219803003)(207903002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:44:25.8365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8197cde9-870b-44c1-e12c-08d9aa6fa068
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2488


On 2021/11/17 22:07, Bertrand Marquis wrote:
> Hi Roger,
> 
>> On 17 Nov 2021, at 09:53, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> Document some of the relevant changes during the 4.16 release cycle,
>> likely more entries are missing.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> CHANGELOG.md | 11 +++++++++++
>> 1 file changed, 11 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index ad1a8c2bc2..8b0bdd9cf0 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>>     no longer be built per default. In order to be able to use those, configure needs to
>>     be called with "--enable-qemu-traditional" as parameter.
>> + - Fixes for credit2 scheduler stability in corner case conditions.
>> + - Ongoing improvements in the hypervisor build system.
>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>> + - 32bit PV guests only supported in shim mode.
>> + - Improved PVH dom0 debug key handling.
>> + - Fix booting on some Intel systems without a PIT (i8254).
> 
> Missing:
> - cpu ID sanitization on arm64
> - fix 32/64bit vreg emulation on arm64
> 
>> +
>> +### Added
>> + - 32bit Arm builds to the automated tests.
>> + - New x86 pagetable APIs.
>> + - Arm vPMU support.

Maybe miss this one either:
Add GICD_ICPENDR register handler in vGIC to support Zephyr.

> 
> Missing:
> - static allocation for dom0less on arm64
> - dom0less EFI support on arm64
> 
> Cheers
> Bertrand
> 
>>
>> ## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
>>
>> -- 
>> 2.33.0
>>
> 

