Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5595FEA38
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422537.668625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFnd-0001vj-74; Fri, 14 Oct 2022 08:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422537.668625; Fri, 14 Oct 2022 08:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojFnd-0001tD-45; Fri, 14 Oct 2022 08:12:09 +0000
Received: by outflank-mailman (input) for mailman id 422537;
 Fri, 14 Oct 2022 08:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaRP=2P=citrix.com=prvs=27923c854=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ojFnb-0001oX-Py
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:12:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e36d0237-4b97-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 10:12:06 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 04:12:01 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6651.namprd03.prod.outlook.com (2603:10b6:303:12e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 08:11:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 08:11:58 +0000
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
X-Inumbo-ID: e36d0237-4b97-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665735126;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wp+bJSByGOYteHx1kJI2WdCm+Wu/paW8z/MiEQKBehM=;
  b=fxm4MT5EDNWJBHzozQGTs4/2+HGQSw2I2uiBlO+5sYy57EO0Vkli0XRa
   HXf1sOE45FnTqc2Q76jDOxshRBfJ62xaX8z4/i4T8svP8VoTIPSG++vnI
   u6F2Ojgz50qC+VTnb0Xa6o3SSbFTF2UL2bJqj6q3hvUaH7jaavSQK0+r8
   M=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 82358081
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iszwiK+4AIXYgDgEzFXZDrUDt3+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WNNXW6HM/aJYGT0f413aNnlp0wGupeAnYQyQVA+qS88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5wdmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ulVA0UW6
 PknESBTTiuahOapy7TrEeY506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toij327+XzXqTtIQ6CbiC6udWrE+vmGESIyEcUmGauqGjhRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4M+A88hDL9aPS7C6QHG1CRTlEAPQ5sOcmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImFbHviNTwQW302
 2rT8nh4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CNsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:k+A/HKA08qn8YjPlHelx55DYdb4zR+YMi2TDj3oBLiC8cqSj+P
 xG785rsyMc6QxhIk3I9urwW5VoLUmwyXcx2/h0AV7AZniahILLFvAB0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYeGIbsS+M2miF+rgbrOVvu5rY/Ns2h00dNT1CeuVq9AF8ChqeVkltSglKbKBJb6
 ah2g==
X-IronPort-AV: E=Sophos;i="5.95,182,1661832000"; 
   d="scan'208";a="82358081"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRbcfoioVDPhlfFkFi8/DO76m4kVQOp3qnsPIT5dtLl669BPyiOksCD7C8NfqwtLsSms4CxVVK74R6z1Yx9B55IjxGton9j15ZdSlckD8EOFhRzk7Tp95F5Hhq2Ll14pn9D2b9TUZ4gogc23LuhnN+rZVQsYmeFgC5durhj65WLvmKapczp6JgjJreaJC4QvIB9hLtbgf6M/Z/R1eY6FEqFQ1XfRr/u7ayLJ/msewDE0NyDuZqcGz0POEUbPjiCcUAdRD9RTiWaWQDyzlL0h5dzcJlYPAV1XSe8Mhg/ndsuZXA5Ejxu/bLKYxgaQ4qYQKvwa02thq2bwh1MkkUfx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqbzFO+otW8dxCElDI1uhSFmo9Hh56qrw56hNcVnSw8=;
 b=XkWRnfqVyJOboqlRsmkSqUm6nR9l6ALpZqx6V9UWjumS2LWQcuuYucJDzsxUf3g0Q0QaNGrlUqG3VEsnwan4+xNP5ST0YmwpApiGUJv5GiqNd07S4uTHXjz/NFDJ6fzU0eBQQO84aDUs40+hVR/Fdx8a0aEAbSYu/MP+RCNk0VvC0JpL8z50oSPYq7fKcSpKogg+YD2UBl2TFi31svFr4eUD8TcFAIam1or6apeBZDelwhLpkCaMxyAVdjPXYojetwof7cNXxN8TCMhAVIARoBLWB8EIIfIYbNaLtp64l5EBFrbiyV1LUEwVz8LtnaeY2xVW/eu7fdcBR2uorFH1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqbzFO+otW8dxCElDI1uhSFmo9Hh56qrw56hNcVnSw8=;
 b=YZFvMGbdp/ZI8yPmpS608t/Q3V+DrogyDnKM+HOKPdEi0QjCi7inlNDxMqOzbQGoKGfuXgpZyBsfEUPS/ToUeUcs6xj2vNiYu32IpV7UJ8lzQUFhkRVYI9t9oFbc08MyR+nfaAgXQR6qe//BjFXlzGx+ZiJvqUqJFzNIDzL/suM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Oct 2022 10:11:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/4] amd/virt_ssbd: add to max HVM policy when SSB_NO is
 available
Message-ID: <Y0kZyiPTnafzKv8l@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-5-roger.pau@citrix.com>
 <1f70c472-1b62-7c79-dc31-65fca8040cfa@suse.com>
 <Y0gbfCi5kp2qBxuv@Air-de-Roger>
 <bcb70302-cc88-0867-9920-2567dad96dce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcb70302-cc88-0867-9920-2567dad96dce@suse.com>
X-ClientProxiedBy: LNXP265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: afb17ae0-515b-43e2-b905-08daadbbc3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4J+eC+HQDaFez/PS1rdgW+Y69536hBWPvYX9ba+aQ/u6nXK3JeoCM0zT7y4nN5bEGL7Y7cZlpvh0KIeoy98ot7zf/+lpQUuDvLRhyw9RZua/jWjT2DQz/IBDhcYG5GMCpWTyvqKw63b08pVRh966SUSyuKntZjNuQREON/ZcgDv8R7QbgNRVS0P8Ld3M1bwvsV7ufm0PJpFtV1VkOMiizioSAzPguQR21/5tc2NujYNDqxwNZqj8oWEn7CI9XQuu3jI3suzOeYuFh4TjKF2OZCZQJyg88S4k4KVIz9LrI3OUIQpwwzEf4K/LjLbrF8/SiVaH+pA8W9sKPNGhRMYVNkRhicVKHiB2JMgFG5NmOM6CkZ+j33SQS4dmODHXXwrSB03mwWstmI6f0lj8xXdURvCuJTH58lJOUqwe2ubZkeSVyD+qPmHY/2Fw4qu+XmCG/SzNcjeSt7Jap6fld9uqpANT6uFHo79TxI6N15HOw229m5zEFtni/p0r7tqV/YJTfmt6SFzZy/HExSkAdobtGYXAgfgOfar21/I37JqqE8mE997Ojb4MGrTmAcHw46axms/PdJgCn0+OV6YC3rwP39EoiOZ9Hcl43eisHQGfjgUqQ1r7kOACx5hUAowoA7KVCxz22rFRpWn7iMzaVHbMN8KRiWhAC1+I0NfXvrIFoWoFmuV4/v/a3KuVRGnVbyLrNCM7xih2oWDY+JCUOcz+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(5660300002)(186003)(2906002)(8936002)(41300700001)(53546011)(6506007)(26005)(6512007)(9686003)(33716001)(82960400001)(38100700002)(86362001)(83380400001)(85182001)(316002)(478600001)(6916009)(54906003)(6666004)(66556008)(8676002)(4326008)(66946007)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0phakhjdTNZT1JBSnIvcEpBbmxMNDJKdFNMU0JsZXNZUDgwRXROWXpuMWgx?=
 =?utf-8?B?bGFNVTl4UjNWWm9GTE82UTJPMHNCc0QyTWQwdkdIdG9Gc3BCS2gydlh3Vkkr?=
 =?utf-8?B?aVVCQW9yZFB4ZVJRK0ZFc3IvbndnUmZ2cWJmOFVxSE1YU3VQRFcvZDJrTXdi?=
 =?utf-8?B?Zm42Mlk2TjQ4VWhDK2tkbll1MnJlTjYzVTBmbWVTNkJPRU5OL1o1cjdwc1Vu?=
 =?utf-8?B?ZzVGbGpESVdxaUdrN2RkUFZha0MrRHhyVDlkalc1K1JCMkdFbFg3Um4wc0dT?=
 =?utf-8?B?eE9jWXZsUkRDOXNXdmhINkZvYm52ZVpmbWJzcnlBcmV3SmFCSW5BaTF6dnU1?=
 =?utf-8?B?YzdSZkNkQ3NoUXpPWHZrK1hXMmhtc0lkeHNNZW5MUjE2SVBQZEpFUkZKdktZ?=
 =?utf-8?B?WjAyOFFZYUMyTGRpZmFOVWFFdHhqQVJLZm1GOW12aC8xK29Dbzg0Lyt3MWJF?=
 =?utf-8?B?Qm9EaGlqeHpTb2pjTzNZQXM3ejZMcEtvT3RrTFgxWGFZcy80RzlBWGlnTThZ?=
 =?utf-8?B?bGFybnpkQk5YSVFxUk0wNU5JL041a2xaRXNVOFRpNXZtK2drVE54Mm9MU2FQ?=
 =?utf-8?B?UHB1Vmthd0V1UG1kdmxMTjIyT3J4QkRPQ282eU9ENXppb3d3VE16anVNWEYy?=
 =?utf-8?B?bzBzb0o5cEo0OXltOGM2enNSVG9hSW1BYWJDUVdtQXU3ZDJMQWs2VWJyMS9x?=
 =?utf-8?B?OEt6aWNHbHJEc1JPQkoxdTI1dGgzMC9IcXBQOGRzQ2FZQXplNCtzOEtqUUs3?=
 =?utf-8?B?OWxpcmVZYnpKVFJqakhZS0JhVm1vdmJKY2dmQVdsWjR0dnVNRGhDMkJDTXlT?=
 =?utf-8?B?d3k3TWYzSmc3czN4SDd1RTFaSGJXRXJsaVVjKzExbDdVRldkTWJLaFlhQTVX?=
 =?utf-8?B?cW1nSkRLK0lEWU8wU1ZaVWVweTQ2Vy94ZC9uNTBTM1d0QmNhQXhTY2hNczZ0?=
 =?utf-8?B?V3phbjVFcC9ZeVA3SUVtblNTd0pjRkM1b2FNc3BTbzNCT0oyVXpjR0NWWS9i?=
 =?utf-8?B?aHRteWlrYS9oQncwYWFCeUZJNkVhZHp5SkMxbkgwVXc4OUdNeTBMWWJ2VllD?=
 =?utf-8?B?K081S2lXL1dDK3BZcnppcXFCQ0UxZTVrZjZKbzc0aXl4eWhKZTlvVFZYQXFQ?=
 =?utf-8?B?UUlmSy9ENkF5VFRwVlNDTUwvSU9BYVN1Uk9qbVVKS254VlBVUDhpQ2xWZmVE?=
 =?utf-8?B?d2N1K3pNQnQzaHNCTWdLclhYcW50Y043SnNZTjZFOTJrcy8xbk90T3dIcVNl?=
 =?utf-8?B?aUp2cVMyNHJmNm1EczhKSFlMaGZjQ1NOQ2VhcUFhUFVyTTlsT2hTWk5ESmFB?=
 =?utf-8?B?S1lNejVVNHRBMitpWkZ4akNkQ25jYmZzVG52bDc2YkpNVU14K0dlOHB6bG5O?=
 =?utf-8?B?TWs2c3ZHQzRtdCsvUC9sOVIyZUdqR2IweEgxa2QxVWNjMCs2VGRtRm9BME9M?=
 =?utf-8?B?aWU1YVRBNnJaT1QrQmhoZnc2NDBvUUhvWTBhWjZlc2R1a3JiTzR2aFVDaVZk?=
 =?utf-8?B?a0pZaFJNYUREUGoyMDdnN3JNaUVleUt4VXhKaFg3ZGpHSnFPMlRQM09TeXdT?=
 =?utf-8?B?S2hZUW0vZzc4WFd6Y0ZrV2dDcE5ONVRxZ2p6RXFiWjU0SUtDaFQyNzd4b1Vk?=
 =?utf-8?B?bVc5TkljNkNoTjZIZlNQMzZLalc2OTg3Ni9RS2krL29hbTF0eGRMS3Zkb2Ex?=
 =?utf-8?B?Zkt1SEhXVnd5SFlDMDdrcUR3Z1NIa2NMZ1dIcnNPZkVnT1A0NDVGMWJWZFdZ?=
 =?utf-8?B?OEZtVnZiTnZDdHRFTEtPZG5HV1FnMFJ0VVFPUGIxUG5xclIrSVV6MFdCUUhl?=
 =?utf-8?B?NVNyVFFIWTZCY2g5dXZCbTMvaXhlVGxwcUt6aUJkbFBuTDBlM2tvQzc1YW1U?=
 =?utf-8?B?VUU1YVZuc3ExRXR1c0hMOFFmQ05CVkpTdzR6d25rdy9idnp2TDB2ZU9HODdh?=
 =?utf-8?B?Z1dwOEhBbE1OMjc0cTZubUl2RE9xS0NJZUNDVGgxN2w5THdvK05KM3l3WDA3?=
 =?utf-8?B?S21zREN3bW8zMURheTUvMk1hWGV0YUN0dCtSQ2hQclR1d1IzL25iM3UxVm52?=
 =?utf-8?B?MjhMQ3hvdkNMQzcwa2JXZlgxQWNNcTNBa29OTVM2cFNqTWZycFZXc0lVSHNs?=
 =?utf-8?B?QWdmaC9CbjNtTWRNSWZNbFBGN0FVcE81YThTYldrT3lxZ3BCSnRmelRVdW80?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb17ae0-515b-43e2-b905-08daadbbc3e1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:11:58.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl95H7IYH278nl8cYHtjv6+drlvH40hh5XicZUFOprB0hHhtJ+LWoopyftjGIPsvh+XlKOt8LtfY5JiFsdTkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6651

On Thu, Oct 13, 2022 at 04:43:15PM +0200, Jan Beulich wrote:
> On 13.10.2022 16:06, Roger Pau Monné wrote:
> > On Wed, Oct 12, 2022 at 10:36:57AM +0200, Jan Beulich wrote:
> >> On 11.10.2022 18:02, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/cpu/amd.c
> >>> +++ b/xen/arch/x86/cpu/amd.c
> >>> @@ -814,7 +814,9 @@ void amd_set_ssbd(bool enable)
> >>>  		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
> >>>  	else if ( amd_legacy_ssbd )
> >>>  		core_set_legacy_ssbd(enable);
> >>> -	else
> >>> +	else if ( cpu_has_ssb_no ) {
> >>
> >> Nit: While already an issue in patch 1, it is actually the combination
> >> of inner blanks and brace placement which made me spot the style issue
> >> here.
> > 
> > Oh, indeed, extra spaces.
> > 
> >>> +		/* Nothing to do. */
> >>
> >> How is the late placement here in line with ...
> >>
> >>> --- a/xen/arch/x86/cpuid.c
> >>> +++ b/xen/arch/x86/cpuid.c
> >>> @@ -558,11 +558,16 @@ static void __init calculate_hvm_max_policy(void)
> >>>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
> >>>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
> >>>      }
> >>> -    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
> >>> +    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) ||
> >>> +              boot_cpu_has(X86_FEATURE_SSB_NO) )
> >>>          /*
> >>>           * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
> >>>           * and implemented using the former. Expose in the max policy only as
> >>>           * the preference is for guests to use SPEC_CTRL.SSBD if available.
> >>> +         *
> >>> +         * Allow VIRT_SSBD in the max policy if SSB_NO is exposed for migration
> >>> +         * compatibility reasons.  If SSB_NO is present setting
> >>> +         * VIRT_SPEC_CTRL.SSBD is a no-op.
> >>>           */
> >>>          __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> >>
> >> ... this comment addition talking about "no-op"?
> > 
> > We need the empty `else if ...` body in order to avoid hitting the
> > ASSERT, but a guest setting VIRT_SPEC_CTRl.SSBD on a system that has
> > SSB_NO will not result in any setting being propagated to the
> > hardware.  I can make that clearer.
> 
> I guess my question was more towards: Shouldn't that check in
> amd_set_ssbd() move ahead?

Right, I assumed that cpu_has_ssb_no would be exclusive with any other
SSBD mechanism, but that doesn't need to be true.

> As an aside I notice you use cpu_has_ssb_no there but not here. I
> might guess this is because of the adjacent existing
> boot_cpu_has(), but it still strikes me as a little odd (as in:
> undue open-coding).

Indeed, the whole function uses boot_cpu_has() so it seemed clearer to
also use it for SSB_NO.

Thanks, Roger.

