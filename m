Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE77B15FD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609357.948395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmKN-0007p5-Ox; Thu, 28 Sep 2023 08:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609357.948395; Thu, 28 Sep 2023 08:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmKN-0007mN-LI; Thu, 28 Sep 2023 08:24:55 +0000
Received: by outflank-mailman (input) for mailman id 609357;
 Thu, 28 Sep 2023 08:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlmKL-0007mH-9Y
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:24:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ca72ee3-5dd8-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 10:24:50 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 04:24:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5583.namprd03.prod.outlook.com (2603:10b6:a03:28e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Thu, 28 Sep
 2023 08:24:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 08:24:40 +0000
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
X-Inumbo-ID: 7ca72ee3-5dd8-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695889490;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8B6HPR9dEfjIj2hem+WNqZ6lxwQ258Q+4w0NYzUFdy0=;
  b=gkzs242Id9P86+OqTiEkvWRibHrTnB0s1sEypfdSag0TuO08LMOgK4m1
   +VOLinwR7y+ftlIaVaqCJo1PUDVZPpO3nwhZb76qjSFtr+EuTLYuV9ZpF
   xHiIma25Zw4EZZYhHZo2pbmYYV3xYbuEMiV8WpfoXcXVEK0JXqPtoEu4H
   U=;
X-CSE-ConnectionGUID: VqUCK9meQTuh8qrolze/ew==
X-CSE-MsgGUID: 7ux880z+TPmBtCnDVGa5iQ==
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 124462796
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LMq0QqL3hTgbyWR1FE+RNJQlxSXFcZb7ZxGr2PjKsXjdYENS1mdSz
 zYaUWDXbPvYamryctBxb9+zp0gH6JLTy9NrSlNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhA7wZuPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5JGFxl1
 q0dJQkxcxDTnvixxKC2DeRz05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGNnWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv22rORx3yqBur+EpXn6+460AWBhVArDTcKfl2Xn9aw10+HDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5ytLyYT1qN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIaqivXlFDe2x
 CqFxAAijrAaluYX1KG2+1/WjjbqrZ/MJjPZ/S3SV2Ohqwl/NIisYtXy7UCBtKgRaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhklTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:VLsD/atCY2kuQE/9f6k1/sF27skCBYMji2hC6mlwRA09TyVXrb
 HLoB0+726PtN93YgBcpTngAtj6fZq4z/JICOYqTNSftTfdySqVxe1ZnOnfKnjbalHDHgA079
 YrT0BRYOeAQWSSp/yKqDVRKr4bsZS6GErBv5aQ854Vd3AgV0gC1XYANu/4KDwReOAcP+txKH
 P03KMuzFDMFhV2UimiPAh1YwGAnayzqHuBW29JO/cJ0njPsdrC0s+cL/H35GZ6b9oC+8ZczY
 AF+zaJkZlKHpqApCM1WAfonuJrcLeN8Ko8OOW8zvINIjHbggy0ZIJnMofyyAwdkaWU8V4vpt
 LFuH4bTrZOwkKURHi8pS331xDnyytG0Q6W9XaoxUH7qcjOXjg9EMYpv/MrTjLpr3A4tNVLyq
 hMxG6ut51LZCmw7BjA2w==
X-Talos-CUID: 9a23:tCFvzmHIFZIyBAvcqmJZ7XM/OZEgf0Th0XeAOlW/DXRkD7CKHAo=
X-Talos-MUID: 9a23:o8h/oQVRRuYiOIrq/GDxlGEybNUr35yrIlwml7k4lMDZNBUlbg==
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="124462796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7+qcZwvdzio+NlNEOfaE+QpZNyT+eOeNP/powS3K9hX3dNLS2bvIZtBUpS3ApHe/F74fqEt4tNY+alWkEnQrUvVlZOFKSsbJE5AhDPUm0zeRubCkcqwOS3U7pSgBRTqSSz37Uoe6LivK1eTY2d2426zJQBsI8X8YJxM9WjwjSCju3oY0tNeS+tM4OWGfvbACiitARlojIuhiYOsBdZwLZvX0l2+yPTmb5RkfFb8XP6lcJw7AQGk31QrxRDaJmw0JxHDkNbTfvf1SbaPTs29yZ3bMIf81oYv/3Elex6/ED1sgWxi/q9V3Gnd9YSfDZLqaKarPlfHdeSdYmtkMg9LTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aid/D0BOm83IvQS0evn5GSVqtpz+aJj91bQcOu2b620=;
 b=BPVReFnrKhJz0Rwrfn/7VGOmT0lyxY9usKEL3oPTkiNTxXlYM9zzJB05+apnoKozi8fXg/B1bATH8SWHrl6ip1eO3uM3v1ejZb81Ub/ltrC/42nVcDrsw1jZGrx2VFzn5huZOvYp9coDHkYs/skbk25eUFawhTjgjBFpyqDzCQMTWABJ61xSgiV3tfFUh0ECIeq2XJOUgemLUDootDi/WbSfVcVgIQfrOsTKzMGcI1gmNFg5uRHtPJBeI9gvhjCr0nJJTHlDYQobUdpuJLzZ9JbDnphpBiIiTF35k7NJVtiolUCnpBrj2ILh2OLqjc1V9xMpAzhOrwrHxoDXW81tuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aid/D0BOm83IvQS0evn5GSVqtpz+aJj91bQcOu2b620=;
 b=K5cIKHCW5XSgw0ZMtTc9xs0LIzFJWk2LBOx1i+biwUb90/bor8POG7UQ5PQ+OEzZT0uIE675LkGYsG8SUI7H8ZTQSMawywEGAh0BkwG/Ey0wWw3ahoYP6axSbqoJDLBR8mdahgdBxn4vTpyp2H2/VjU8f31tfcH/WGgCg0f3OyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 10:24:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 8/8] common: convert vCPU info area registration
