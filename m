Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B363C4A6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 17:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449531.706349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p037Z-0008HL-9T; Tue, 29 Nov 2022 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449531.706349; Tue, 29 Nov 2022 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p037Z-0008Et-6Z; Tue, 29 Nov 2022 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 449531;
 Tue, 29 Nov 2022 16:06:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/UE=35=citrix.com=prvs=3254d5a84=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p037X-0008Ek-T1
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 16:06:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b979c7c5-6fff-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 17:06:05 +0100 (CET)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 11:06:04 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6524.namprd03.prod.outlook.com (2603:10b6:303:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 16:06:00 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 16:06:00 +0000
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
X-Inumbo-ID: b979c7c5-6fff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669737967;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NgA/STj9ezoZwb+INqHgunJ3U0p4UEDJ0v8AQ1j1ZDs=;
  b=Urnk5dtWecCf4oMIXRXLyeXHVJVr2z0F6J1HPKxqTHBzaVN6Ku+POGJp
   kaYoGcf3uTLzwj3LRCIjsrP3FzyjgKNoBwoDXVJoSXMnc4aLKzc/1SHuL
   Mscn7rapFAzM/Ai/8Od8K09r1pzJiNJiYDVURz/tdJamrO1m3U7wWkQOI
   s=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 84822302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MWCKoKzBwabz8Ip0v4J6t+cQxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 GtKWm6PO6uMNmH2LY0gPNy3pkNU6sDSztMwSwtt+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6ET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUdu1
 fwiJSEvUkDZqNms7LOgZvZ2i+12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rOfx3mgANh6+LuQp9c6w1izwWIvMBgGUXG1haXm0h+BYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICMBEw0M5oC7pJlp10qVCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:pN1mE6/EQCR3mnOC/E9uk+G4dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBvT8LZyrnPDsqZpWAgjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="84822302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPYmice7Tzb+zIYA4INp3laMyoRCkUzjok1mkzHLmwUvucfU7Fi4bSv5kfHraPC8AfpcllVmZ7BnOrAvTp7OB/cuTVFQDHz0ZA850m/TIpGidVayopUl10mwFwaMcwKfPMm+ZrLx5yXUNtlaujq/ogUli+GD/Jh0c3mT5bTQ8IoEJw197V4rjr6cumNipWhzatCtmOsanHG3vGA8AHT6Qmikyz2JrS9P6xWhW4J1Ye9o9l5IyM9sTP/6NE8ZLnRy0pki48oTjjBjrBR8odAlAZzpXYrK/76yjciG5BU7v1ue083lyc5Ej2fTfXQC5/BS5l6ISXMzIIxKCbXC7y3VQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzbSsX3HDf7CfnUgJV7rp+sWAYeSupJsGqT9bocxve0=;
 b=Giyu8nzr96q6ZfjbqSYoSn5qRqCtZMgvUG+IVLv8O4ZVyloRuuMtvV1rFTZNWvBa/nwmljErCFIXi0jOtkgq0moRLotmV7Jdhst52rOPXNUAl7mCZWX8EzLHpLttg0usmTDRxE82AFuFvxjJ3QVLVyapc29c2bTZlwRX6iaf8cpLKSoTuOT+Cp56xDhvF8Xs0+9vQeqKf3g3dAxgLyDWWbgX9srExGEF+zb7fxROePScjiBTnwVAsASHCwxw4Tb3DBkH5nkaRhbNLupTE31BFN59ml5BY6yT1Zk6Rns+BCDVs9fi5EgrUm4eZ8vW7BqguC/cYXkSVkxmLs79tInXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzbSsX3HDf7CfnUgJV7rp+sWAYeSupJsGqT9bocxve0=;
 b=G61/WnGsfObQCCjBsv5in2rM5hI3EGpoRaTs7VkVSXfSpzpymDZLPhS4/V4aHWD+Trqr2U3LuSt5QSPLHHdy4BUzEL03Wrq+haIgwFSgVE0Z0SI/+G0AIrbABmMsRRL/O+kTzw5RBzjxexZrhBA3OYSduOyYscohFwNtaOMUOEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 29 Nov 2022 17:05:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/APIC: make a few interrupt handler functions static
Message-ID: <Y4Yt400C4cHxMAal@Air-de-Roger>
References: <54ee1bd7-9b6a-efc7-8bad-50aa7d6d955b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54ee1bd7-9b6a-efc7-8bad-50aa7d6d955b@suse.com>
X-ClientProxiedBy: LO4P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a4cc9e-0823-4a93-3fae-08dad2239bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RoN+fHEi3ButdXSTrjZWaktWpQjIZVFK5v2q1M6hERw7VNekz+9Sl0OP4OYIHEF853bs5FwMwmTR44iTi8SpQ8wsMBKL5mOovcbCr64s+8ShGxhHJno33kS2KARCUnAqvwcQ7HInobk7Rw1XqbOI73j6AyIcVV+m20cKoi5O0v++YSv+CSKVa6iSgMU1DBUpbA0O8QStrxVrl3zZTNsxYdnAJ/B96HEIyILBRqvS/tC+Sd7wImQ+0nEaN4IjaAAIUfWP9nh2HIGuBEnEPU9c8409IhLD0o759XznxOz5zR91/ElyK3kCZPZEhLywOd61BeqBRKO23YnK0eD48UAwOqbaIwyAUppD26WnmE0qZmL0Feldn7G0qYk3bKighjij4WlA0ckttcagXRXUdN4QEKLlgeZ+TRY43FD5jtc18eqEP27YXN1UiaApO7W4dG7VAaydywat2KDIsXXn8RMGRr9Gc5z6I3wRxg6LEEGA9pxGWVowPl9rFV8Do9VZj/W1W1IfGvfcy+YCqw/fElCQ0b/FH8srWanqFk+SiPvhXDOmN2E8jah1/8/on+s8lhRMX2eOo6HjB2IZRl7oszkBjCdD9ijgVyk5YDPHQnHcjj/gb8OSfX4w1F92CB98PJCR+ifq8IHuuC5fpT4XhyktyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(2906002)(41300700001)(8676002)(4326008)(66946007)(66476007)(66556008)(316002)(85182001)(6916009)(8936002)(54906003)(5660300002)(33716001)(26005)(9686003)(478600001)(86362001)(6666004)(6512007)(6486002)(6506007)(186003)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUVwRjdSSmhIMVhSU1kvWFY1RWFLVm9UYmJ2em5IUkE3Nzk3UzFCNURTY1Rj?=
 =?utf-8?B?SkhqNFlPeXZrWHJKMDJvdmdOdW1OY0NYOXVSUjdkNzlCSzJzandKTk82ZWVx?=
 =?utf-8?B?M2RFWUJ1ZDgwS0YzZGpwV3Z1bWRnWnlKTDFRcHNTSDRybnZ4VWNVbVVMRHZu?=
 =?utf-8?B?SVN2VXBuVjJicXVVNHNGUEVRL1Z2cndqTDlQWTBGL3VzaTFOUWZtSWR6K29y?=
 =?utf-8?B?Q25qYVBBcmZ2cHNFSUtJazJSVFRCcVdvVGRZMkZLcXZzT3hFaEcramN3V0Rm?=
 =?utf-8?B?akpaMnloMmpOZzd6eEUvMGNIK1BOWVl1OGZoeTVEOWR2aFM1TzlwR3YzVkZC?=
 =?utf-8?B?Mm1lZTdSYnpHdS9GRUgzYks5aGlpZDh6dmRPOTA4NzB1VVFJZEhWVHhTeVla?=
 =?utf-8?B?Vm5uNENkMHNkNEpNOXlRcEVlMkt4MWU4cHQ3eDR3YWxNd3g5UGM3aFY2QnFo?=
 =?utf-8?B?K3prQ1FXQWpVTnhnQWY3blVyUzZEKy9NMEpBcXVXRk9tRU45QVRtall3VWFi?=
 =?utf-8?B?L1BZSGtVcVV0QWZ6OGd1elhNTkRnZHp6U2VvdzNXR1FVemF5UFZMc2orWEYw?=
 =?utf-8?B?VEY4VngzNlorT09aZHR1ZG1RRGs4VUpFVkpEMUd5K1o1K0xHZjVvVjZVZE0w?=
 =?utf-8?B?ekFHV2ZRelg4RmQ0VVNhMmFqM09CdUozdjVwY29zZVBMTmc3QVdIajVCYzg5?=
 =?utf-8?B?VnRQcWlTaE9Ya2pDdkc2TFY4ZDAxY3Nlb1U4K2prMmFQR3RCd0hBa2tqOWlp?=
 =?utf-8?B?dEkySnRMN09RaDZIV2Q5VUZnbUQ1MW5WRHV1aU9lS1o3cmF3cHhRc25ZbXdy?=
 =?utf-8?B?VHhlNkhJdGtKU3R5L0I5WjE5VmlpZTVtWk04aUxiSXlpcEpJNGJtZ0c5SDJU?=
 =?utf-8?B?QU96TUtLaWVETDRRSnZMNVkxZ2wvQ3RBc05HVnhJdVdGZWgyTW16QjdGeXhZ?=
 =?utf-8?B?SUZoT2JMMnlGenBhejg2QVYwTzlsV01jaTkvVTNNdTBZL0QxZHdzMUdFSmNp?=
 =?utf-8?B?TzhraUxtZjFtb1JzSGpnM3grLzc4eitFa1Qram80MmZlbkRDcS9aUEp5bjJo?=
 =?utf-8?B?ZC9uN3RVVFl6YjVIa3dKL3ZCK2F4d294ckZoY1VXM3dqaVpKd1F3SFUxY3lQ?=
 =?utf-8?B?UzU0SmxhMVRxdURCcjRDYkVZSjBQMkNSaXRodlFuOE5OR0o1UXppK0ZtUElz?=
 =?utf-8?B?RnJwZE8vejRTaHlhMUszQzJIRm1EQllHVStvekVONUg4WW5oVjFSUVB2d3JV?=
 =?utf-8?B?L0dITlJrdkFZSEFESCtoL09EM0FYSUNnRzZjUlNpZ1NhQ1o5a0VDN3J3V3h2?=
 =?utf-8?B?SGtwUHRhOWlZb0g5S083WVVpMmJGZWRvazczS2dUYm5YK09KS045UXhleGV6?=
 =?utf-8?B?SEhTZksxT0Ryc0VCRU9uWjQ5MXJYTkVwWHZ4L2JsTk9ZblZRaHZhc1hqTldq?=
 =?utf-8?B?a3U2TWdCVmRrTTZybUZTS3BSdnpKQTJZVGFWL2MreDFOQyt5c2hoakg5a01M?=
 =?utf-8?B?R0NjUzJYOC8zRk0veWpoZlhYVFlIL2VkOGFHMEtOMGhoN0ovTlhHZGxwb2lI?=
 =?utf-8?B?SFR0d29kVVpuWGxMdmxlODlxSkIvZDdYNmJJWHRjYStQZEMxVmhWWGN0REJC?=
 =?utf-8?B?emF6eGcrd1lsaTZHekdjcVgxNVB1NWMrSmp1NTlXZVBLaVhDd0Q4VDNGUkk4?=
 =?utf-8?B?UUVtT3hDQ04wUENySGpmUWI1bDFSbnd1d1g5dHB3Z1piSVlVb21BVnJWVHVR?=
 =?utf-8?B?YlBvNVd0RjVJbXkxbW9DSVFSekNwYlNaT0o1MjhLZ1I2ZTNCdjduN0JDcHpy?=
 =?utf-8?B?NTNwNTk5dVVhalA2aytpZGt4UERBRVpGaXR1aUNDVVZzeW1DN1Q1L2huR0xQ?=
 =?utf-8?B?Yk1PZmtldTBTYVc5alB6a3NUWkpzaFJmR0xWM2x4WFZKa1lndWNOOFNCUHB1?=
 =?utf-8?B?WGJqR2NzV3VMcmkvWUQ2SzRBUVBZRUJUNTNrbmovQVoyUFBDVzgyc2pSRjRK?=
 =?utf-8?B?ZkFxcjdwYUprcmplY0JsVmJ4bjBGa0NFcm44WSsyUlF1U1FkT0h1WVJrcVF5?=
 =?utf-8?B?SE5jUHpGb2FDUFdsZnkzeVUrRlJlcmNkeFpKOS9KNEhhM3BEREJsK2FicHpn?=
 =?utf-8?Q?RI60PH+QFAMxnhtLtPPRfUseN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wmwAOwjfk7mS5vkyFMna+ysacGUTMzF4cWT1GsKZOpuw9WtBS0iRFsPHY5yMx3hy/HMylXM1vza8gPXzq5UtxBGqxlQbB9AiHtI9uAGjKwJq8SLuNeYJxcpXg6fflZcHolnWsZVFKt43IQAhUuS1zQsbQqeQyIOVGxMQFLop7Nm21ZrwsTukb4C6dl+n3QtLMQ/LpI6au0BgNwfNkJHQWgbEbBClbb+xG3QeD7pR0zD3/iIDcQhUBFBLUf+P3FOQhQx3z13relKm0YuxB4MW6NL1S8j9btgzTXZrKmRWWaA0aUIRgPVIJOzfZMAqTpYM0TlhBBLbHuDOp1yhB0HhRXK/C6gtvnVKBkE0sS9ZiN2lWKV0X/+UnzY+uUx+DNyN7WxW1KcT5XhKbqmAizmWkb2P6j6dN/aQCpUhIqu9Xwrt0Wxr7axzYCCl+Fz3QF4bOWMwGNNKmtQD4/FWPQ1hy2dO1KI1LdpOT+vexVRPyAaSTpWnFxsHsPPk9C1X0Znqvrt3Ms4D9wbm2nJHQINi6PlbHBgcYq9KNCyM43qpG3iFYH2oKYVzupIKDJufwl9k/i9mal3kM9QQn+iv0Ud34dgNyswKnY/g6Ic0ZXMZCh9mwL95JwPv6w5n93YMm2C/j3pG2DA6/rgs9f9XmrxT1r7wYTYtRX7y8zXW8uO28OM3Lmsry3Elm8VJqpRyx0Cj9DXNlx9q6b5syxLwcDur2ryZVqlIReDZQW27jYQkKRtOs7PCFqXsoog0k436hVCOovPyyKKwJRGk3Nv+5di/e4+wx65OTObTdUrXfGjaIgGW9PZHqOfS4j7b/7GpmxFo8XTEkjK1kfufByFRdmBt5Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a4cc9e-0823-4a93-3fae-08dad2239bbb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 16:06:00.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ESWk5NzCyuCp8AHAYO/1Bb/IQoYHsOJDeYIjzdJPVqeupjnEgNdADqzsv86Znf/SVA/CjlAMWhOQmxxy1fnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6524

On Tue, Nov 29, 2022 at 03:46:30PM +0100, Jan Beulich wrote:
> Four of them are used in apic.c only and hence better wouldn't be
> exposed to other CUs. To avoid the need for forward declarations, move
> apic_intr_init() past the four handlers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

A nit below.

> 
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -127,21 +127,6 @@ void ack_bad_irq(unsigned int irq)
>          ack_APIC_irq();
>  }
>  
> -void __init apic_intr_init(void)
> -{
> -    smp_intr_init();
> -
> -    /* self generated IPI for local APIC timer */
> -    set_direct_apic_vector(LOCAL_TIMER_VECTOR, apic_timer_interrupt);
> -
> -    /* IPI vectors for APIC spurious and error interrupts */
> -    set_direct_apic_vector(SPURIOUS_APIC_VECTOR, spurious_interrupt);
> -    set_direct_apic_vector(ERROR_APIC_VECTOR, error_interrupt);
> -
> -    /* Performance Counters Interrupt */
> -    set_direct_apic_vector(PMU_APIC_VECTOR, pmu_apic_interrupt);
> -}
> -
>  /* Using APIC to generate smp_local_timer_interrupt? */
>  static bool __read_mostly using_apic_timer;
>  
> @@ -1363,7 +1348,7 @@ int reprogram_timer(s_time_t timeout)
>      return apic_tmict || !timeout;
>  }
>  
> -void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
> +static void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)

Given that the function is now not exported out of apic.c, wouldn't it
be better to drop the apic_ prefix?

The same would likely apply to pmu_apic_interrupt() then.

Thanks, Roger.

