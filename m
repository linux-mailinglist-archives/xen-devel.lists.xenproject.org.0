Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B5753F7B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 18:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563703.881119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLIu-0003p8-FM; Fri, 14 Jul 2023 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563703.881119; Fri, 14 Jul 2023 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKLIu-0003mV-Au; Fri, 14 Jul 2023 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 563703;
 Fri, 14 Jul 2023 16:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dmA=DA=citrix.com=prvs=552b8e743=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qKLIt-0003P4-N4
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 16:05:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f2e729-2260-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 18:05:57 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2023 12:05:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6438.namprd03.prod.outlook.com (2603:10b6:a03:396::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 16:05:48 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::e14d:fb6d:9e52:1524%4]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 16:05:48 +0000
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
X-Inumbo-ID: 50f2e729-2260-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689350757;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PoQ8cEOjWjcX9C/zqqTIDxpiW2o4BpROzTf2IY5cQSU=;
  b=K+1nxn9X7WjkexvQHLtYPAeT0cw99I8oHcpQCM6SqP36ciiIlClSqSdK
   1zMvCv5lseuzopDGM5eL/hg1eyYQPuXdZQxaFtsmOl78foGdKhB3rkBcr
   EtDofRA6AuNt+agQsKikHzEmC9vzCtXxFtlZ73hjlCazbRuGkAuK+peZs
   A=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 115550706
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:87ClVqmJ3nHThk4x5uopxEPo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXGHTMqrYYjOgKY8naYy/9UsBvZGBytFqSFdr+HwyESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5QOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c4mCDlOVT6pvd2V7J3lUdFXuZ4+b9a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iea8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqmBd9KS+XmnhJsqAXPwks2LRoZb2GQrtuWuw2yVulwc
 1NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4J5oflqYRq1xbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:SZiS7606G7dVVCD2XHSLeAqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AB+1Oe2mDR3cyIRiKNCmsZWB0uVDXOU/j7H6TGGG?=
 =?us-ascii?q?SM1lKZJLLUmerx/l50NU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AsWUbnw5IONkFHBzk04O5BvExxowwv6CJLWUKnq8?=
 =?us-ascii?q?8kMamGh0zNzqmo2yoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="115550706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6fpsVqo8N+6HEZS/dQ6Cy6P/Ig6NeHiyH1UleLLeeRdDmZ6oO2vnSr9mvOnTSwiLXnlo0KLnxuwW9cW5ytMG2MR8tie0eY4Urx4zMNa0C9OrPReAO23cOUUuJiIYM5csYm6BNyXvsq3d3EoQlkmywkWsuKyz4vrCYFJ8qz9oYQvN8gG06d711Yz4oYwHgHHOchmeCM8HMWkcdzJZDSwotMTT+xLKPm8jouLTYB9NPJ6lAVilzaBdjJAVu73DMJsKJu0mEX7Vym/wYb8OpDyAX1oHi7ZJSLu+ZIVNsY39LUSdPe53BeCO/M8MOfh7BHZd5b/Uslrip8bC3owzzITOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twUQE7mTHxFLPlFtAgbZTzifOVeNNyhHf9eIklb82fo=;
 b=RBESy6eXNRp6baRBV68kWq6iM/JyQwPSqMAPo5yMz85kOjuRiCGjOWUdw3p7SQu8XFg0X0sXGGv/uM3fT8OQNRKzo7UyxKLh2kTgPgQQS0fzeY4pcq14ahOnJCuEEJzIFfmkOiwOnx9SrrMGmrHNpdLtSBL7lcaFDrwnLKfTB025tZY7LjGiCE1rXupiNhxQjvOCmtnh+BtYMS73A3bzNP29izaYH63onOLDFGNl/4QCvC2NBDZKWFxHUyJufZwJaJTHzasaZQUDy7QtomgQicm2cnkPAdcHX1uj6Ajs0EU1yIc/IKxV6ncimw/9c4LZtI3ouVS7X/n3trXdZrhROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twUQE7mTHxFLPlFtAgbZTzifOVeNNyhHf9eIklb82fo=;
 b=hwW1ltOFLw5M0UtTCh9i0gm6DWSFF2XiJZCCuCYGxN51X68yNsENU2mirGo+f7kvcNDK/aCEu7NzyVHf7yDMJytZnr/VWIf2NbLpwCgCpucIchyoIYJm7XAswqpYpxkzTmUw4FdopTTdAOYBI4pMMcOrq6rZzSON58PtZmNfjLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Jul 2023 18:05:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Message-ID: <ZLFyVugKWItJklcu@MacBook-Air-de-Roger.local>
