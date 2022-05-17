Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CE52A3CA
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330908.554319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqxVm-0008Am-30; Tue, 17 May 2022 13:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330908.554319; Tue, 17 May 2022 13:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqxVl-00088w-WF; Tue, 17 May 2022 13:45:18 +0000
Received: by outflank-mailman (input) for mailman id 330908;
 Tue, 17 May 2022 13:45:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqxVk-00088q-VE
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:45:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93af27d2-d5e7-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:45:14 +0200 (CEST)
Received: from mail-bn8nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:45:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM4PR03MB6910.namprd03.prod.outlook.com (2603:10b6:8:45::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Tue, 17 May 2022 13:45:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 13:45:10 +0000
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
X-Inumbo-ID: 93af27d2-d5e7-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652795114;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jU7c4ZqUIfMVP2JbQuSMyIPZXMy9TlbwXes7ZeAEAk0=;
  b=bxCGhJ1Vw+Tchg96/bh9qiy74gVPMbq9knYA39BOjJyUGyqn8UmebrAh
   qLz5isCTiuVqVKTp+se6iypci4PatgzAItKatT3j5LrAuJgPYbIO7niZO
   QJmh+mP2+OKzmwyQW4Xuwi3NwRtvK6g7GN+F4GiahvRcXlctGdx9hl+5p
   0=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 71354686
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b0xV06M0d1U9PB7vrR3QlsFynXyQoLVcMsEvi/4bfWQNrUoggjUPx
 2MXDDvQbv6MNmT0eYx/bou+oB8PvZ6Hx99kSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 /xNk4ONWCoSN7TKn/g9WT94MT4uMvgTkFPHCSDXXc276WTjKyep6dM+SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5HdafHs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx3SSjLW0GwL6TjatvzXL89i8o65LCYcrOPdOnStRvnEnN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3uFuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0XtNRF6gw7lGLw6+MswKBXDBYE3hGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb13ojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:LYJCq6r0ESOun9Fk4NVNjBYaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71354686"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj2dXEr7NIe56KBRywqMKNA0gSm72DycRPoxpowYT7TBw7f+QsZgt0sWBSDqnqJZNdJsi7ZufIX6efH6lBAb3AUauB/usjB/AqbX7YwPeDfDb0U3pEyUCq91DZX/8AcXRBbOxwZPRvTbjnGngggiVoBslh0tWftWnDPvvByL8buNiHpVGDitw+xbap2bC9JwjL48FhoStiYe7I/llWp2FwUDSu31ZVs9YZHU5tmgZ2g0TMOCmCYZJgM5yNZX812xY2YBGxb9eKwPilOYKutgII7iJrelagctv1+KP9/DuhGnly0O1OMvgKSWYbcdjGYUUXqaFl11VFLKuKNg3VHLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCgELYNiii5OflNmNdqvnabfzbEXNHklRCa1gE+H6NM=;
 b=e7kqv/0k4G8+hBAqnKrUQgYbhCx14Vw9OGmB23C7eC/1UHpIyxeuB8USV6zBJS79TX5cUGF3gzgIKu9NIwX0142SdNIzw8H/1uon4CpvfMuvozArjyqS/QpSzDrBU9qZrK9Qsut6g7TSK0Qo8VhPixOzOHM9jOg+z8UzFaIfwFs5zDd+S61WaUGEEaxdk6j2blJ75j8AOBDSm5/UIzuTPUG46qZDb7SAYY0MHKUas/fwC1fx3Xo7rkXkjJMG6FIa/fuNMcjDyW3PSpQfKyDk96TjpAIzq6JLQi6wDG7izjhaR+ddFQGLvUKCjNOG8nBIfK//1Kem3UdsKbHHzsadaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCgELYNiii5OflNmNdqvnabfzbEXNHklRCa1gE+H6NM=;
 b=VxR/s8+dgz0xliIyF3+vkSEl94QqcRZ5cWmP0eaIBs3OjX/R5LiDWYcs8QXnf/ToMyZVIG6UisOEiHo+wK3iKd6CQDJGz0yeNrx9x6I+yQpNwz6XX1Be1OGusup3vAOwD9ryz4LsGnaY8plCXttnW8IE/1Oh4vGGTy2e4MLTO6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 May 2022 15:45:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for
 HVM guests
Message-ID: <YoOm4iVYO3jdjzw3@Air-de-Roger>
References: <20220503082650.23049-1-roger.pau@citrix.com>
 <20220503082650.23049-3-roger.pau@citrix.com>
 <7525a9e0-2334-7b6d-5d42-fb68fc6ef0c1@suse.com>
 <YnjrrG6iQmUgB1r/@Air-de-Roger>
 <5ba9bc92-6cb3-7d7e-150f-077c709acc3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ba9bc92-6cb3-7d7e-150f-077c709acc3a@suse.com>
X-ClientProxiedBy: LO4P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e099987d-fcb6-4288-b254-08da380b7638
X-MS-TrafficTypeDiagnostic: DM4PR03MB6910:EE_
X-Microsoft-Antispam-PRVS:
	<DM4PR03MB6910D4DAA7C9D45086D216028FCE9@DM4PR03MB6910.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1DZNCU2PcsKN/3sytyCRm/vWZanlfSQ7IFnxQioSt8hq8tf0c59GOp7HK4nhAzLE7TrlfEAlYBv/iJwvlIbd/3xcXnoY2wIp5Z+YPbaEHVSMo9sidpq2HGXUOnc/nk+t5uWTnn0IKxR66ySO1RVpSkvGNRvdBHBgxqW56md8SCzcovwaU6FNrxJ8N51GLl43ekAIp73q0QXYWJiNoHaGL+0w8xo7emt974qVmGkOv0FIg7GTsyLy+6kYrh9WcC9HcQYRNN2evimfO2Uy7H8LrekkHLb1v9cDIGs7pY43Xgi0f6BhIfV3NO/znuP8yDMUz58l/iej4+eiuG0vuITL7u41eTbasObwfyR9Y/v1yKms6T81mVXdE3jNJ+DYEIMNT7eiTtVEPtZI28nQ//ySPZK+O5xQ3426c1+AFC+a8PFQGJoNuLtqRabJvOtnNo1hd0sGpfNIPjOfgOq6kVPQ6SdnHNJhx3IgqY9fyd4bF3aDCBS0u3L3n13caY3fCHX7djHpF2FZ28+F5CwRalniaM8qh6CrG9wAv7dK5oO77fjUrGolz4dOmuK8Isg9aq2STgQXb6g+JQVWnrfUu0YsYQyfOR04D7OyGfMq2RywSvIl1HJ3vANWcT1v9ZnLq3hBAPOWHZX/KvITye6HvS1pQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(85182001)(82960400001)(186003)(508600001)(6916009)(316002)(54906003)(5660300002)(8936002)(6486002)(33716001)(66556008)(66476007)(38100700002)(86362001)(83380400001)(6506007)(53546011)(2906002)(9686003)(6512007)(26005)(4326008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1paZ1lPcTFCaktaOFpzbEQwcENEQ2xpL3NMRmgxMVZQbXhrK3Nwd3hYQXpH?=
 =?utf-8?B?V3R0ci9MbnVYcnpKYWJvYWtVWUxxYzJ0a2VHbUFJdnlmTzEvQUJ5aDNrb0VV?=
 =?utf-8?B?blFLbHlmcnk1cWRyWTZjNFRLSVlEd3FpVDl2eEVWeHFFRGQ2b0Z6MzdudzV1?=
 =?utf-8?B?dmpwb0o0VVpPUmtDNWRYaTNoUTJtWnJtTUh6MDUrQkNJSDJPTmhxWEVoaWdW?=
 =?utf-8?B?Y3UxNE9KNDc1NlU1MXU5YjVhTGVvMkVnWHpob25GMDdQSVZEY0grU3RjWFRW?=
 =?utf-8?B?bXg4Ym9paEkwK3FBeUxVNkVkT2tYQzN2U0hKTkFOcGRJRTdmbWJQRWszUnVq?=
 =?utf-8?B?TjZLTVlaRzNJMzRWa3JOZlNWNjliRjBhcjRXM1hzT0U3L290M1E3Vzk0czR2?=
 =?utf-8?B?eFBVRUlMTVA5UFphbGIwTFJoU3JoZzNkUGtQaEczeXFYT1BRYkF4VGFNK0Zj?=
 =?utf-8?B?L3lPbzZYaTBLbzVaKzhtUC9lL0JQTFdVeXhIV05CZGMzaE5mNjlaNUc3TUFQ?=
 =?utf-8?B?R2JHWjFacVg2c1FvWG9yYW1GVHNlUWFPYmtlYWwwZk5PNm5kTDNqcGhFbEdz?=
 =?utf-8?B?a0ZkaFFMd2RkRXQwTTluaDZCNDFKeWI3bWJEQVo5QjVCSHZudjlFOExPajNa?=
 =?utf-8?B?bFBJREk4Vm1NRkFIbXc5cE9ZV1oxL2VrYnc2V1NkV0IybFRVYWJ4ZVBua0hN?=
 =?utf-8?B?YlZHWFFXSTBRclFYN1VNZSswSkxVQThNckQvdk9qVGdZb0xDWWJFL2Fwa092?=
 =?utf-8?B?aVM3dDhvdGh0SEd4Szh1NmoxeWE5amIrZnNqREVjbkZLVFVXRXR1V2VicFR3?=
 =?utf-8?B?UkU0TEhjQzZxYnpMdUFYZUptLzQ1WGhtNmVvbmpEQ1luTHN1d0JsT0pEZ29U?=
 =?utf-8?B?VVpKVU1IcXBWOHhDdGxvVm84TzNzdUVSUEhQZmoxT3V4c0orVUFheXVWT3Y2?=
 =?utf-8?B?d3MvQVYvT1lLbDZZVDhSNE1DdnYxSTRybitqaVFRMGdFQlQ1czFvUUV5Qk9H?=
 =?utf-8?B?ZDVzOGQ4dHNVczBidzVzUWU2TlBLaEZ6VzlnVlFXZDBYNzJmUXpHY09mWTEw?=
 =?utf-8?B?alhyeTlwZWpJNlBIM1FnNnJsb3AyRWlpcWtSanVGbVlxZ3hPay9IQkVzV2RJ?=
 =?utf-8?B?YWIwRnVNcVJJUmh5bzMyR1RneHpMb3JRNjFTaE9JTjhQdm12MnduOFRzUURN?=
 =?utf-8?B?eWNNSDNuZmcwWHYrbzl5aDVkd2hSRDZBcFliek04dkZ1OXcrMEpNRCtwRUdx?=
 =?utf-8?B?WDFyTVNYbDZmVXFwRHlwOTNDTlNHd2J3R0orbURaTy9qQkxkWUtQdHdhUk9N?=
 =?utf-8?B?Mm1SdkxLd1ZqQ3dYZFAvWHRESkZWMWxETjNYd0M3Y2Y3SjVnZXUyWGhsc2tS?=
 =?utf-8?B?YVBjdUpVemdlaXh6WUkxTm9BbU9PNi84SUdMZTc4alNjQ0VUaTMrMFBXblBI?=
 =?utf-8?B?WEpqWE03aFhHMXpNNGhjYmpYdlFCMnNiU2drU0xLeUNHVUJWazFQcFg1WDJS?=
 =?utf-8?B?dEZNaG1ESjdrZEJDOFR0RDIrTGZsYXlpRHNvck5vNlNoMTFFRzBLNE9mOGF2?=
 =?utf-8?B?ZWU2U0hoa0lFWVU3ZWdKWUlKdmRVV2hXazBJeGpNcUVpY1k5VithangwU3Y5?=
 =?utf-8?B?THFudmlub3dEWlNTUmI0aXlPcDI5WG1DY2hYNHNJYjRxVUR4TGYrdk5IYWZw?=
 =?utf-8?B?UjN0eUxnS0pSaVJXZ3hkOFVNTVRUT2U2QStXRWVONWxMTnNQS3FrMFptL1Rj?=
 =?utf-8?B?T0l3S1NGMWM3TTNxb2d0SEM1eDdzWFErS2FFQ3Y5YUNmRkNPZXpKSFJOeGFm?=
 =?utf-8?B?U01LaFlqT3JMVUhPY2VoZ0JYWUowdVpERXRzY1NMY2MvR1ozL09Lb3IrNnBW?=
 =?utf-8?B?YzI0dnNoMGRYNWJRWm56YXdBNDlJcHdMbnFWbUFBWVMyTkhjRmh0QkJud2tZ?=
 =?utf-8?B?RlV0cUxVc2RvMlFxcG1URG5BL3EzSWVtWkRmNFc1U09OOVlkbmU1RjBhZkwy?=
 =?utf-8?B?NTJDNGpRYURGRWJWU3NCUnFaTHlqSmdBYjFYaVBxUUlZWUlRSDZjSmJieXhO?=
 =?utf-8?B?VVd6UW11MGpNUGwyb1ZjOW44elhIaHJrZFc4bUd4OVN1bzBDeE9ReE9RbGw2?=
 =?utf-8?B?S3k1bXZiWm5ZalRPb2txaWY1NzZDYjdSWnhYaXJkelBwb0pBQldQUCtYcGtx?=
 =?utf-8?B?MnZjQ25rL1BHWHFVYWdnNzFpQjJCT2didXJPamdMU1FYMnRBbCtzb0xuM29a?=
 =?utf-8?B?QmV2a3duMHpOYlR5STlyaU96ck44TGFEellzRjdRdTE3NVg1R2IzSWI1WE1a?=
 =?utf-8?B?U2doV3UwVldEeE5mYXlQazl2dEhIV0cvOGcrOEcvMXEwZGtSSTJWMFNFSi9W?=
 =?utf-8?Q?mZlZRIGXQDv1UaqY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e099987d-fcb6-4288-b254-08da380b7638
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:45:10.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxlW+jYqVROrQFytdK+TaPhgItorqlb4iy7v4NSG546taFqfWqef0Fg1Lww48P5u1ZRCYFAAB+aA9/dGg7bx7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6910

On Tue, May 17, 2022 at 02:10:29PM +0200, Jan Beulich wrote:
> On 09.05.2022 12:23, Roger Pau Monné wrote:
> > On Fri, May 06, 2022 at 02:15:47PM +0200, Jan Beulich wrote:
> >> On 03.05.2022 10:26, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/cpuid.c
> >>> +++ b/xen/arch/x86/cpuid.c
> >>> @@ -541,6 +541,9 @@ static void __init calculate_hvm_max_policy(void)
> >>>           raw_cpuid_policy.basic.sep )
> >>>          __set_bit(X86_FEATURE_SEP, hvm_featureset);
> >>>  
> >>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> >>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> >>> +
> >>>      /*
> >>>       * If Xen isn't virtualising MSR_SPEC_CTRL for HVM guests (functional
> >>>       * availability, or admin choice), hide the feature.
> >>
> >> Especially with the setting of VIRT_SSBD below here (from patch 1) I
> >> don't think this can go without comment. The more that the other
> >> instance ...
> >>
> >>> @@ -597,6 +600,13 @@ static void __init calculate_hvm_def_policy(void)
> >>>      guest_common_feature_adjustments(hvm_featureset);
> >>>      guest_common_default_feature_adjustments(hvm_featureset);
> >>>  
> >>> +    /*
> >>> +     * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
> >>> +     * VIRT_SC_MSR_HVM is set.
> >>> +     */
> >>> +    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> >>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> >>> +
> >>>      sanitise_featureset(hvm_featureset);
> >>>      cpuid_featureset_to_policy(hvm_featureset, p);
> >>>      recalculate_xstate(p);
> >>
> >> ... here is about default exposure, so cannot really be extended to
> >> the condition under which this is put in "max" (except that of course
> >> "max" needs to include everything "def" has).
> > 
> > Would you be OK with adding:
> > 
> >     /*
> >      * VIRT_SC_MSR_HVM ensures the selection of SSBD is context
> >      * switched between the hypervisor and guest selected values for
> >      * HVM when the platform doesn't expose AMD_SSBD support.
> >      */
> 
> I'm afraid this doesn't explain what I'm after. In
> calculate_hvm_def_policy() the comment explains why / when the feature
> is exposed by _default_. Taking into account patch 1 (where another
> maximum exposure of the feature was introduced), I'd like the
> comment in calculate_hvm_max_policy() to focus on the difference
> between default and maximum exposure (which could be as simple as "if
> exposed by default, also needs exposing in max, irrespective of the
> further max exposure below(?)").

So something like:

/*
 * When VIRT_SSBD is exposed in the default policy as a result of
 * VIRT_SC_MSR_HVM being set  also needs exposing in the max policy.
 */

Would address your concerns?

Thanks, Roger.

