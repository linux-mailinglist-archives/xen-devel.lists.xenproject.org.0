Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C257A43A1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 09:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603796.940872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi964-0001vk-6Z; Mon, 18 Sep 2023 07:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603796.940872; Mon, 18 Sep 2023 07:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi964-0001t5-2t; Mon, 18 Sep 2023 07:55:08 +0000
Received: by outflank-mailman (input) for mailman id 603796;
 Mon, 18 Sep 2023 07:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhQO=FC=citrix.com=prvs=618330109=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qi962-0001sx-FK
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 07:55:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaf184d6-55f8-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 09:55:02 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2023 03:54:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5863.namprd03.prod.outlook.com (2603:10b6:510:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 07:54:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 07:54:55 +0000
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
X-Inumbo-ID: aaf184d6-55f8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695023702;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fpMNtH3WEYNopq8vpldt45VODEcee++Ej3Vyp7QxlUw=;
  b=KHXh2ObYPr7nLRxXcpAxRnVUc6g7gPQPDEYT19siXQeKN/nKFVbENFG5
   hAhgMyXtQs9E+jP1kyMGSmcownP1L7kB2EicqW36THhdDoTQNAxGRAQlw
   3lyZXU3SMMTCLNqs5nGDztRwtYGWhpFQFKUvuyJif5XP4kqgZAUGyKg22
   M=;
X-CSE-ConnectionGUID: luzUzE+VRz+dAKZkXB8xbA==
X-CSE-MsgGUID: nNJgEe7qSLaE/Ym7emG8/Q==
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 122954346
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XGYM/63eH7KyppPbn/bD5Qhwkn2cJEfYwER7XKvMYLTBsI5bp2AOn
 2QXDWiDO62MamOheoglaoW+o04DusfRxtFkQAY/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBXxcy
 O41aw43fFOPrsGEw4KRGvlmr5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFUZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LWewH+gBNx6+LuQ8NhIj3CemXUoLBQ7Emq+/vS8pR75YocKQ
 6AT0m90xUQoz2SpU938UhuQsHOC+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrCiZmtLm9QHeU5LCS6zi1PEA9L2UPeCsFRgst+MT4rcc4iRenZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/7q/1UDKhXSrvJehc+IuzgDeX2bg5AUmYoegPtSs8QKCta8GK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:a9SrYq5QNI68QV0XfAPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDjex3hHO9OgbX5VI3KNGOKhILCFuBfBOXZsl/dMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AUWNZMmkuE7gkTT1fKGC0MtpJluvXOXnA3krCDgy?=
 =?us-ascii?q?GM3QqRJS2e1yg0vN0meM7zg=3D=3D?=
X-Talos-MUID: 9a23:7daxGAV71r+GvyXq/DnKpj5POZhx2ICnJQc8lMoLvubUchUlbg==
X-IronPort-AV: E=Sophos;i="6.02,156,1688443200"; 
   d="scan'208";a="122954346"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAE2yU4qhr9R1M7WCTBC2Q+bR1/GM4MbSj6YKDKArMGXycQaO1vkHeSmsVqQXcwGDhEtQsWbxCy+Afan8pRhQqVKfk83iEGkFWXDa5w8XLNN9NcpzjLapB7G1oRd2uA9WugRFJZeCSMT/7yLBJMk3L1hC8yLG3W7zpZvTz3SmZ5TaGXyl0VYpMxCUnvunvpuePyjqhgaWYrAogbwQrxna0Rvdv6SXAajloo8upI60PbkgO4/8TwK4XHdBeciQiPv1371wgV4ByAX0bfC2VRnHwYpfZvGHWtYjbBDjKtPxKU5ORY1zn6IFiBJW/opAySb0qoW/wsqLTduTf94VZKYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko0JUAe08HddhzexIKzcPDRIpATwf0Fys2twc6WtFbA=;
 b=B+8EYOCKa9On7D3lNeUhj5hRtfff5guzJZ9F/JVk16XBHnwSqcRcFoAqL3vYkDI8R+k7Gsdcu7MFZ1IZeOnrzZ8iXHQK5UnpJ8gzBO5eYLRCLZZHH3+gBp3pU21CbtpbiKFUzNF3SHqMHOalyJeVy3jjROPTmAQ5LhEhDFNn0O366fvqGVaJRgFJlkJI5ozZ22AGnlgoc0lINDH1TxaYDYD3DYUVr8zg6DuAwDUAb6PfKQn44m45nrSXF/zIDOI2pXKD8Xy80g25MB6GC2xu9v3AByi3Pgfog8V51YakhBxHH9mPGioMi1XDxaQxLurT6HCNKhFoELbiWJO8X9VJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko0JUAe08HddhzexIKzcPDRIpATwf0Fys2twc6WtFbA=;
 b=de2F8E5a8R9lAt3fllKHGR8CFrVoozfOe/9N5yUq28GzDmmkxJh2wW3+NV2ljjK2Mr2ynsv2usCoYHl4wl2JzkUjUDJkYjVvrrPGscRvhhWpYJSBpbAvAQeBXwUW8CELd51ahcJW8jzSsC6WGft4uoUo/sEtveQQkImEDCchf0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 18 Sep 2023 09:54:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Message-ID: <ZQgCSKGRZ99YgtSq@MacBookPdeRoger>
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
 <ZQRiL0Mf5_5EC8oj@MacBook-MacBook-Pro-de-Roger.local>
 <1b85b1fc-72b7-4ed7-9236-3d82671ca44e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b85b1fc-72b7-4ed7-9236-3d82671ca44e@xen.org>
X-ClientProxiedBy: PR3P189CA0026.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::31) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd00bec-0f35-4784-ca40-08dbb81c8c2a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ybAZtOA0PSQi5sGfK2gAsGbw0z+wL3hEcugdj3tZuVUj4UPnS3JOscDhSfDWI0I4gRUsEV85lldaDDbquwZ33BfFuP++VyXwDD4vhZTBun9/0wcTUzy2mXSZs0L6RfsVLoa5ofPbeBSOG6QF6qFTastIDGDn4PAUxFgKQIkpYxTX9TD9fO0oZleDqL3ixRqwfQgOJDdRAKFHPpK6NjUVXaeffaofpoPSeCbV8VLZT6t9CEht8bHGCB0ccxjBIHz5OioDv2QsVubwHwkhr4VRRDA9S+kLdZad2lBbRtwSs8b0PK+V/GCd6/+7anoA43CG21OGjyQeH7LfLzjCJJJeofZGU2w5a9BwkM6xKolXk2kpCQvsNwlynh9kP3IuYRDTeXdMXgs6jtYDqcpyLDtz0VSXbW84kPGIP+2xvScESshjuRAekmZqeR/kraFnt79FbYSuRRJpBlvYbqTauNeqYWuv3HgTe6Sa9WciU1BsBtnOgnuBpdq0E76C7kKZFlcladBewgQ+BJN2CJq1eTb7k1DIFn7+dS9SLPW7MXzBRtSSOIS5oMqvL+59O7ZxbFO0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(39860400002)(366004)(396003)(346002)(1800799009)(186009)(451199024)(4326008)(2906002)(8936002)(8676002)(6666004)(26005)(478600001)(41300700001)(5660300002)(66946007)(66476007)(66556008)(6486002)(54906003)(6506007)(83380400001)(6916009)(316002)(38100700002)(82960400001)(85182001)(53546011)(86362001)(6512007)(9686003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVNtUEUvWGVwc3JiVGExMDkxNFdDM3BSSFNVaWdmeEFFekcybldTYTVrWkFl?=
 =?utf-8?B?R1l5dGVsUFI1UXBXWFJlWkMrT29xakRlckpWZEtaVXZGRG5PMURqL2ZSOUs3?=
 =?utf-8?B?UGJkWWdibWpBbVhCalJScWh1WmtLZjNjcUtaemsyMXZXOHRhUzJYRXJBbFFU?=
 =?utf-8?B?QnNaZGFjejR5M1ZCby84WWVqay9nYmZhV0FPditCREdTUzdaQml4R2d4ZThD?=
 =?utf-8?B?N2l0ZnBUN3JvMTZ6T0ZZenk2SHpyOUZSbXRkaTFVOXJ6bGo4SFlIZGszWGU2?=
 =?utf-8?B?ajNrZFh0ejRCL045c2k1VEtWTXlIVmJmcGpjS0xqSDdENWtkNUlUQlVjUFd4?=
 =?utf-8?B?ak0rNHhSKzlsTk5pa3Z0ckd6eEhRYzF2MVVTam1Ya0R6U0FSelNpRTlwbVQw?=
 =?utf-8?B?WmpZYXhKc0g5aWJkOTVxcExnYXZvODZQbTRJSnQ5djJWMnBUNVRDenNSUFcv?=
 =?utf-8?B?MndQbHZIZU1Lc2FoZUptWUYzT20wMVdyQzR2eWxzaU8yb3o2dk9vbXgwMFNX?=
 =?utf-8?B?NDZydTNGcCtraFBIUnlRNU4vL3FMTThsV1NtRmlsUUF2ZFJIV3lpTm4rKzRM?=
 =?utf-8?B?Ky94UEF6Y0xsN25NWS8wMDM4WjJ6MkVmb2xaUmZIMllrTnN1Z1hNQkNGNEZr?=
 =?utf-8?B?SU1URWZzZDNkZ2VGclhkTDR1YklCd29hSUJHNjZQRTdpUUxiY0kyQUtXUzBi?=
 =?utf-8?B?REl6anRUTzVtRmlWcmRuRFNwM1RNbzRkcHdDTXNMVnFsZzlMdUwwRERIeEFD?=
 =?utf-8?B?NktraGFGK3lmRWl6a2tJZGZlU2VzRTUvdXEvMFY3NWtQeFJxRU1zVFk5UlZI?=
 =?utf-8?B?TmdqcDB5ZHlkQ2NHODI4L3BtVU41YmhGSkF5cVdiK0xERmIzbUZ0SGhXM01E?=
 =?utf-8?B?RTN3c0JXZWdXQ0tLeGY0Wi9YZGowY21lVFBycW5Rb0NDZDBsOEE2QWkzMmpM?=
 =?utf-8?B?UWl6S0ZUWUhpVXhYZDFUYy9jMWt3VjloaENiMVFBaHBsWU9WRUJoNk5XUXNE?=
 =?utf-8?B?cTNrZUpDNEZLNlBDMUFpOWR4cnJMaUwzMHJFUEIvZzZFbjdnK2ZobnE5Rnd6?=
 =?utf-8?B?ckREbVh4WXV4QzBmRFU3dE1nckN2akRpdnZtMzFSNmwrbFNaSVVVK0t2SjFK?=
 =?utf-8?B?RWt3MnVzMExJYlVWVlNQeXVvMFVVRjdoNzdzQkdYMTIvZ2ZrMmIzSFA4T282?=
 =?utf-8?B?cndlNVg5QmNCZDl1SjBET0pKZU9rN2djRjZ4RUVFbi9DQmVHaGRGZGc0dzVz?=
 =?utf-8?B?QzRrMnZWUHFKUFUwTS85Um9wMjN3Vk05cDBaUzA1Y09HYkRWUmVEQmtUMXBH?=
 =?utf-8?B?UkNrbUFYUVRFNHRSeGNZejU1SDh3UC9RdHk1WUxuOWtUbkpnL3FSYXk2TjZI?=
 =?utf-8?B?OTcwdXFtZlFaOGtoQjllL3ZyQmEva3UzOVB1V29mazVpcmJQbnJxU3o0QmRo?=
 =?utf-8?B?K2JSbDE5b1ZYUWxybkszRnp1dDN4QlZEYUwxZ3d2cUFEOXlnZGh4d0M3NEc5?=
 =?utf-8?B?L2hpK0hBbzJoY2FpOWQwa0NYWm93VGpSY2hZZ2xZSkFkS1g1T1RNYS8rM1Vz?=
 =?utf-8?B?K0JITlFoSkFaMmtTODA4VnRlKzBLakJaZnVkU2pMT3Y0L20vaDVVVWpNSFpI?=
 =?utf-8?B?amdBeWFZOW84YTJnWVJqS2pDYU5lWGpFYndJV3JYa0VITDYyWDJlS0FtM1ZC?=
 =?utf-8?B?U0t0dU1vT0NsOFdhZnUrVjNWMUMzcEh6aSthN1N5R2tTYXozaU84QXRWZGRO?=
 =?utf-8?B?UGtMVkZxQnNOYXVYdXlzSHM1SWNKSENXb0RqQlMrM05naHk2Yitmd1p3bVpl?=
 =?utf-8?B?K1BpeHRXUHB6N3ptM09STFJYZktTdi9pOVAyZnM5cXZOV2lCZ3pZcXVoS293?=
 =?utf-8?B?cFFlMTZVRUYrd3NTeU5iakVvSWUyYmdaekV5ZnRQRk9ZVXFBMUc0NFI4UG1H?=
 =?utf-8?B?NFdBalZwcnpuV2pVM1BvL2NYbGVnTmxuTXBkTE96dVpjaE02MHlTMUlmZXY0?=
 =?utf-8?B?YWc1TGF3ME15Z0tlMko1NmFZVzRjcDFGWno3bzUyYXBFNHQveWRsOE5BVHU3?=
 =?utf-8?B?UjVsdnFmdENxMm0xYkVUNkMvZFE1QktzM2hzb1o2R3paUmRhR09oWlpzdXUv?=
 =?utf-8?Q?I0qEpDPV1vtXxh/GtSLK2t4u9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FEzpQKuRtjjcnhUN2ZdmPu3/s6q5kpEGP/A3lgEKuTwQJBSL4KtCjAlsfiL6ZnD/jbEBTqCstnbwEFq4HvzvEsK58Esr2M13g2Tdd+zrWAkYySD10Q56SaqXrnwIoI2hW4qHGfSU2fkL3ubtnsRAjt2fMBMni0fBpmrMZ41Mb0YKmzpfeEumza/jcXIcopenTAyn5y1PdTnQ5YQhbqKXs76Yyj5CLSL973WfASa67vWaJRmjhGo7bzz84DZjN7VTYDNi3mIsfcEWJDxfMrhTsPFNslBMZfU+3ZwhghL1rpyNanYzzb5sr7RJNKAQ6YyI9GM7n+pL0jTg3gqu7QiHW9xUyFUyEuGQBIolh7EimCFKYQjDQxQgOHeLvADDIgZscVZT3DAbKXdBzrOsEfuCan/UiopLVMwEa83YymK3ZlzsFmaZjjn0o2FdCDSwZ3IbCRWKqb2giuCPws0btKr0nVbq3zo/T2A+5j2YsuE4kCsjPare7QgufZB0nQrhZUzcvhmfrDJewBioa5F4otE1zl3LZHllkF14Q1XNiBYaLtUpDWfs/TGPIO3TggffU/XcZGJTLOb3c9qquanAyHOIXqz/Qp9RJV5jzTSAk9T2Xd3s+xUmhPp24oR8VZYEE+DMPJYedTABHwI2k8lL8DYjA8noM1tvSKjGaJYeCTd3eXqyA4vtdklDIQZ2F4nAdamzTohBesyozKaclh5upl99CQTvDEpLVmRzfgbBPdmB7C62Ao3Bnp9vW1/HJp1BF2vvGpFVbVUATLxeBMSJrWgvW88DSvoop5j0pTwjPMQMK8SBvmGv/e56fKY7CcF2qMppy1oMPwKaUtWzByX3zxTYSNLvWfuZyM9U4YTPiJneDs3RsiIpJOv/Q1zINsub2805
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd00bec-0f35-4784-ca40-08dbb81c8c2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 07:54:55.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU0o9xifIngtBSWq1ZxTX7sDNYTcfapyMzdvOZDnkK+WFOY7M5ubr0F14DJeZzY9ufKtHDVjxhqrZkdNgzxiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5863

On Fri, Sep 15, 2023 at 03:27:40PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 15/09/2023 14:54, Roger Pau Monné wrote:
> > On Fri, Aug 18, 2023 at 02:44:40PM +0100, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Currently, Xen will spend ~100ms to check if the timer works. If the
> > > Admin knows their platform have a working timer, then it would be
> > > handy to be able to bypass the check.
> > 
> > I'm of the opinion that the current code is at least dubious.
> > 
> > Specifically attempts to test the PIT timer, even when the hypervisor
> > might be using a different timer.  At which point it mostly attempts
> > to test that the interrupt routing from the PIT (or it's replacement)
> > is correct, and that Xen can receive such interrupts.
> > 
> > We go to great lengths in order to attempt to please this piece of
> > code, even when no PIT is available, at which point we switch the HPET
> > to legacy replacement mode in order to satisfy the checks.
> > 
> > I think the current code is not useful, and I would be fine if it was
> > just removed.
> 
> I am afraid I don't know enough the code to be able to say if it can be
> removed.
> 
> I also have no idea how common are such platforms nowadays (I suspect it is
> rather small). Which I why I went with a command line option.

It was more of a grumble rather than a request for you to remove the
code.  I've been meaning to look into this myself for some time, as we
just keep accumulating bodges in order to keep the test happy.

We don't seem to perform such tests for any other interrupt sources
that Xen uses (or timer), so I find it kind of odd.  I guess at one
point the PIT was always used, and hence it was relevant to test for
it unconditionally, but that's not the case anymore.

> 
> > 
> > > 
> > > Introduce a command line option 'no_timer_check' (the name is
> > > matching the Linux parameter) for this purpose.
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > ---
> > >   docs/misc/xen-command-line.pandoc |  7 +++++++
> > >   xen/arch/x86/io_apic.c            | 11 +++++++++++
> > >   2 files changed, 18 insertions(+)
> > > 
> > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > > index 4872b9098e83..1f9d3106383f 100644
> > > --- a/docs/misc/xen-command-line.pandoc
> > > +++ b/docs/misc/xen-command-line.pandoc
> > > @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
> > >   ### nr_irqs (x86)
> > >   > `= <integer>`
> > > +### no_timer_works (x86)
> > 
> > I find the naming confusing, and I would rather avoid negative named
> > booleans.
> > 
> > Maybe it should be `check_pit_intr` and default to enabled for the
> > time being?
> Jan suggested to use timer-irq-works. Would you be happy with the name?

Hm, pit_irq_works might be better IMO, but I could live with
timer_irq_works (with either _ or -).

> > Note that if you don't want to run the test in timer_irq_works() you
> > can possibly avoid the code in preinit_pit(), as there no need to
> > setup channel 0 in periodic mode then.
> 
> The channel also seems to be used as a fallback method for calibrating the
> APIC (see calibrate_APIC_clock()). AFAICT, the fallback method should only
> be used when the PIT is enabled.

Yes, I see.  I think most systems from the last decade will have TSC
deadline timer support, and hence don't engage in the calibration.  We
should see about switching the calibration to use the selected timer,
instead of forcing the usage of the PIT.

> I think it would still be feasible to avoid running the IRQ tests even when
> PIT is used. So it means, we cannot skip preinit_pit().

Yeah, so we seem to have a couple of usages of the Channel 0 counter
that don't rely on the interrupt at all.

> As a side note, I noticed that preinit_pit() is called during resume. But I
> can't find any use of channel 0 after boot. So maybe the call could be
> removed?

See _disable_pit_irq(), there's a relation between the PIT and
cpuidle.

Thanks, Roger.