Message-ID: <ZRU4QQcFL5Le5cFz@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ada41793-629b-3864-c2fc-412bd8d0047d@suse.com>
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: d2af8840-8e46-4ba6-9429-08dbbffc5bb3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ia7aYjapAnaNcNyvgJX18K1Qhgv4J9p+OoGsFX3UBqZtBViRjMjZZ1IMhd8bu+uk119DUaXUJgukuRriBgdpH4IaPigHUXoDuw6ZD79fAU6DgGMFSVgkSE4sckOQJYyC/X/Szzamw0DOicslhZMCk3gk0hgp7tOvjMr62l4XotRc6mbnd6RN5CP2CVNgt7LmbUQzRC4TrEVuKeSfipsZXl+T70fXKOusRM5LqeA3HVa6hYqRWw5aAqbdWkX5OS292hGivwnARI5pNES5o+qhmwloMRXm/AAiDeVphBTZhPEnP71KUflxFwYQ7oaBc/n5jFi9yv/BfoLfQuxnMUnxWakwdAA8yCdpecLpoIF0saQawaqE93FvJMGnwE/yuPbaMWkz7ayPAAJ+sPBbCQLLXap29gshehWgvxwScwyCHYQ4ISJzb7xUx7i/TLfTnIomL8S9no+Z9UY1WvZnQwWRZD9DlX5FuZCCvbYn7Eb1RUGtZI9OXrf7h15dc8rKlZONAYM1iszHCGYXQ9th4Kd3PXv5fQbp5uEfy7huBXCeeBo0pAp/KWpSiZQ3MMrFzzGzC+VTlKWCISDPII0sMfy593PnwQtnGINby5vlj/ArwL1zKGej7qOu/SrDCzaX1s6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(30864003)(2906002)(8936002)(8676002)(4326008)(66946007)(41300700001)(5660300002)(33716001)(478600001)(6486002)(66476007)(6666004)(66556008)(9686003)(6506007)(26005)(86362001)(54906003)(6916009)(316002)(6512007)(38100700002)(83380400001)(82960400001)(85182001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHgvZUtXREhEcDAwT1huZFdBdkRQemlYUUEzM1lZa1pyNlBDbExoV3R1ZmNC?=
 =?utf-8?B?T0RxR0psQlNiZElnTFlQSTJJYkRGVzJIWmNvOFlLREVqTk5KUFlCREFiUDUx?=
 =?utf-8?B?T3Y3enJMZ1NlYkdrUHZBTGlJVkpORXEzbm5VTEY0UkdsVllhVXByV1I0dlF2?=
 =?utf-8?B?RkY4N1hMWXdFV3BQYnVReEdqQU9pdFNsSHR5ZGU5dGp4L1M4eFFpV0FOTkdl?=
 =?utf-8?B?bllId1ZGdjYvdVBWUkYzcHMxYm5lMC9HSHh3Y29vcUtRMWhtaytJbDdyNXY4?=
 =?utf-8?B?Mks4T0xsUlBIQkFxTTdaMXAwLy9tTVcrekRIZ09qNUhEWGhBK2pmcG9xQW1D?=
 =?utf-8?B?bDFrWlFhbUZXUUxUcTRTYUs3eE9BOXRUZzR6SlJzSVFrOVpCeEZsNFZSWENw?=
 =?utf-8?B?UTRCbkhNelJOVllHRkN5Ylo4azlWRDBMWWV0a0dVMW1YeWJqZjVUVTBHY1N0?=
 =?utf-8?B?VXJCS1RsU3ZBRDB3b3FKV04xVnBNOVZDd1M3VEw0YVJCb1lBZkg4eXNSd0lI?=
 =?utf-8?B?SUN1UnhERGlERUwwU3hKaWVhNTloZjZWeTZwMHR6WWJ0RnVqR0NLNk5PcTdz?=
 =?utf-8?B?UXY5NzJQYmFQaGNEcm5xRHFHR3VSWGViQ3dJanpOSGMxVXVlMzVWcm50bnB0?=
 =?utf-8?B?Yk5PeXlKMVRheVlXMytBRjl5UVFCdG9HVzBvTkd1NVJKbWhReEhHbjQ4MlFh?=
 =?utf-8?B?MCtvVFFjYkVzUWFIbGh5SXJaSjAwc1lHQS85WC9CYzQ1ZXRtcldSS0xuUHpl?=
 =?utf-8?B?V2NTN0I2WXE2ZFBJcTlmUk01N1FBYTU4SnhBQlFLMUFWYXJMYjFaZXNSanhS?=
 =?utf-8?B?N0lWVVhaQUxDLzNjRlNOMUpOVnZRRDRBenJiZlpNTW05NTVOYmF5ak1EcVRu?=
 =?utf-8?B?TVZWZUREaTNySDMzV0xhVEhvbFhBV0JHSkQrcU4vemRBYUJtNzhtNmpzVVRR?=
 =?utf-8?B?L1VsZmZ5NVJPRWl4VFRpOUF5cFBFN0VRZnlKUUJoMms3YWtxYS9lY0NmZktj?=
 =?utf-8?B?SWZNcmtzWlcyc1R5RGR1Ny9xSjRCV1NBaDBJazJxcWdZRXlhRXMxWVhoRXEz?=
 =?utf-8?B?bEdYdkgwTlpPMzFDRXlodUhkNkpFcG9TbTBWWjkzMU0rQWd3WlNWVVdvSlJH?=
 =?utf-8?B?VXBORFgyNkJkby9hZldvdXdtOEcxbkZub1BmbkNjR2xhdlVsWHpKMVNhejh4?=
 =?utf-8?B?d0QzQnN1NjcvWGNqTTB5NEpMQ3NRZ1lmRURsK2dnNDFRT21iL2g5T3AvVTNv?=
 =?utf-8?B?Y2lHY1lVbk53cTEwY2poVy9DZ3B5ZUVYL3BJaVNjMG1JZW5EemNOVUlYOW1s?=
 =?utf-8?B?NkgrOVNKMHpsNmJBaUE5dkI1Z0dKWlBvRTJzMmZyM3JNZ2c1TWM1T1BQOVNT?=
 =?utf-8?B?Tko3V0dleUlXb2o5ZGN0YmxLZFlHWDl6Nlp0WnNHZEhGVGYycFByc2M3S0JW?=
 =?utf-8?B?K0tLNVZ1RHpqMlh4Nm9LRENQajdUbDN4UVhOUllVYnZJYy9oT28rNVEzQ3Rw?=
 =?utf-8?B?TFZnSSs1cXlJTE1jWkZpaXRUMG9aL1BncUdudmFOVUZuOWJSRUc5eFdKNU9Q?=
 =?utf-8?B?YlIyWlJWb2p5Ukl5elFtVmFPVzVSR2NJRldEYUZuZUdBdXN0N051c1NTeC80?=
 =?utf-8?B?K1N2SUZaMXVlODFJSGVDcitCUTFRRzBHYzVlckZnUDFraktTeGdJRDVtTzhK?=
 =?utf-8?B?cGlpSTh0dHhlV3RIVC8wYUxsQ3pCWnMrUnI3eHQzU2hzMlFMemFtYlRyV2pq?=
 =?utf-8?B?ek1qVE5LdTZ5cDY2Y1NNNXA0aU5yZk10YjNoNExmT0NaV2ZiWEMxRTFTTndB?=
 =?utf-8?B?bkJsNDFPbzRsblhrbFZreDA4YTVzcE1veWhoNTNoUHAxclRUakRrczVlUFJl?=
 =?utf-8?B?QTN0QzhYU0E1czhya2RGd0xkSk5uNnhHNjBXcjZQTUZYREoxaU5nNUZ0cU5Y?=
 =?utf-8?B?WXRiSGJxVzZVaGJYYmZjRlNCcWFoMXVFeU52cGVqQnFjOXVqYTR1a2luYzU0?=
 =?utf-8?B?R1NLUFlEMHUzZXhPV05wZTFVS1kyQldWbnZXMFducGg4LzNRSW04OGNheDkx?=
 =?utf-8?B?OHpaN2FHT3VyVFMzclhnaGthaDlKbkNFMDE2K1lSQ3VnUHkwM3RqdkxrQ093?=
 =?utf-8?B?Y2kwOXBaRnVXMHYyNFdZY3JmZXR6d0R0VVZtUDZzZWRzNVRreTZ2WCtlZmlS?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ly0liCOOrP6miMNAJEOMeAltejSPcR61cUYGB2AGNhhyYkTfndwGb5hWsMNaaJOFvPNKwJRhw5iF7iONW1JqaMCC1i/hHZwvrlDHgMc05zRg4OY8acP3X19LYFZmUq2O4Cw18/B49uQ6JTiA9SAK5PRNPsxk7x/8aPXxbUVOk8SFRUEIzkceBRhPw1izv06quVsxX3EEodmq0KfvyI7d9zWwG8fSCvpTUn6P5XfNkloKou9zv6wVy7g69nMF5H1TBVp4ow4H48Pl66hi0wWB/dQGbglquGDW7ae2xw4DDBRwSsrINxrOeA0bzvjUOEm5NNEMOTCThOG2x6n9STjRTZltyULY5f2QsYlSRRZjlebgHpGiMV/+j8t+CQ+gF0kO4A1+zR7wZCKLrsc2zo715802H9dzh6M5CU5nJh7EaM35CGbq7PzFyw2Zn3lMcmqJF7iaRrHFTHdGBIvHwTOd0xux3k35ToDsSGOGbBDe1AdtlhP+05R4X2zsrcv5S5VRPWgi/JTC+KrXFzuWTh6M5D1QodS/nab+WjR6shfuIle1MO3EE3OCoKtm2xGP9UYiG4QuhgCY7zRPpm7AT5U2cCIZjxCtZzQ7Qxa+AleokDldXXvIInEFhzT8d8qUDKbOoPezOydmXTFeqxzXj1H27kIFLGhkwA9q1pbDuOgA+ciu/mwfEVr10tP6BBCMxeuTHug0rRB8wmwv4jAu91zLwtmACyvXELjv+6wFqaKCwzLgwT+er9aQGSE98iti9KWVmFfMBcnubEEuJdVBl2+eq4lJH9AHvhBH7oU23xDwi5OIRXloqyC1yQA3H4svSj9Spm+jR/Q78oFnfBj6PF/ASFmD56XZqcx30er0Jp5xXEzdb3991O1xSBGX6PA//aFqF9T00OJXg+hqxTbwUJsgqw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2af8840-8e46-4ba6-9429-08dbbffc5bb3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:24:40.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LWV/s+0YWwf8/3ebEtewyXYcGgISRZiLNnQdqIOZTt+hhXk3Lmig+Dde/vSiE1gl9eAxPV7jYhFHBtbC+VtPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5583

On Wed, May 03, 2023 at 05:58:30PM +0200, Jan Beulich wrote:
> Switch to using map_guest_area(). Noteworthy differences from
> map_vcpu_info():
> - remote vCPU-s are paused rather than checked for being down (which in
>   principle can change right after the check),
> - the domain lock is taken for a much smaller region,
> - the error code for an attempt to re-register the area is now -EBUSY,
> - we could in principle permit de-registration when no area was
>   previously registered (which would permit "probing", if necessary for
>   anything).
> 
> Note that this eliminates a bug in copy_vcpu_settings(): The function
> did allocate a new page regardless of the GFN already having a mapping,
> thus in particular breaking the case of two vCPU-s having their info
> areas on the same page.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Some minor comments below:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: I'm not really certain whether the preliminary check (ahead of
>      calling map_guest_area()) is worthwhile to have.
> ---
> v2: Re-base over changes earlier in the series. Properly enforce no re-
>     registration. Avoid several casts by introducing local variables.
> 
> --- a/xen/arch/x86/include/asm/shared.h
> +++ b/xen/arch/x86/include/asm/shared.h
> @@ -26,17 +26,20 @@ static inline void arch_set_##field(stru
>  #define GET_SET_VCPU(type, field)                               \
>  static inline type arch_get_##field(const struct vcpu *v)       \
>  {                                                               \
> +    const vcpu_info_t *vi = v->vcpu_info_area.map;              \
> +                                                                \
>      return !has_32bit_shinfo(v->domain) ?                       \
> -           v->vcpu_info->native.arch.field :                    \
> -           v->vcpu_info->compat.arch.field;                     \
> +           vi->native.arch.field : vi->compat.arch.field;       \
>  }                                                               \
>  static inline void arch_set_##field(struct vcpu *v,             \
>                                      type val)                   \
>  {                                                               \
> +    vcpu_info_t *vi = v->vcpu_info_area.map;                    \
> +                                                                \
>      if ( !has_32bit_shinfo(v->domain) )                         \
> -        v->vcpu_info->native.arch.field = val;                  \
> +        vi->native.arch.field = val;                            \
>      else                                                        \
> -        v->vcpu_info->compat.arch.field = val;                  \
> +        vi->compat.arch.field = val;                            \
>  }
>  
>  #else
> @@ -57,12 +60,16 @@ static inline void arch_set_##field(stru
>  #define GET_SET_VCPU(type, field)                           \
>  static inline type arch_get_##field(const struct vcpu *v)   \
>  {                                                           \
> -    return v->vcpu_info->arch.field;                        \
> +    const vcpu_info_t *vi = v->vcpu_info_area.map;          \
> +                                                            \
> +    return vi->arch.field;                                  \
>  }                                                           \
>  static inline void arch_set_##field(struct vcpu *v,         \
>                                      type val)               \
>  {                                                           \
> -    v->vcpu_info->arch.field = val;                         \
> +    vcpu_info_t *vi = v->vcpu_info_area.map;                \
> +                                                            \
> +    vi->arch.field = val;                                   \
>  }
>  
>  #endif
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1749,53 +1749,24 @@ static int copy_vpmu(struct vcpu *d_vcpu
>  static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>  {
>      unsigned int i;
> -    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
>      int ret = -EINVAL;
>  
>      for ( i = 0; i < cd->max_vcpus; i++ )
>      {
>          struct vcpu *d_vcpu = d->vcpu[i];
>          struct vcpu *cd_vcpu = cd->vcpu[i];
> -        mfn_t vcpu_info_mfn;
>  
>          if ( !d_vcpu || !cd_vcpu )
>              continue;
>  
> -        /* Copy & map in the vcpu_info page if the guest uses one */
> -        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> -        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> -        {
> -            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
> -
> -            /* Allocate & map the page for it if it hasn't been already */
> -            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
> -            {
> -                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
> -                unsigned long gfn_l = gfn_x(gfn);
> -                struct page_info *page;
> -
> -                if ( !(page = alloc_domheap_page(cd, 0)) )
> -                    return -ENOMEM;
> -
> -                new_vcpu_info_mfn = page_to_mfn(page);
> -                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
> -
> -                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
> -                                     PAGE_ORDER_4K, p2m_ram_rw,
> -                                     p2m->default_access, -1);
> -                if ( ret )
> -                    return ret;
> -
> -                ret = map_vcpu_info(cd_vcpu, gfn_l,
> -                                    PAGE_OFFSET(d_vcpu->vcpu_info));
> -                if ( ret )
> -                    return ret;
> -            }
> -
> -            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> -        }
> -
> -        /* Same for the (physically registered) runstate and time info areas. */
> +        /*
> +         * Copy and map the vcpu_info page and the (physically registered)
> +         * runstate and time info areas.
> +         */
> +        ret = copy_guest_area(&cd_vcpu->vcpu_info_area,
> +                              &d_vcpu->vcpu_info_area, cd_vcpu, d);
> +        if ( ret )
> +            return ret;
>          ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
>                                &d_vcpu->runstate_guest_area, cd_vcpu, d);
>          if ( ret )
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -383,7 +383,7 @@ int pv_shim_shutdown(uint8_t reason)
>      for_each_vcpu ( d, v )
>      {
>          /* Unmap guest vcpu_info page and runstate/time areas. */
> -        unmap_vcpu_info(v);
> +        unmap_guest_area(v, &v->vcpu_info_area);
>          unmap_guest_area(v, &v->runstate_guest_area);
>          unmap_guest_area(v, &v->arch.time_guest_area);
>  
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1547,7 +1547,7 @@ static void __update_vcpu_system_time(st
>      struct vcpu_time_info *u = &vcpu_info(v, time), _u;
>      const struct domain *d = v->domain;
>  
> -    if ( v->vcpu_info == NULL )
> +    if ( !v->vcpu_info_area.map )
>          return;
>  
>      collect_time_info(v, &_u);
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -53,7 +53,7 @@ void __dummy__(void)
>  
>      OFFSET(VCPU_processor, struct vcpu, processor);
>      OFFSET(VCPU_domain, struct vcpu, domain);
> -    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
> +    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
>      OFFSET(VCPU_trap_bounce, struct vcpu, arch.pv.trap_bounce);
>      OFFSET(VCPU_thread_flags, struct vcpu, arch.flags);
>      OFFSET(VCPU_event_addr, struct vcpu, arch.pv.event_callback_eip);
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -96,7 +96,7 @@ static void _show_registers(
>      if ( context == CTXT_hypervisor )
>          printk(" %pS", _p(regs->rip));
>      printk("\nRFLAGS: %016lx   ", regs->rflags);
> -    if ( (context == CTXT_pv_guest) && v && v->vcpu_info )
> +    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
>          printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
>      printk("CONTEXT: %s", context_names[context]);
>      if ( v && !is_idle_vcpu(v) )
> --- a/xen/common/compat/domain.c
> +++ b/xen/common/compat/domain.c
> @@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struc
>      {
>      case VCPUOP_initialise:
>      {
> -        if ( v->vcpu_info == &dummy_vcpu_info )
> +        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
>              return -EINVAL;
>  
>  #ifdef CONFIG_HVM
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
>  {
>      struct domain *d = v->domain;

d could likely be made const?

>  
> -    v->vcpu_info = ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> -                    ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> -                    : &dummy_vcpu_info);
> -    v->vcpu_info_mfn = INVALID_MFN;
> +    v->vcpu_info_area.map =
> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> +         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
> +         : &dummy_vcpu_info);
>  }
>  
>  static void vmtrace_free_buffer(struct vcpu *v)
> @@ -964,7 +964,7 @@ int domain_kill(struct domain *d)
>              return -ERESTART;
>          for_each_vcpu ( d, v )
>          {
> -            unmap_vcpu_info(v);
> +            unmap_guest_area(v, &v->vcpu_info_area);
>              unmap_guest_area(v, &v->runstate_guest_area);
>          }
>          d->is_dying = DOMDYING_dead;
> @@ -1419,7 +1419,7 @@ int domain_soft_reset(struct domain *d,
>      for_each_vcpu ( d, v )
>      {
>          set_xen_guest_handle(runstate_guest(v), NULL);
> -        unmap_vcpu_info(v);
> +        unmap_guest_area(v, &v->vcpu_info_area);
>          unmap_guest_area(v, &v->runstate_guest_area);
>      }
>  
> @@ -1467,111 +1467,6 @@ int vcpu_reset(struct vcpu *v)
>      return rc;
>  }
>  
> -/*
> - * Map a guest page in and point the vcpu_info pointer at it.  This
> - * makes sure that the vcpu_info is always pointing at a valid piece
> - * of memory, and it sets a pending event to make sure that a pending
> - * event doesn't get missed.
> - */
> -int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
> -{
> -    struct domain *d = v->domain;
> -    void *mapping;
> -    vcpu_info_t *new_info;
> -    struct page_info *page;
> -    unsigned int align;
> -
> -    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
> -        return -ENXIO;
> -
> -#ifdef CONFIG_COMPAT
> -    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
> -    if ( has_32bit_shinfo(d) )
> -        align = alignof(new_info->compat);
> -    else
> -#endif
> -        align = alignof(*new_info);
> -    if ( offset & (align - 1) )
> -        return -ENXIO;
> -
> -    if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
> -        return -EINVAL;
> -
> -    /* Run this command on yourself or on other offline VCPUS. */
> -    if ( (v != current) && !(v->pause_flags & VPF_down) )
> -        return -EINVAL;
> -
> -    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
> -    if ( !page )
> -        return -EINVAL;
> -
> -    if ( !get_page_type(page, PGT_writable_page) )
> -    {
> -        put_page(page);
> -        return -EINVAL;
> -    }
> -
> -    mapping = __map_domain_page_global(page);
> -    if ( mapping == NULL )
> -    {
> -        put_page_and_type(page);
> -        return -ENOMEM;
> -    }
> -
> -    new_info = (vcpu_info_t *)(mapping + offset);
> -
> -    if ( v->vcpu_info == &dummy_vcpu_info )
> -    {
> -        memset(new_info, 0, sizeof(*new_info));
> -#ifdef XEN_HAVE_PV_UPCALL_MASK
> -        __vcpu_info(v, new_info, evtchn_upcall_mask) = 1;
> -#endif
> -    }
> -    else
> -    {
> -        memcpy(new_info, v->vcpu_info, sizeof(*new_info));
> -    }
> -
> -    v->vcpu_info = new_info;
> -    v->vcpu_info_mfn = page_to_mfn(page);
> -
> -    /* Set new vcpu_info pointer /before/ setting pending flags. */
> -    smp_wmb();
> -
> -    /*
> -     * Mark everything as being pending just to make sure nothing gets
> -     * lost.  The domain will get a spurious event, but it can cope.
> -     */
> -#ifdef CONFIG_COMPAT
> -    if ( !has_32bit_shinfo(d) )
> -        write_atomic(&new_info->native.evtchn_pending_sel, ~0);
> -    else
> -#endif
> -        write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
> -    vcpu_mark_events_pending(v);
> -
> -    return 0;
> -}
> -
> -/*
> - * Unmap the vcpu info page if the guest decided to place it somewhere
> - * else. This is used from domain_kill() and domain_soft_reset().
> - */
> -void unmap_vcpu_info(struct vcpu *v)
> -{
> -    mfn_t mfn = v->vcpu_info_mfn;
> -
> -    if ( mfn_eq(mfn, INVALID_MFN) )
> -        return;
> -
> -    unmap_domain_page_global((void *)
> -                             ((unsigned long)v->vcpu_info & PAGE_MASK));
> -
> -    vcpu_info_reset(v); /* NB: Clobbers v->vcpu_info_mfn */
> -
> -    put_page_and_type(mfn_to_page(mfn));
> -}
> -
>  int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
>                     struct guest_area *area,
>                     void (*populate)(void *dst, struct vcpu *v))
> @@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
>  
>      domain_lock(d);
>  
> -    if ( map )
> -        populate(map, v);
> +    /* No re-registration of the vCPU info area. */
> +    if ( area != &v->vcpu_info_area || !area->pg )

It would be nice if this check could be done earlier, as to avoid
having to fetch and map the page just to discard it.  That would
however require taking the domain lock earlier.

> +    {
> +        if ( map )
> +            populate(map, v);
>  
> -    SWAP(area->pg, pg);
> -    SWAP(area->map, map);
> +        SWAP(area->pg, pg);
> +        SWAP(area->map, map);
> +    }
> +    else
> +        rc = -EBUSY;
>  
>      domain_unlock(d);
>  
> +    /* Set pending flags /after/ new vcpu_info pointer was set. */
> +    if ( area == &v->vcpu_info_area && !rc )
> +    {
> +        /*
> +         * Mark everything as being pending just to make sure nothing gets
> +         * lost.  The domain will get a spurious event, but it can cope.
> +         */
> +#ifdef CONFIG_COMPAT
> +        if ( !has_32bit_shinfo(d) )
> +        {
> +            vcpu_info_t *info = area->map;
> +
> +            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
> +            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
> +            write_atomic(&info->native.evtchn_pending_sel, ~0);
> +        }
> +        else
> +#endif
> +            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);

Can't the setting of evtchn_pending_sel be done in
vcpu_info_populate()?

> +        vcpu_mark_events_pending(v);
> +
> +        force_update_vcpu_system_time(v);
> +    }
> +
>      if ( v != current )
>          vcpu_unpause(v);
>  
> @@ -1670,7 +1595,10 @@ void unmap_guest_area(struct vcpu *v, st
>  
>      domain_lock(d);
>      map = area->map;
> -    area->map = NULL;
> +    if ( area == &v->vcpu_info_area )
> +        vcpu_info_reset(v);
> +    else
> +        area->map = NULL;
>      pg = area->pg;
>      area->pg = NULL;
>      domain_unlock(d);
> @@ -1801,6 +1729,27 @@ bool update_runstate_area(struct vcpu *v
>      return rc;
>  }
>  
> +/*
> + * This makes sure that the vcpu_info is always pointing at a valid piece of
> + * memory, and it sets a pending event to make sure that a pending event
> + * doesn't get missed.
> + */
> +static void cf_check
> +vcpu_info_populate(void *map, struct vcpu *v)
> +{
> +    vcpu_info_t *info = map;
> +
> +    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
> +    {
> +        memset(info, 0, sizeof(*info));
> +#ifdef XEN_HAVE_PV_UPCALL_MASK
> +        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
> +#endif

I'm not sure about the point of those guards, this will always be 1,
as we always build the hypervisor with the headers in xen/public?

Is it to make backports easier?

Thanks, Roger.

