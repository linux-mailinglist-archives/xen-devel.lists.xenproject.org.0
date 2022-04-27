Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C24511526
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314857.533113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfCw-00027f-J2; Wed, 27 Apr 2022 10:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314857.533113; Wed, 27 Apr 2022 10:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfCw-00024e-Fn; Wed, 27 Apr 2022 10:47:42 +0000
Received: by outflank-mailman (input) for mailman id 314857;
 Wed, 27 Apr 2022 10:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njfCv-00024Y-5s
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:47:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 744b84b8-c617-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 12:47:39 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:47:36 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3403.namprd03.prod.outlook.com (2603:10b6:4:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:47:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:47:35 +0000
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
X-Inumbo-ID: 744b84b8-c617-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651056459;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jUMIlGilCjPKdgN0Li3CPh0Zf4sGeK+N1M3b773spPQ=;
  b=cPTA7bSze5T221YAfSNWv5QUYwL7Tj3qXMSaav4vi9g+UcMBTnnmlArx
   PppDknO3jvO1u6300kbtPgRIczQDI3ADYgYs1qz6cfO61kUn3FXt4r58r
   z1+mMwf83w+V4FXu/A+ZkuYGoAg/ahO/ykxSi4sUcTxnfrjAcjb7MuapB
   s=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 69911451
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UdSpYamd0Ji+hsEmi9FeWB/o5gz1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWz+Abv2KN2bwet5xb4S3/EhXv5bdzYNhSlc4r3hhEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV3V4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYlwHYPzBnsokQQREAWJxDIpj/JmAPi3q2SCT5xWun3rE5dxLVBtzBqtBv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkEhl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2MJ+QvM+fdui4TV5FNXyLXgM9jTQcDJY8hKhUO7q
 jnZ42usV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/P5V+QAGEBFmRFcIZ+6JVwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:mY40faBRdgzysPLlHehKsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBEIzfeNnczaBhNBJI/Gp
 bZzs1bpwC4cXBSSsigHHEKU8XKutWOzfvdEFc7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+4B7B0G346YhQhbLau61+Lf3JrvJQBiTniw6uaogkc7qevAotqOXq01oumM
 mkmWZTA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69M9kWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jZiuLMlGfBsRLEkjQ1o+M9qJlO61GlnKp
 gkMCjk3ocbTbvABEqp/lWGw7SXLwcO91m9Mws/U/euokdrdUBCvjclLfMk7wk9HeoGOv95Ds
 T/Q9FVfeJ1P7srhZwUPpZxfeKHTkrwfDnrDEW+ZXzaKYBvAQO8l3ew2sR82N2X
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69911451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNCXDRJ94QlKXBC371x6IIINfAmsfqD9zwGmVQvwWO+LBAqIPMdIgwg32bYP/oekand++FuLWuTikjSaX4jr4gvodzxm4OIZNPOmw9L4HVx6p5u4vM7aVVWVhJEx3JKEj74bUux62p0TxqsfQwCxRHo7bJN08n5M8N64+h5hKDsiE52NhDU5mqpD1bfWDlbekfFKcHTm8zl0tGBV8HxQ8lh6pwrOOaGylrDVAPLtYBqGFAwWElqG0NCn053OS5Tfs3xya9/GYRHJ9cNWFlJBs/Bys6zzPhWBsfWCAnjJy/3Z3dFFXvIPGnRx0D7CS6oqmhISgZ4x5nmMKLupgWnBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUWhJgu0Yz9j8XsfOkeyy6+r8LNCGTJ8eRrnaODXvM4=;
 b=c/jtEPESyU2Q6WNvleloo+iXGZSwmuofPQhe2WM6AOYigBT+7MaKSnvqkZtDjLIxy+IdVH0QZ6RYNlnJW9wEXqNPCqMuunXEUr1xrZsT75jHs/vuND9miIAhvBEiCRyuWc/M3DcTNJ9DGWNJ3Ffz9LeOBZpBSG/4SpPKMoSMNdB0uZRrgazAMYrcLb01ODcIPthQn87kEfIdYv+j4c1nnx1UyRA7tNBRvpBzzjBE4vCifpm4XlSsVl/kYO82SfM2ydJCse5t5VDOwmVAOtOHD7RrT7USqYU5Y/vqzxQT+gea/c51G3tsum5ygTI+r4d6Odq9BTRdPD1u9i7XmItiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUWhJgu0Yz9j8XsfOkeyy6+r8LNCGTJ8eRrnaODXvM4=;
 b=qNSVVMnxo+6mX1eYqU9O11wiMBklRQFQ1BLmOH0TBrdhTW3sSRJbusEdl1/rZCu5UwLDX/XTSuL+8gBG2U1xEM5IWj8wVlw5vtqiQs/tr5qUYQUYPivYsNBKlBusVsCXqENfD2jFWj+BWPZwMzqHqiMRtBFHVzorz5z/yjrnH8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Wed, 27 Apr 2022 12:47:15 +0200
Message-Id: <20220427104718.81342-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fac5354-1d50-4992-428c-08da283b56aa
X-MS-TrafficTypeDiagnostic: DM5PR03MB3403:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB340394DE9FEF5BE8FF64CE6A8FFA9@DM5PR03MB3403.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hk1GTzfvwGsT88lmHRvplE05VEzPJe3F/jSXDN6VYvCWgWQUuz2zx2SPMiI9iSM2R81mZw4fgW6O0WaQZcX3x60yPMQxa6VC7Mxg3I5ipQ0lUSkKaK6+amMYfDUl4vO2sG8owhBiHJxJIL1F22S9+V5Ehyw/RQHYy6DPCHWTRkKCe1FltXuNyB05zbCQVqx+0Y3xVMSnle2ZTQOt+hQ7dEX8SIh4bIdahscMdDYiFHPeN4CvJO8ImmKe+KTxnI2Fg0cF50imk8PY928x1i2U5mNZpnqGJncnCtvoWw1DJqpBBmVqj7+dE3wFZAbBVElPu6Ei/+TDOsTLa9haTpDHemAkRstKmFkkmsGH/K/XLFNSJir+/Q4KHpM6fMfc6Ocl2+EmTUPpLNjag9a+jz6OfMDfZTewj3c7UR2K42YNMoSewrTomHhIXtW1xZTyULRHaCIL+boYVYEnObbf2zjyeXYwYe4RYqdcOeKEndulkiz+lPZZVy7J/CI/08kphDq3Xe5bfis+gl+344Jwrk0yswzIESd0Xi0HJ7e8OB0ytb5kfiFJhH+GRL0PwMysrMhXfIE1y19FTF9FZ293H44OGcrGMJtx5C05fJtztDInO3qzSIgj/SMarY+xrvO8Nicum3nl+whSwcpUSRXaO4gku8BEmtJ2Fi/O9z4D9oRzwYGRT/DvFpw4WFQoByyU6+kv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6666004)(8676002)(66476007)(66946007)(86362001)(4326008)(66556008)(6916009)(54906003)(38100700002)(36756003)(82960400001)(6506007)(1076003)(6512007)(316002)(83380400001)(2906002)(26005)(186003)(5660300002)(8936002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFtdUhBKytpSURJL0FDd202RitiVjV5OE1PTzhhMC9yQmVKK0VjdGNnR0FW?=
 =?utf-8?B?OUhjeVpCK081NW5xaVQwVW1SVk5Na1VMbytjbjZvVjVRUmg5VVZFaFlDeGcz?=
 =?utf-8?B?UFdYNmwzakpFRmFHdXN4THFKb05qUVlmY2FiTkQ4Zk43ZUdnWjdBZEdSd2JE?=
 =?utf-8?B?Ukp1SmlxYUJoQ2hvdU9wNXdGZzNqcEJiZCtNSmwwc0E2VG1LSklkMlEzTDd2?=
 =?utf-8?B?Z2p4aE5YejhlTUxydDVoRVYyTTBjNDVyZ2d6Vit6aUI3bk1iaXRLQ0IvdFUz?=
 =?utf-8?B?MGNReittVDJhY2JoVTBGWk9XczZ1M1BZa2d3aCtiQWRGY0ZhbHE2TG94OW1U?=
 =?utf-8?B?aXBTdXU3M0RoaWlXUlRhTGtWQmllREdYV1F2N1NuZzA4RjZZZzJBVmdQZExk?=
 =?utf-8?B?eDRuNzhYYU1XVmd2QjJ3czVVK3B5OG40cTJaT1NOWUp6MFF4U0VYR3hScDRN?=
 =?utf-8?B?eC8xcnFhR3U3Ym5DOUVPa3F3cEQvUVJDaWp4R09rYUF4QkNrMHd0TXlUMFZU?=
 =?utf-8?B?SEkvazRKaUkyc3E1R3V3QVdyNk9QODl2a3p5NkJWcHNVVXF0d1RLc3ZnL3Fl?=
 =?utf-8?B?ajFuNlJCaklXSzFsdXlzYUx1UGlBRDZKMERyb0prNVJsZlBzODBaQjl1dE9M?=
 =?utf-8?B?WG04NG1TZjlUZDhkNitKNTVrSWdCVDZqbUhiZUEreStWR3V1eGgrdnVJb1Nu?=
 =?utf-8?B?WkZod1JidmpMU2hKdmJyMkFNdmpWQlVLWHNDbm9YOGlRRHIxR2lkWFBudWZq?=
 =?utf-8?B?eFpjY2FOcGNST05JUS9CZ3NkWEtQTU1qakJicVpXNCtCOUw5dWdhM3dzVkxm?=
 =?utf-8?B?UkxjM1Y3SzFzODhWenczYkhlazQvSXNvYlQ0bkVLQU9RWjlaS1hSMStDOTJW?=
 =?utf-8?B?dVVYOFNONEpzUVJFRTdoMWFDRDFGa015T3E5ZXNHbnpXUU5uM2E2ZS9oekZE?=
 =?utf-8?B?TjRSZUhNL0RzdFRHa2dHQ1lXa3dhSGxYZXR0QVRmendJem9hTmZyRFQvL0JM?=
 =?utf-8?B?Mk1NV3FmODVkNGVneW9LdkVBLzMvNFFqamF0OUd1bk1KU2ZNRlN5WHJ5bUJr?=
 =?utf-8?B?YWRiUjhOVnlvUm9wT3JXaUdtNmdEd2VvSUFpRmVaa3BNTmlmV05jbDlRc2Rq?=
 =?utf-8?B?QzVoU2IrUEpYRWp5S3Q2U0tDK1V3bG5oWVBDeUFlNXVMS0RIRnlsSnpsY2J3?=
 =?utf-8?B?cU1XMHg4bEdsSWYzSk41eDYzVWQ2eXYrUThQeGNPb0dPTUFPU0RwYlFYTjA1?=
 =?utf-8?B?aHZYRkdqN3Fta3ZtUEd0WU1vQy9MUDlvamVkUWszR25sL2FzcnZ0U1lHSzZQ?=
 =?utf-8?B?WDM2bUZLTEtpZkNlYUo4TmtlMG9QeWk4aXR6VEdGZlpSWWtIU0ZOeUI2V3Jl?=
 =?utf-8?B?cjdqTFR6a09uYTJ5TldsdWNEUTQvZVRYMUdPemcxU2VSNE9pQXMzbkF4NmtD?=
 =?utf-8?B?YWhzVjJaMjNLMWVkVVhKR2VVNlIwYTVQeGNCOXBtV0F3TVN3aGhRTHRML1h5?=
 =?utf-8?B?aHFPNy9QOUg3a1RYbHJNbkZMYklickNzNmdkcXY5bXB1dXNIcyttTWJSWXdo?=
 =?utf-8?B?c0p6VmhZWDIvLzJYTDVkeHBXOEpwclhBVHJlY3BLUFZVd1k0ZkViU09nd3JR?=
 =?utf-8?B?TEJMSnRVSUhwUjRKNDBXTnMrd200TTJmbUNuSWJNdDQ4akpKY2U4aURwS3BB?=
 =?utf-8?B?djh3VFdwdStjNTByb2ViTVkzNWNrcXNXZVp6Q0J0NHlzbE9KTmYzMis5NFB0?=
 =?utf-8?B?U0w4NlAwckpKZHpYbVQ1R1owbjQvQ09kZ25ESUg3b0g1VjBONWowNW00TDNI?=
 =?utf-8?B?UjlZVlJyY21WeTJ2SWp4aVVablF2SDdlZEJDZGN3eDNHa1dSbzZRT25SdHZZ?=
 =?utf-8?B?eW0rYVFxcHZ2eG1MdG0zZlRJU1p0MTNEVERteEVuNE5sY1p0djcvSGxxWktK?=
 =?utf-8?B?VWlkMi9zNGg4cGxiWDltazZ3VUo4S0dLcnpIdk5hQlg5aWJCejRqYmVYcHJ3?=
 =?utf-8?B?S3JRdlhEazBxQ1R6Z3RQVVBZMDJkSExhcVBxOHJGVEVDeHFicjMyUWJpZTZy?=
 =?utf-8?B?TzVFaUs0Zjk0UUkxZjk2dVNCSmFLRGNlR1hleVp3REw3QUpTei9TMk9YdFd6?=
 =?utf-8?B?by9maE16eGQ5cXI1b2J0YkUvN1dtaVJlU2NqVnFlTng4eHJWbVJmWnRZam0v?=
 =?utf-8?B?ZlFYcmZIRTRQTGh3T3hmYWp0SGZ0Qyt4RS9UK3JDYjF1SUlPdVNvYVE4Qmpm?=
 =?utf-8?B?ZkQvVldqS1pzUzhnNmtVQ2hYK25MOC9iTk1vNFY1TDJnRC9aMkVpSjlRTFFo?=
 =?utf-8?B?L0RnM05Wd0lLYzZpeE9NU2wwZ2pKSnFkUCtGa2pyZnM3aktLNEoyN2xtUVU2?=
 =?utf-8?Q?fSMGmscKqdF971r8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fac5354-1d50-4992-428c-08da283b56aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:47:35.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E9MWusB5mBaLY3fdnYtIXhmh84jFoZd08W/bQ9DM4yvp1llAZMr251KdzcZ+tPfqboCdjMmipsj76pzYz7W/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3403

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL
(VIRT_SSBD) on different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

Xen is still free to use it's own SSBD setting, as the selection is
context switched on vm{entry,exit}.

On Zen2 and later, SPEC_CTRL.SSBD should exist and should be used in
preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
compatibility, Xen offers VIRT_SSBD to guests (in the max cpuid policy,
not default) implemented in terms of SPEC_CTRL.SSBD.

On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
abstract away the model and/or hypervisor specific differences in
MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.

So the implementation of VIRT_SSBD exposed to HVM guests will use one of
the following underlying mechanisms, in the preference order listed
below:

 * SPEC_CTRL.SSBD: patch 1
 * VIRT_SPEC_CTRL.SSBD: patch 2.
 * Non-architectural way using LS_CFG: patch 3.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 xen/arch/x86/cpu/amd.c                      | 119 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  28 +++++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   8 ++
 xen/arch/x86/hvm/svm/svm.c                  |  40 +++++++
 xen/arch/x86/include/asm/amd.h              |   4 +
 xen/arch/x86/include/asm/cpufeatures.h      |   1 +
 xen/arch/x86/include/asm/msr.h              |  14 +++
 xen/arch/x86/msr.c                          |  26 +++++
 xen/arch/x86/spec_ctrl.c                    |  12 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 11 files changed, 236 insertions(+), 19 deletions(-)

-- 
2.35.1