References: <ZKwZBQ_0Z2c7NJNL@MacBook-Air-de-Roger.local>
 <1f79491a-46f5-5293-e92f-0e2b0b3efb62@suse.com>
 <ZK1S1V71ZUIPjKqZ@MacBook-Air-de-Roger.local>
 <eb2e3b57-a423-cf52-0192-a344db33a58f@suse.com>
 <ZK6wcpHnh5OgHv4R@MacBook-Air-de-Roger.local>
 <d84482f4-8be6-e514-58a7-a529890c8feb@suse.com>
 <ZK7JwEhrB-70nlla@MacBook-Air-de-Roger.local>
 <6d0ed712-0807-33b6-1586-a0588086c3a7@suse.com>
 <ZK_gHltq-1se3fau@MacBook-Air-de-Roger.local>
 <c2de675d-b4cd-1040-efa2-1b8b90448d90@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2de675d-b4cd-1040-efa2-1b8b90448d90@suse.com>
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d52ee57-4ddb-407d-2089-08db8484300f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VViLyqFAEI8t4ZxuILGUHtdKF1QPf6FWUf5uXLeOfdTsBn6j9Hvyf24HF1Uf+SZGmv+btEgKEdYC+3Zt4WVdiBqB+KkBIL43UUNHffwEPG89dU2pVI/N8K03buAgnGlUgh8pwB8uDB1peENIv1zN76aPLEuzaPYCb5vcBpxvslpNkv6gmQxsxtOVVGQBhKA3TVpMd9ezb26v42u5NxJ/PoxoqoEzI86ZsL5NMP8K6fH3VvvST0/2WDZ99+8tHYqJUKc1uYPQccqs0xkg3EijT9LoVKTq3bGa38eW1cR/tm1JMU1/+bZc7pnpC2PQ6d15J1BnSJoZNKhXQi9EwrXqaIylO0f4q5Fnsv37gZ7/QsniIYIyFvgwyoBphBDr1QnovHuCl+niB7Q4asln1K4o2lKFrgj6plm0DlLCYLFA91TwFl/+4tQReC0kdQxGMimpgJ+payHoRiqQqhhws3t7Cg59BEacWZhjH7xRgaX/hwgKm8FKZwQUC2MkbILf3eyfp4f0qFvzNUKv09wtk/R3NRZRsOn4xGn+QWt9VWBumcBV8pQ/t+oVHb7RxDRl0QKB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(478600001)(6512007)(2906002)(53546011)(9686003)(4744005)(4326008)(41300700001)(66556008)(6916009)(316002)(5660300002)(66476007)(66946007)(8936002)(8676002)(6486002)(6666004)(54906003)(85182001)(6506007)(82960400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2E5NlNnSVh4L3BpN1dGRVlodURwWGs3VXFCMzNuMWd4bXg2TXl6V2xXVW1u?=
 =?utf-8?B?a2xwU1FZeWZIVWVaa0FvcTQzSm81d29YK1BuM2VDYnc1VzBNRGJaNmFQMWs5?=
 =?utf-8?B?WThHbGRNdGxIOU1MYjczODAvcnNKWVk3MC8xMFBhelc3T3lkdGNYMjRDSTRx?=
 =?utf-8?B?RklzVmxyVGdIcytWcnc1a2tSNEh0RlU4UFZMeFhxT1gxV2gveXFRR2xJa3l3?=
 =?utf-8?B?QXk1UmRkb1oyTWtLL2gvM1BJcjk5U3JiNVYvMkM2emh6MTFNSnVHOGZrZi9O?=
 =?utf-8?B?S2drL3RGelViQnVtamdKUXFZV2M5eGFqRmVndUFiVWkwVjNPWTdiNVRXRm5Z?=
 =?utf-8?B?aGhOYkZxdTVBeS9tTmpRN2ppdEF5WTJ4WDMzTWdBUkxHaW4xaUs4LzJxVXY4?=
 =?utf-8?B?Ykg3YXAzZVN6T1Y4SGJhSmtHanhDRVZnTTVpZWIvVnZESk9PYjMrRHFFRG1P?=
 =?utf-8?B?V3htM0Z6VmRDZWhaNUdUN3R5TERKeDNSdWl1bnlHU09JNE5uQkZDZ1ExUGZw?=
 =?utf-8?B?cUhPVmYrSWRkUDFXbmFGaDU2cVdmRE9HZWlaZUxiSExzWW1YN2lkYlB5RWMy?=
 =?utf-8?B?dXR2d0tuaitsREtvY3lHUVpMU3NYVUgxM0xlZVNZOTI3MnU5WllMMGhlY096?=
 =?utf-8?B?YUp0MXB0V0JKWlJhK2VtOFFBem56T2dqVkZMV3BCOFFkUDRudGduQlY1aUtB?=
 =?utf-8?B?OXEzODlwcmo2Qi8xQ1lQY2V5eGZ5RGc2dUR3bnE0RG9tL1B2aXBrMnkrOFBh?=
 =?utf-8?B?ekI0VElIRGVjYmtydkVXb1NJU0pXNzhTZi9xbGZrajRVUzlJOUFIUTU3cFkr?=
 =?utf-8?B?TWt6WjJkNU4yYUd6OEg5YjRvQVY3TDJSMm1tK3BsT2o4VHdaQ0gzdVdIV2c0?=
 =?utf-8?B?eENaaGNpNzdJQjJTVUhYSklnSDd5dU14WFkzRmNVcysreWdORHZSdEpwRG9y?=
 =?utf-8?B?WlM4TURlMWpGazhUZ0NzZXRNT2tYMk92Wng5aE1DR2tlcnVYTnN1bFpQWUlD?=
 =?utf-8?B?Q2xCWFRaOUwrOWR3YnJ3cHNFWGN1ZzFDYUN2RU1vbm1KOEJNUTlFZEpuZU55?=
 =?utf-8?B?MVRGaUZYakEzajl4M01MZ2NQZlZQZENGNVlBZTFQbnB6Q0M5OVhIQmh0VVcy?=
 =?utf-8?B?YlVuQUF1RE9zNjRlbS90NXljZmVnSmZkU25XaUxqVnVxQ1VIWUlzTi9Nc1lD?=
 =?utf-8?B?aDVZclA1SmJUenBCNVNReTlOdk9tNEhqVXlOdGxHT3ZicitTQkdOVENYYTR5?=
 =?utf-8?B?Tk9MeVUwVE13TU9NeXd3aUt3S2NxS3hYcmUvU0ZhbXdiVUZQTncwZDNFMmRn?=
 =?utf-8?B?dFl1WFkrQXJiYnhSQ0VvMTlUWWZUWDlUY3ZNc21qN2dCUjRCVnNtV1o5MVQr?=
 =?utf-8?B?OWNTazgwSkdJcEdod2wwZlE5VzlmN054QWFYdlRYWlhtRlorQVVGaE9SNWRQ?=
 =?utf-8?B?by9CVTdKQk1qR3FXdzZJNHd2NmM4UktYVkNSdVpXRGJCallCRjRndER1SnpK?=
 =?utf-8?B?NHkwV29qUk5XcXdCNFdCakI1VmRSQ0VvVG1VRDhwK045V2ZoWk5VdUpCZkRx?=
 =?utf-8?B?S1hqUys0RlVtSGM1RVA1U2dlQzRUU2dLOEJ1K1RwMXdXTW8wRzgyeHlqVFVF?=
 =?utf-8?B?MnNBSEkwK010Y25jTDAxYTFqQTY3cDRBN2VkT1g3Ymh5R3c2dWx1OWE1VStR?=
 =?utf-8?B?bFlYeVpVTVhEWHhucWp0VGpSdWJxWktQRW1pdlMxYW5HSmtLNldQTmhvSUQ3?=
 =?utf-8?B?NkRJTnZvL00yVm9uQjJNNmR1aWFJLytQSVFyWlBCNG94R3k5VWFCMVBuS0dR?=
 =?utf-8?B?cjdVMkJBZHpDMkp3QzRkZkNYVmZxRmZvTmVzZkZTT2RzUHV0YnNIZEZvZWRp?=
 =?utf-8?B?eExmWU82QWFZUURnT21yQlNmSkgreUsrbU5uK3RPanluc0lKdHZUUENhd3k4?=
 =?utf-8?B?V1RnSEU0UDdDV3VUVGFLSE02c0dVeVdDOXVFb2dKZkF0UjkvWFRwRnhaK0lr?=
 =?utf-8?B?Rk5EU0VOS3Y1b3d3ZWFrSkVrajFyRVpkR01jVXF1ZCs4bFpyMHFCQzNTUDl0?=
 =?utf-8?B?TUNmMzRtZTNjaVBLK2xkd3JETHh4UnBSNmI1UTNZQ2hyUWNFcGdEUWxWMS9S?=
 =?utf-8?B?aXRsZnB0YjNYYjA5YTdhZUJ0OCtrd2d0ZFNIeVlqdzRFdzNZOVl0bXVnRjhv?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pdpxlJTrsQhVAMClwziM6ZD9MQpKv0h+HnyOAbSei/16P1WXbuXj6ryGnfp1sSD4pHDGDb0aCowC/01kZ8bPXFVi/6M0kMQ1Dten/ezeYdeqJ26OuxHzZw0JcYIFUl0YKOvw0oQQwZbw8a3PT9zewVpPfMQ2vTjqx0+8O419FS2RzClTRTWzsoSrUvNhMbIkvQlpgDf3fj2knbzQb1feQjSoFi1PX68F1AhFRTipFP641viejvUvBcvBUoaX2cr+9E/MhK0E0B4yz/1ZAdYQOW2cw5aDi3MZuxtiPEVRYJWd4n/cbiT+SAy8/HpNmdbqeoe8UMKFcQrn4fUhKSv3SvJ+VD4TGftkXLW/MHUgxUVpovHcZ5f/eHjeZdMoq3O3Q2g3GK3rauyLupgtknY/HvLeuBnTKGa61pJg2Mtn19ZnHU6SL+zrCuDiIRmqv7PEGRXVUIxV7io/cUV+ph/4PQCnJnBMLqXnLb3IDhXh6l5R0/5Sy06uB3d4Y4cDUbCEP18g+ncWUJQIpW7f8iDNfZc9ac3RegkM5UC+ruWp6IV+vYIgmiaS+j01m7Pv85F346A5ZTjM5zOITNLX/zRCWnhwBLVBnqwIv9HMZVxt7bfoBFUWBTWSFoRwvHGnYrfhMyoN7Ilk2iP2qHWaFfLfCTcoDJ+STTTF9Vn1DG76MbdJqCJM9GEBeMk6718J9CM2wuBN7Rsql0q8dt0a7OwW6F2vJkjIrROkRaqH5b/sGwC+pKd9lysgduMPPqW2PdTzsEv3rnamw8EybQbIwmeUDgsbC3YZQBBVXaNtHwIaHsm6wbL2YJUjtvPj2o+n2phY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d52ee57-4ddb-407d-2089-08db8484300f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 16:05:48.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYBRKIcGtDSk5JEnQX0IwAyC/EL+a+F+YBmcPo6cvrghUYGx+k9XcaUsv890NLJD6xtEBkIAPUyIvhMHSD4ktQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6438

On Thu, Jul 13, 2023 at 02:18:29PM +0200, Jan Beulich wrote:
> On 13.07.2023 13:29, Roger Pau Monné wrote:
> > So to recap, I think we are in agreement that calling enable_IO_APIC()
> > just ahead of the call to setup_local_APIC() is the preferred
> > solution?
> 
> Well, yes and no. My preferred course of action for the issue at hand
> would be to convert RTE 0 to ExtInt (under the mentioned set of
> conditions). I agree though that we also want to move the masking of
> RTEs, and for that I further agree with the placement mentioned above.

So I hacked up a change to set pin 0 to ExtINT mode (and avoid doing
the masking early), and I got:

(XEN) spurious 8259A interrupt: IRQ7.

This was a single interrupt, but still I think the masking is the
critical part to get backported.

Thanks, Roger.

