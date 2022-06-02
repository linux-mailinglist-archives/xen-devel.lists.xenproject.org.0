Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BD53B26C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 06:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340835.565958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwcAW-0000pi-5U; Thu, 02 Jun 2022 04:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340835.565958; Thu, 02 Jun 2022 04:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwcAW-0000nY-2i; Thu, 02 Jun 2022 04:10:44 +0000
Received: by outflank-mailman (input) for mailman id 340835;
 Thu, 02 Jun 2022 04:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cpeu=WJ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nwcAU-0000nR-K5
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 04:10:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63bdbbe-e229-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 06:10:40 +0200 (CEST)
Received: from DU2PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:3b::20)
 by DB9PR08MB7699.eurprd08.prod.outlook.com (2603:10a6:10:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 04:10:35 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::d5) by DU2PR04CA0015.outlook.office365.com
 (2603:10a6:10:3b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Thu, 2 Jun 2022 04:10:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Thu, 2 Jun 2022 04:10:34 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Thu, 02 Jun 2022 04:10:34 +0000
Received: from 5043a14e0ac5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C11244C2-0C8D-4A7C-8AD3-5A5D86C2B028.1; 
 Thu, 02 Jun 2022 04:10:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5043a14e0ac5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Jun 2022 04:10:27 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB7PR08MB3355.eurprd08.prod.outlook.com (2603:10a6:5:18::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Thu, 2 Jun
 2022 04:10:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 04:10:24 +0000
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
X-Inumbo-ID: f63bdbbe-e229-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ktUSISaclaDrZ+GxiIo0w+hDS/kvsySeZNFD0B4cxnq/4jYc5+TpHZdI6ryQovOrSW9gePJ2WRKHVhzMOsvnYE3mJwwXySSojB0pnaVMByTuszlsIg7laL/gWjgdgMTtyBJ/yAkf1lTl7Zy8XjAXj7QnHIDAwSlYs0YPicumh0nqTIGgvBLIJAXd1+7saMjB0XUMYrC146bQ9oG/Sv66cYRtM5REvjGiP5B/wAO7MvbE+otfxXSgVe650KIdzobwjP2y4FQyhTZQ/w83SD388pol7UsdMXIiwqZBwCqipEV0a/lz0mmfAAY0KOUcUStwY2FSFNg3FsxolmBayWvg2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMrJHla0pmJ3TZNCdSIdkv1KpR1wdQRFa5FSC1mu+4c=;
 b=GuWP+XZNRm0qB1UQGSSZ233LWNY6Ss7P0grHrIunJ+IzI5Rr440QSiQOWWeXkyBnoPRj/zNkGFBdAjUlNEd/UWPFzL4j/XzfNgU8hfyztfE7/7b2wamH8VJmEvyKOL0dpftvYEnH8ox2dJa3ZC2J98YOndXcHEEpwIrVvNdobCsbiUP6UPx3jW9o98KcXCJmFad/35Ko/9EbQUXDABibMibvAA6HFG5bivNcf4NRQNjjocZFyR7fDm5YrLCESYaXudL1akEs4/aH4IpJ1YduYLvzbFaIvsXohwmZi9vH/WsdzaBJr0jG2O5V57iLZS22e3bhLgBQNsEO39UkT1wHrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMrJHla0pmJ3TZNCdSIdkv1KpR1wdQRFa5FSC1mu+4c=;
 b=FUmMqvMm26ZTvTHnzetf80+SZcBBkPmoaYAXV0mg2+d1LvTtlT6Uzv7W4P4eGYUOZeO9hf6HRdYXyEb+1N6MZZaokVlkIdBDTIc+znJmn/hCUu+06eawn2G9IaOFjEhu4RPYL0Bi48AU04HdsIPYa7YCGReZ+Co6XRnud6Mrof8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 681082eba03b6977
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+DN5D968g6veNblwwlvJkvB5QiVyJo/AHBY22deuNp6hxquW6XfDwBifzvJCmklbx7jhcXp1FRfqpfQ2ftc88vA0OzXYqVvB0Ch2TYWGBMExNg0nnq3/jFGrkAg/feib2sXegU/mFd8vQeFjxOZQW8SrUW+ddXSMUTVCMUQdcxdUKrVMa+gSml/BL1xrYSn7HWT7OcaCNYPDHcNO4RHtNFZO7iIxFF08Y/zMZlfjYlsv6d6JsCMKEfpCHfHye+V6o+TBh8ERLBp9HTScntKV0bEDIYgeoxnLx4VSN/rommjnP94MY0aqf22tfJ7w95hNhvAM26HGiEf53MiODpLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMrJHla0pmJ3TZNCdSIdkv1KpR1wdQRFa5FSC1mu+4c=;
 b=FFG5LRfGiKC2WiFERRedf87mpJHlE+XPqSkRPhcTGo8i6+0MCAWhtgruGMhoxl3b+foYK9ktOx1MR+f6CDdDLpiFWoVECUlttHHClpR+o2XiwQCFe3B+MFH0yxGIvJ3s6Te3Zw4ouqJJ+n9Dv4Gpjl612svRNptrcyijSR0MKyTgDTbq85cIdAUX0Haf5ACYXN6/epqm1WrJoKzxDu0AvoRDIVx7eE+Cvotx7xXFtCmI+udu9skkoP8ucBnrhtp9oJg9oRVC93RrW9O5Xvxn9zUUrO0zOKilH3ha88PHo+ySCE8MaDPtINd+2LhXP5dcil71A7GRsc/cgZYekmV6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMrJHla0pmJ3TZNCdSIdkv1KpR1wdQRFa5FSC1mu+4c=;
 b=FUmMqvMm26ZTvTHnzetf80+SZcBBkPmoaYAXV0mg2+d1LvTtlT6Uzv7W4P4eGYUOZeO9hf6HRdYXyEb+1N6MZZaokVlkIdBDTIc+znJmn/hCUu+06eawn2G9IaOFjEhu4RPYL0Bi48AU04HdsIPYa7YCGReZ+Co6XRnud6Mrof8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <f8674bd2-523f-bf89-2998-6f1176ad97be@arm.com>
Date: Thu, 2 Jun 2022 12:10:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
 <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 84e491fb-6a0f-48fd-c63f-08da444dd783
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3355:EE_|DBAEUR03FT059:EE_|DB9PR08MB7699:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7699F61017843D8A432BBFED9EDE9@DB9PR08MB7699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PiePK9fHtOP4E0OjAFL1sNGC8S9kS1bbGWU7FU1jZ4sJQFtb2MVFEc2uc82SxsyNEn23LMrcGz0raQLcMqAyZU5BKfBL9nwGeInHiessIH6vdIxv+dc151gdLi1e10AVqf8a1Nks//bQMlhiqkbzvMCNqBKi/2HIOQDT67Ymx1DQn42JJs14zMXbWcGMPUNLQkPaLxWYzklPi+20GbQE6muM/ouQmFY0OPz6auAJ2vogtm+QPx+b8BDYDpem5a2O49Fum0JVuFci/vF55LHj6djVXfUQYmkmpq3UocsGFVsGlYAPaVb3ViyOrr5ZvhlwmeC/Tp2OKTOnDzErPdHhOH++EySbPjRV3JaXjkVsR4AqGMPDe2Le+BSlK3uOY4byPBos6vr1Y/K2z6TUkoTcnkswyhIbNRU1caR33SpCVJ1BW4jEKLTd2nD3Gi6+ziqD3zPpKv1L2F28U+6Ei+dK3AdJLujSsRrcyOTJdZBJGcldwFOzEhrRkz4oDKkfbc49YS+Rx1rpZ6SzEpM7SvDJ9rdfHB1KkkFdzNrdy+D32OBi1rInWNb6bgAd3Od3haLKcMVebADdumV3B6IbUC7IjLSm7YWULL33PaPl9Y0cTEH6vu1juLPh3YZFLtW2oDX19E8BhBuGcVpGK0PH9gbgmXnoS7QnMWz4oSTVEcE8DufmiAFtnBr5Fz2RAM0LnOd7eCiwZGZCp4pvWRI9yoUElm0MzrHdVv466dLrc2HMFD0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(5660300002)(83380400001)(6506007)(8936002)(38100700002)(8676002)(2906002)(31686004)(66946007)(6666004)(66476007)(66556008)(53546011)(6512007)(6486002)(36756003)(508600001)(6916009)(316002)(26005)(86362001)(54906003)(186003)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57bf3d8c-baff-4049-e81c-08da444dd190
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Jbmba+C1/uCiE/sk5Mv8WVdu953lZJjDYKjusJwxDIjGkkvEiTsAeoQCCxx+rac4Z/IXzddjIHWWxv5qXn/aoGkBzan3cuQPSqprjs4CpHTdTSi10WDhhWiIh3+8buknQh6gDfau6VyOoTJ4rwdJemR9aNSb4HOeIns6cP+anMflq1wqfPmHkaxXIo2jlr08gBAvdMfDlVa8QMLM2CUZvnoFo/IfX+bOuwr0jks5Aon0EW1pkq9NkKVXXIHzbZtIIwpPs3TdwTYsHQMFFD88PsR0fJR+AP8wS2s9tLYAMCoNlEj+uslypSXAdJrht6XhuN3eOqNotDzl27LcjvRQZMTNiG0Dxd9YiOaXTUUC3kxsDLxuFkyNbRqwnYT4JwYgsgMn4SmH9mNYO0VdsFc/6qJbieXyF3ap0RFbL0xcDJfY1RIPiD3UXUAXYEoYQAj1gsMWsAj9U46+1FTzeG261mWx9YZzsqlT3HHFP0al+uxebidVNp21rK2Qzow9BuKK4heicOuUoVwxJU3DNgbde+lN5W7tD5TOGZ0ecv3WPDwN0gvSi3N3ARcMpu810VmH7+/sqFlTP/XnURwJjXtmp+GC7TZU8yiP55uUp7phNtAnDYswz6vO0oOqGWV+k2XgyiOkMiRuvjUp4PlNWA0nRzGTtF2u/+7YumPqRP83TRaqSCJGR1buEcSsM4fZwES53WkmlDmOD+xNicit4IYnA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6486002)(336012)(47076005)(4326008)(70206006)(70586007)(8676002)(82310400005)(83380400001)(508600001)(26005)(53546011)(54906003)(316002)(6512007)(86362001)(31696002)(186003)(6506007)(6666004)(2616005)(2906002)(31686004)(356005)(81166007)(40460700003)(6862004)(5660300002)(8936002)(36860700001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 04:10:34.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e491fb-6a0f-48fd-c63f-08da444dd783
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7699

Hi Jan,

On 2022/5/31 21:21, Jan Beulich wrote:
> On 23.05.2022 08:25, Wei Chen wrote:
>> @@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
>>   	return 0;

> 
> To limit indentation depth, on of the two sides of the conditional can
> be moved out, by omitting the unnecessary "else". To reduce the diff
> it may be worthwhile to invert the if() condition, allowing the (then
> implicit) "else" case to remain (almost) unchanged from the original.
> 
>> -	} else {
>> +	}
>> +
>> +	case INTERLEAVE:
>> +	{
>>   		printk(KERN_ERR
>> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
>> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
>> +		       "SRAT： PXM %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with PXM %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
>> +		       node, nd_start, nd_end, node_to_pxm(memblk_nodeid[i]),
> 
> Hmm, you have PXM in the log message text, but you still pass "node" as
> first argument.
> 
> Since you're touching all these messages, could I ask you to convert
> all ranges to proper mathematical interval representation? I.e.
> [start,end) here aiui as the end addresses look to be non-inclusive.
> 

Sorry, I want to confirm with you about this comment again. Now the 
messages look like:
(XEN) NUMA： PXM 0: (0000000080000000-00000008d8000000) interleaves...

So I want to know, is it [0000000080000000-00000008d8000000) or
(0000000080000000-00000008d7ffffff) addressed your comment?
Literally, I think it's case#1?

Thanks,
Wei Chen

> 

