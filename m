Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E657984F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 13:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370592.602428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDlJA-0001LH-Gc; Tue, 19 Jul 2022 11:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370592.602428; Tue, 19 Jul 2022 11:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDlJA-0001IV-DR; Tue, 19 Jul 2022 11:22:32 +0000
Received: by outflank-mailman (input) for mailman id 370592;
 Tue, 19 Jul 2022 11:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LuP=XY=citrix.com=prvs=1929f1d84=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDlJ8-0001IP-Ue
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 11:22:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12718a98-0755-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 13:22:29 +0200 (CEST)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 07:22:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5955.namprd03.prod.outlook.com (2603:10b6:610:e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Tue, 19 Jul
 2022 11:22:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 11:22:18 +0000
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
X-Inumbo-ID: 12718a98-0755-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658229749;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jpE5EaLymmS3gJJbX75WqtTv82C9G5itlG5AWkllfU8=;
  b=XH5lJ8mpMVGeQgnmYH6KnmPLbwBs/AvYADLHDNIrxkiTfajII7oGBC9q
   MEWZItijdx+Tlub40tvcphzR61hM5tDIm2AsN7VNenK3exSv8ArvMMPCU
   0XoY78hzgJMjT59GUnAEKxavDxyO58/sNo1sl1p/Uqgz7qqcqH+50hT2u
   I=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 78688593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lDH27ql6kBjYob9RoDzH9GDo5gyvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWDuCP62IZ2L3e4t1Po20oxwAvZSHyNFlTABuqiAyHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462j4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kNJdE2w+hlAVtL+
 KYKBh5WZT7SusS5lefTpulE3qzPLeHNFaZH5jRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWID7g7JzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLaoiz81rKexksXXqobDYKl0OFKx2eh4WsdGhRGWGD45uWm3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JZFuZrtimW0KHapQCUGgAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yx7KENBqFfbpisWvQW2sh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7DJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:s9LCHaNJ31eW6cBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.92,283,1650945600"; 
   d="scan'208";a="78688593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9N3K9TaklxVcgXaab/UvgJIQybb/tiqs0wH5RU6MxbaDzQ7dKHYxJx+e6UAEIUAV9MjFzFYOJwdRUaDBUbuJNMCFIlYzd25Ek/H+TyhyQx/ZcK8at/Ga3TtVWSLmdn0K+TZB5BzKmSM0G+d4tXoz6jzDhrKqfGRjiZdd1HlhQGzqvAmS9fxhO19D636lLC695t0+kJbBIESYvdPeGREPpLoKC4wbxtxICGaKnWAeMm6weZcXthoYJiRLc1OvGTApddD/RyYPKuWhol3+LoY848gmyyZ7kc4Sn591FizLqic5kEANcpQMZy2hgHJInRR9oSb0/YDT8smLEtLH+obSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpE5EaLymmS3gJJbX75WqtTv82C9G5itlG5AWkllfU8=;
 b=UmsFF2zeXlyXuUNnsO+hP0dJEjkn30bnph0U8om+pR6JwcMI1EZmGEXb8SaBar2N8l2hNOabK/R8PJnzTCnSunl2viJNIwQJrcr1aioXU8fUkpCqjzeLFiaDbjetA49YYswxZxp8FCDSKaLZscAKPJ3/xahjohJdqEQ87XJa0YT8CV/+UECqon8ptN+N1cYvIIzCKuKmmvwq5pPcc7tctUtPWuXF+vsBQ1Ps22Uaf/oiuUbw9K2+bgQi58evU40IabVuAWl8RTglA4jbjbV1eGdW8epIgIU0rkVc3NQfZbmGRVF3Kh32Fdm3IcwHsmY3KMDXfcL7Avkc0K9obI/NvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpE5EaLymmS3gJJbX75WqtTv82C9G5itlG5AWkllfU8=;
 b=fGFPiGNvGlyPi8k5OxHJ+lWiI0l2cugJedljEhgHTfo3edS/iIAFNCcqGfZJLLAg1pCATDHI7OFAv+O92zL5cKWtngEbhLjC/5hh4qh6Vio/iaJP+WGE9EMNtuUDU0PBb3Gvx4t+opHFpdVR3JqSa/HeIKezY7cgYQr8gpn+70U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
Thread-Topic: [PATCH] x86: enable interrupts around dump_execstate()
Thread-Index: AQHX8DQPNo4qXehMEESfj1fdbKCDRqw1BvMAgAAbnwCBUcCggA==
Date: Tue, 19 Jul 2022 11:22:18 +0000
Message-ID: <70cefb48-ab0f-7a84-ed31-fa44c3135fff@citrix.com>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
 <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
In-Reply-To: <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6904c9e-8494-4d44-f1dc-08da6978f0c1
x-ms-traffictypediagnostic: CH0PR03MB5955:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 siF6V88ELVoIWVwsIyIclSlAoV4ROB4Y4Vm/2OcYgNQ6aqNmwIMjIRqUdde7t+1+VxTzMCPS6CvJfnvnvYocJGgbaUE1sMJMw1oqa98L1ioyALRsq/93FEj/uZUW6PHPkRuzp/9cTIpdsFjhQZaxD3esOV1ru7Fn96oUP0hyoKZNpMK90tY8Pxn0eHCuvM9Ooj3Sa5Q26+JJnSsLVE4ie2nRgJw3fAiTIf86YNuxyjIIRZ9MRKiNXJlP/O7x5rsZeCrN2mU7sWpFvISnJcYEYeLDBoQaInS/NaBIVet1lbF6u5fDveISt7PmAyNMf9lUDKiAhIeE5+djiXr6ThrdpZ+udBHiYoQeS9F4q2EeD5mg/CbF+z6Lj54L6UQbqSxdJMYjrCVgQME2Yu5tkPM+HcbnYCQFQVExtbOEiZhmf9i4S9/GfNa1erJh7whTmUD1cY8L/nteFqSoKITUK3+EW0iKzIQGAWDRooQn7cX24bTZ30XxuYltqC8BF8hN4i6B8KDyutGgTTBa3MMQkDYiT3T0GDMPdJ3yB+aS/1SRJA76WuImISGo4wh/2B3wNOJ8aS+Wp3At92TBCy3IOCWDMlr5ogh3tayZGBqIz3xO4lkyZJwzOrDQ4Yf3anz155Z76q2yZgVMX4ss2hB8geoky+c979GfK6bcyzIJvYm/lX6vbT1HxzpgIlE0rrowXfiMmnpXn/rwSVCToKQ8+2fiwiAMsG6376XbO8TRiXZEEj1AR28LrnNsSxg94wjEo5788PscrmS9cHLpLEKGrRQqa5goi1w/CgJGky7hnxeXZv2wv9OhGGc3No7n73FWS+QRSZwStBV49qZZ0uuyCaLSBuSruLilIshYLNnSLGSbpBuq3vuLuayQV48PekBCzMXi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(8936002)(5660300002)(76116006)(66556008)(66476007)(4326008)(8676002)(66946007)(38100700002)(36756003)(31696002)(122000001)(64756008)(2906002)(53546011)(66446008)(2616005)(41300700001)(86362001)(38070700005)(82960400001)(6486002)(71200400001)(478600001)(54906003)(110136005)(83380400001)(91956017)(316002)(31686004)(26005)(6512007)(6506007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXY2ZSsxR3cyR0pLclBiemI4d1l5QnFlZEdQdEo4Ri85QmRldENqZW5uWXBD?=
 =?utf-8?B?VWQwRUpwV2tJdDhHN3EwbS9uL2lUVzFXM2xvQnFENWpDcGpRNkZ5WDdRQ0xl?=
 =?utf-8?B?ZHdlV2t4Tm11RzRNbjgzM3ptQ21kUmViSnZ2dXhuT21JTlZCSHNVRlMvZzVt?=
 =?utf-8?B?dlBkYmt6VkVkZnBVRXNlTllRNkpDUFI0Z0hBY056QTBEQWpjYXQwZVlOYmxp?=
 =?utf-8?B?U1RIK1p5Nms4ckdDeU8xUllhZ0NUbjEzSWxKbDRPbnBpRmlrOEM3dE50Nmdy?=
 =?utf-8?B?M0VBeWpXbzZGTmI5Z0J3RnFGM3VoeGZFOXVQTHJxdTVHcUhReXRiOXY3VEJp?=
 =?utf-8?B?RnhtNmV5QjcycjV0ek10K29NaWU2Q0srWkt4bEJxNEtydDM2Q0NwemE2Qzhk?=
 =?utf-8?B?NmNFczZ2bjR5cndYUWc1bURhbFNYcVlBVzl4TVZnVGh4YnRkdHMxbS9CMlZi?=
 =?utf-8?B?cXdPd2hUQU9UczlwQjRxR2U4VmZWNXJCUlJwRmx0WVMyTVpRR0NCLzloa1c5?=
 =?utf-8?B?dDNmOTFJNFZoN21ES2trV0hLMmk4czBXTnRqbExCV1hTdFhCaTZRR3p1REg5?=
 =?utf-8?B?aFZVZmZqWmdnVHlhOU4yZng2bXJ2bUpEM0xQb3FFNnNKTFdiT2ZRNDF2Vnpm?=
 =?utf-8?B?M3pvdkgyNDYxbkdVWE10WW1Ka1lrRWRDTzFlaVBabVBqSXdMVk9VcytqRVJZ?=
 =?utf-8?B?Qno1RTVySTk0dDRLTFJwekZ4VFJTQmwwVXhFUVYzMXdTZXc3YnF5TmxmQnVJ?=
 =?utf-8?B?N3c3YTVsQmpnZ3NQRDRqbnc4THBWSDZ6TUFOWGtsaU1zTUdnVmt0MFBNZkNp?=
 =?utf-8?B?Rlh4T1U3R1h4NTQ2UFk1N2hyc0MyTGlhNndsYUZDTHR3NVdqS0c2dDBQWlpF?=
 =?utf-8?B?MzZTcG1PWDFjVHFxVHpmbGFEc3dnSXNmMkU3M2RXL1pYS0JrSkZPMVJheGg1?=
 =?utf-8?B?L1ZScStUYld6WVU1T0FrcVo2TGNDR1JJTFV2NXR3dnlJaklZaHVqa3ArVTZL?=
 =?utf-8?B?UTRNN3BhR0RMT3lheWhlVHY2MHFhY2NnU292VHVxN3VFQ1JHbzIrb280eDZt?=
 =?utf-8?B?RmdsZ3Nzb3NVWFliVzRmYVFjcVN0R2ZHQzlNRGlBZ2lPWFEvQnFLMkQrUVZa?=
 =?utf-8?B?TEs2bEJuL0FMaHhISHh6VVcvVXlXVnhjbGxCUFZkOHAvcXhITm4zSmowMlRs?=
 =?utf-8?B?UzJHK1d3VkFwcTEralJ2UWd0ZWNTVnpRVTJOOHQ1NDQ4R2tCeEYwczdvbjRp?=
 =?utf-8?B?RXd4dVIyMGlFdyt0NVJMZDErT2hrUmdTeVFwWHJPd0NpWDZqRFFabHdTVExv?=
 =?utf-8?B?ZzNzNm10aXdYTkZjNG90UGsxSDB3ZnZVVkc4eDc2KzlkV1A5M2l4K1prdlJm?=
 =?utf-8?B?NFZmdUtuT2V6cFh2SFhWeE5kRk9vM2RCTWdKa29RVXZ0dTdXNjgyNGlkNG9z?=
 =?utf-8?B?TWlEVys5bmtHZHVlN1pHcytkQytmdTd3NnZMQnkzTE5xR0NOenBBSmdGcy9u?=
 =?utf-8?B?a3lZMEdXdElJY0dYbklOaTdkM3hCMVNBV2ZLZWpGOFFyY044SXNWR3JhT1oz?=
 =?utf-8?B?TWNuU2h6S3dlNmxtd2hKTjB0M045SDRTc0dpcmNaalFwNEhVQnEzQ3ppdFlh?=
 =?utf-8?B?NlNOTmR0RmMzNW9jU3QvNkYzaGtGUFR0WnhId1JvZ1NEbThVUDNISDFZVVlK?=
 =?utf-8?B?RXdBeXpKNFJOZFI2VzZUOHkwSTd5Vks3KzBpT2dKMkxrSXJSelF1UGllOG04?=
 =?utf-8?B?cWo2Ylhreno3cVoxVU5kYWVHdEswVlY2NXFISjNNU2hnaW1vdXMxalJNblJI?=
 =?utf-8?B?bnRvcDZGaGlVV3IzSFh6WE1RNkxPTXBZN1ljZVcxTmtOdEt4ZHR1QXZncERR?=
 =?utf-8?B?S3dKTllFWm9pVk5pS01HdmlCT1Z1Ny83ZHZ0UWlkZGxaK3JxWEhaVUhPSWhk?=
 =?utf-8?B?cGsxajhvWXQrTlRoWDZGd092U29mQ1UwdW5YakFyWk1LVGZHN3pzN2ZxbEpV?=
 =?utf-8?B?THpnLzNjUVhCL1hOa1hIYmhtbkpWRzFwTnFxSTA2MlFUUERNVVFqM0U1RlBx?=
 =?utf-8?B?Y2w4V21DcXVBbXpmNC9aYTQ2QkQ5SldPaG5aQzE3MEc1L3FrcWZHS2pJTmNX?=
 =?utf-8?B?L2JCUFpjNVU2Ym5Td3AwWlNHKzF4VU82aDFPaUhIL1lNdW0wYXpRVTJIWU9M?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BED913E203A4A488B072B2F19AD1289@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6904c9e-8494-4d44-f1dc-08da6978f0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 11:22:18.2268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QyXFdUHORR4VoBzcnicYawTNZGIII8He5FmuC4IBBey7scwvsgMuTLc6QrRGrrsV4Hl179Ziw0gKNPB/o5UYEMQAB/0P6jbRuYgiMVnSp7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5955

T24gMTYvMTIvMjAyMSAxMzozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjEyLjIwMjEg
MTI6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMy8xMi8yMDIxIDE1OjEyLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBzaG93X2h2bV9zdGFjaygpIHJlcXVpcmVzIGludGVycnVwdHMg
dG8gYmUgZW5hYmxlZCB0byBhdm9pZHMgdHJpZ2dlcmluZw0KPj4+IHRoZSBjb25zaXN0ZW5jeSBj
aGVjayBpbiBjaGVja19sb2NrKCkgZm9yIHRoZSBwMm0gbG9jay4gVG8gZG8gc28gaW4NCj4+PiBz
cHVyaW91c19pbnRlcnJ1cHQoKSByZXF1aXJlcyBhZGRpbmcgcmVlbnRyYW5jeSBwcm90ZWN0aW9u
IC8gaGFuZGxpbmcNCj4+PiB0aGVyZS4NCj4+Pg0KPj4+IEZpeGVzOiBhZGI3MTVkYjY5OGIgKCJ4
ODYvSFZNOiBhbHNvIGR1bXAgc3RhY2tzIGZyb20gc2hvd19leGVjdXRpb25fc3RhdGUoKSIpDQo+
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+IC0t
LQ0KPj4+IFRoZSBvYnZpb3VzIChidXQgaW1vIHVuZGVzaXJhYmxlKSBhbHRlcm5hdGl2ZSBpcyB0
byBzdXBwcmVzcyB0aGUgY2FsbCB0bw0KPj4+IHNob3dfaHZtX3N0YWNrKCkgd2hlbiBpbnRlcnJ1
cHRzIGFyZSBkaXNhYmxlZC4NCj4+IHNob3dfZXhlY3V0aW9uX3N0YXRlKCkgbmVlZCB0byB3b3Jr
IGluIGFueSBjb250ZXh0IGluY2x1ZGluZyB0aGUgI0RGDQo+PiBoYW5kbGVyLA0KPiBXaHk/IFRo
ZXJlJ3Mgbm8gc2hvd19leGVjdXRpb25fc3RhdGUoKSBvbiB0aGF0IHBhdGguDQoNClllcyB0aGVy
ZSBpcyAtIGl0J3MgcmVhY2hhYmxlIGZyb20gYW55IEJVRygpLg0KDQpJdCdzIGFsc28gcmVhY2hh
YmxlIG9uIHRoZSBOTUkgcGF0aCB2aWEgZmF0YWxfdHJhcCgpLg0KDQpUYWxraW5nIG9mLCBkaWRu
J3QgeW91IHNheSB5b3UnZCBmb3VuZCBhbiB1bmV4cGxhaW5lZCBkZWFkbG9jayB3aXRoIE5NSQ0K
aGFuZGxpbmcuLi4gPw0KDQo+DQo+PiBhbmQNCj4+DQo+PiDCoMKgwqAgLyoNCj4+IMKgwqDCoMKg
ICogU3RvcCBpbnRlcmxlYXZpbmcgcHJldmVudGlvbjogVGhlIG5lY2Vzc2FyeSBQMk0gbG9va3Vw
cw0KPj4gwqDCoMKgwqAgKiBpbnZvbHZlIGxvY2tpbmcsIHdoaWNoIGhhcyB0byBvY2N1ciB3aXRo
IElSUXMgZW5hYmxlZC4NCj4+IMKgwqDCoMKgICovDQo+PiDCoMKgwqAgY29uc29sZV91bmxvY2tf
cmVjdXJzaXZlX2lycXJlc3RvcmUoZmxhZ3MpOw0KPj4gwqDCoCDCoA0KPj4gwqDCoMKgIHNob3df
aHZtX3N0YWNrKGN1cnIsIHJlZ3MpOw0KPj4NCj4+IGlzIGxvb2tpbmcgZGlzdGluY3RseSBkb2Rn
eS4uLg0KPiBXZWxsLCB5ZXMsIGl0IGRvZXMuDQoNCkJlY2F1c2UgaXQgaXMuDQoNCllvdSBjYW5u
b3QgZW5hYmxlIGludGVycnVwdHMgaGVyZSwgYmVjYXVzZSB5b3UgaGF2ZSBubyBjbHVlIGlmIGl0
IHNhZmUNCnRvIGRvIHNvLg0KDQpXaGF0IHlvdSBhcmUgZG9pbmcgaXMgY3JlYXRpbmcgeWV0IGFu
b3RoZXIgaW5zdGFuY2Ugb2YgdGhlIGJyb2tlbg0KcGF0dGVybiB3ZSBhbHJlYWR5IGhhdmUgd2l0
aCBzaHV0ZG93biB0cnlpbmcgdG8gbW92ZSBpdHNlbGYgdG8gQ1BVMCwNCnRoYXQgb2NjYXNpb25h
bGx5IGV4cGxvZGVzIGluIHRoZSBtaWRkbGUgb2YgYSBjb250ZXh0IHN3aXRjaC4NCg0KRnVydGhl
cm1vcmUgc2hvd19leGVjdXRpb25fc3RhdGUoKSBpdCBpcyBhbHJlYWR5IGJyb2tlbiBmb3IgYW55
IHBhdGgNCndoZXJlIGludGVycnVwdHMgYXJlIGFscmVhZHkgZGlzYWJsZWQsIGluY2x1ZGluZyBi
dXQgbm90IGxpbWl0ZWQgdG8gdGhlDQpvbmUgeW91J3ZlIGZvdW5kIGhlcmUuDQoNCmFkYjcxNWRi
Njk4YmM4ZWMzYjg4YzI0ZWI4OGIyMWU5ZGE1YjZjMDcgaXMgYnJva2VuIGFuZCBuZWVkcyByZXZl
cnRpbmcuDQoNCk5vIGFtb3VudCBvZiBwbGF5aW5nIGdhbWVzIHdpdGggaXJxcyBoZXJlIGlzIGdv
aW5nIHRvIGltcHJvdmUgdGhpbmdzLg0KDQp+QW5kcmV3DQo=

