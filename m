Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B557485C4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559223.874028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3H2-0002aQ-MO; Wed, 05 Jul 2023 14:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559223.874028; Wed, 05 Jul 2023 14:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3H2-0002Yk-Jb; Wed, 05 Jul 2023 14:14:28 +0000
Received: by outflank-mailman (input) for mailman id 559223;
 Wed, 05 Jul 2023 14:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH3H1-0002Ye-8V
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:14:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbb1328-1b3e-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:14:24 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 10:14:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6364.namprd03.prod.outlook.com (2603:10b6:303:11f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:14:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:14:03 +0000
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
X-Inumbo-ID: 3dbb1328-1b3e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688566464;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JvLzSDUGnmKIeeI6Mb+yCtQWowOLtKjTeLJC4kdP4yc=;
  b=Bgjh+TGmT5TN8pBrn+hz1vYRlaRqEzspgvI57J6Fn9yk4/N3L/i/Iti/
   8R+WXs6jSfWrXV5SOP0IWepJvfTIJPvGUuz+KVLd3/iTaht7MpElDEWjx
   uui3lzc+xqH33eoVrHJnTMaku8Hh4r27VOEVUV8cc9HVCXTf4hHKNsq4W
   0=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 113951527
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8xVbRKnxlyy0R4K/WdVt7FXo5gxBJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJD26COayNamegeowkbYuy800P657Wx9NlSgpqpHgyEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5AKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eU4cTYkbgiEvt+dxq2lUvQ3meEELOC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCzWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTebpq6c32gL7Kmo7OF4ubVK6rNKCrG2HRu0AC
 UgoxDYRlP1nnKCsZpynN/Gim1aNuhMeUtxcCep89giJzqfW5C6SAm8ZQnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLGxps34H3f32
 T/ikcQlr7AajMpO0rrh+1nC2mqovsKQFlBz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:OifEKarXwMpylJ2vuMg9PTUaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-Talos-CUID: =?us-ascii?q?9a23=3AEo3XmGsjDTpR0Uckhv0sNx+76Is8UiTb5XfIJHa?=
 =?us-ascii?q?FImB2VqWIEkC136NNxp8=3D?=
X-Talos-MUID: 9a23:T0mkFAQdWXPC193MRXTcxwlaPcZlyJ+IK3kQrsokv/W6KRNJbmI=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="113951527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRunkEK7i/UhzP5n2OI8DxC71Fck9neVE+weqCxHj+nYd1dj0yiNO5dbY/QqqasIbAeZmN3taXOVAOz/zibrKgrbKAiiDLv4jg7VpB4TDXZ3FnZpLwc5fI02rhKGEx1pSxhxlEWt4AkS0sM11/Hi6kC1zkveI7Zbw3Tehhc3FoLcO9uwuISgWhqorEE7jL36zOJrpDOqt6RKwRwjsXo5m5ZxJ0TfWvBISetXpVMYbdStYNYrqrV0cd80V3UvZYYo1uhLI62sH7GEJxpRJJPawKuaDfQ05zMZIStjasu5s7obq1M/fel1rGbKfyJkrxZghcwOVSv+SV3UK4G7/GQpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZheg9kcAvUSpKIAiMkLuHXH3CvT5QsCXu7xch1Jf60=;
 b=MUwIhoGpNoQIYtR15Lte2Die1GraY6zLSVDqvhctDEd0HZWauP+fz7aqyNOUPYmVGK3Ct0T1yfJMn+AX+06ujlAK27xnhqhUKh+D2qVkO8HiP1wLIbzAybfIg0DUQg6JftJzzLNiXDHsHgRJFdQnHywIF4OABi1o2NHiEalWiIn7UrkrQgvPS3jurI/4V/sNwqy+WUmVXsfhnYpVHTD9Cg5JupF4sJb0RZRMyuGq1fLZm6Zm2aO4NvnZXjDyGM+q/Fd2sPIQ7C+hM/2ovNvykt5E/2zh1Py890eS87xO79aICsLKBBE0KmfoP8WaligyzSGePY6fGffzXDnN7N/+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZheg9kcAvUSpKIAiMkLuHXH3CvT5QsCXu7xch1Jf60=;
 b=khXE9aD82LTDB8+7C4idqT4mTQlScL7fOZcpU9bdel8xGMcXeCZ8yb2M5/R60FP3QSRImdrDFgEkDTEaH0ygMxg77yBF48goAixQQKb4yW88ebQZ8Nu5vzwSZ0yXshK/J5WKTq2ei1zYL7rVMChvssCdp0VMS0QXunDSIvr3Ios=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d498ba69-564d-8232-5f5b-da52050772d8@citrix.com>
Date: Wed, 5 Jul 2023 15:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 2/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629152656.12655-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 19028cd6-4363-42bf-e8dd-08db7d621639
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G5Lg/W4Qz1Mn0wD64Pn5GKX6kn10u4r9op9oNks7clXvsQK8m18mdd1c039Yr6WRlM5deMOTzikIviNNlG3u5N9+nRkWqhmNC/TwjGK20UIjdibPl2B6TuXjvIsINNi7WsALlReEmlEC5ZU/yxuaaXdTA8/6fn9JjCf8J8yUMUSYk6Zbet7pRvu/ZBIoFyGuQlLPjgcFFi/rhpw5CLyYYq87HPt8Za0cGo/k43m9kWl/g5ZBi8ZBwGz6zztpdKyBx5wDwYBM2eGygVAOdiEpANYlxxiIGNXngAR5r+PkZkM7gIAaHomJ8hUfynv/O6O0z9fSa5PuPaLql8nIRElE1J7tqdC8DAbP8aptNrmhXrk9JMpk7IUZXCFvrhukNIBU+I8UT/YKBg5ztD4hB8x3jCyxcikuJ/+Sd2eVL/TCdZWcUvll8npYKVtfHPaDyxGAg3qkYAYX4+DdrxHFrMBQc+YloQsg0uH9gcNOeS8t16GhNjmSiogKtrM/pxnJQeEd785OJwQkEEnPH6Vxho0z0k/T5kipcJSueQB2/92vXSm2WBFhXaegj6H0JUX2OYKLwbQBzkz2+N5ERsB4K9HfsUyWn9iFZQ/ivTv0oHJxu4ZU9bjHL60bocDUblrLsxkynrXqbnhID6VTY4qxj9Iizw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199021)(186003)(38100700002)(2616005)(82960400001)(53546011)(31696002)(26005)(6506007)(83380400001)(41300700001)(5660300002)(8936002)(8676002)(6486002)(86362001)(36756003)(4326008)(2906002)(66946007)(6512007)(6666004)(478600001)(316002)(110136005)(54906003)(66476007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtETnhUdnZwSldEVGRPZ0xiYytZakRJN0N1Sm5wOG84VGFZb0ltTXJ0WGFu?=
 =?utf-8?B?S1o3bE1lVk9TYUxrWE95d05hTkFuU0FWMDhRcFUxVTlON0dwZFFaR1F2bG5T?=
 =?utf-8?B?bnh1ODFzUy9aVXlqemp3bHY3TXBSckZzNjUwZEpwZ2ViOTNnYzZHV1ptY2Nm?=
 =?utf-8?B?RjdRQnJvWHk4eGxvQk53ZGhVRUFyWUVYeTF1d201am9xRmVza3hZN2UrN2lF?=
 =?utf-8?B?bzRZNFNzZ0d2cFNQM3FHMTQ2SUpvMW1teG9wZHpmMTkyTUJkdkdzRjdwUlFa?=
 =?utf-8?B?UmtkMlFQZ3o0K01zTWVQdUlBNFdzbmMrRnpqdjVlK1Mwei9KOVZ6U0JLWEtp?=
 =?utf-8?B?bGlrUHBNV3EyMkxOOWxvU2dNR2xvUC9TeTczQ1dHK0lxSmhvTXp3Qk8xalZq?=
 =?utf-8?B?Rk03ZmZKaUhWeFdOcXJlcTRUdU9qeTZ6Ump2cmJoeGdjN3RHNlc2dDdNSXpE?=
 =?utf-8?B?MmFvNUNVZHRSMTdEZmcyNzhRQzlRamJVazNOai92eEJNREdtdWRPZTducWJS?=
 =?utf-8?B?d2lEQ2FFL2ZMODhDMXBvWFQxUDcySmVGSW45enZGbG95UjRrT0tFSDdUck9K?=
 =?utf-8?B?dWFiZEsyY0szeUFRMFhoRWJ6ZFA4eStQWEV4Wlh4L2tEN3MrdzBTZm9nNFk1?=
 =?utf-8?B?cHFJTGxSYTBORHpGTnpPTkhJaFpUbmpRUHpUak8wZU5VQWVFQXFjRGVWTUli?=
 =?utf-8?B?dVo5UWE5eXVOaTMvcTdzeFNnejJtbmZGaDBwcDZjSFBnVmNLc3lUKzFtNW04?=
 =?utf-8?B?blFNUHVzY01mbW5RRUJvWnZyK3lUM2dqR1JmWUpyOHRUd3VJWkhoUXo0cDRM?=
 =?utf-8?B?c3VuRmJ4Ym9JaG1YbURkY2tlVDZxeEwzQ09lU21DRm9JWnZpc1cwV0JnS0NT?=
 =?utf-8?B?bVEweDFKdEdyalUza0tqMGJIQktjaGF5SjBEcXhVb3NuM3Rtc3l3RGdjemdo?=
 =?utf-8?B?Rk55dDJaTE9xaXpjbVZoSTFkV0xtMHBiTDhhWkFEaGFxSUhJdjNIYzJTQlRN?=
 =?utf-8?B?ekxsSjRSOUNmeWRheWlaWGVtYmZENHI4R0RhTHV0RDZubjgxemhlcUhFSHF3?=
 =?utf-8?B?c0tJWFk2WUo0aGt4UDkzYmI0bk15QXd0UVdwc3U3dHRDL2FjSGNnY3hFdVZY?=
 =?utf-8?B?bmVlODNMNFpydkhmbWd1TlJoR25VTWdQTEh5aWhDdnp5TVd4UC9CckN2dU1C?=
 =?utf-8?B?Q2lpOG9jeTVmZHZqb2U1RFpobjlTa2RVR3g0bytscnZTbzZOU3NNNlh6Q0VP?=
 =?utf-8?B?WUJaaHVhNXVHNk1Zd1RhZDJHT0xnWHdqVmVhbCtEU2djd2ZnN3pkNUYyWTZt?=
 =?utf-8?B?REk0NlFEQzdKUW1zVEZLR25FZTRiQmZ3Q2daMzVzRDUwcHZZbHJOZ1Q5MjVi?=
 =?utf-8?B?ZzJ1UVQ0alhzQWNtZ0p4djJ4K3haeG9ISzNDaWdNRVlZallrNVF1VXowamZp?=
 =?utf-8?B?dVNyZU9uSHNTNmhvcnh3NEkrU203Rk9objBZS1JMTVJldmg4SUE1a05IaFQ0?=
 =?utf-8?B?NXErbzh2dGlKQ2w0QXIwYjNIQUhveXJMRFpWQzVGLzQ3bytjNWZibEhrc3ly?=
 =?utf-8?B?NUlKNU5hdWhETlBPTjNtVGVuUVpERjZoQjQyQUJUTWw0MzZSa1ViUWUzY1NU?=
 =?utf-8?B?c0tVNUtINm54NkxMd0k5L293MStPZUp6N1RocjRENUZqamlyOFRKZ3hTNDNl?=
 =?utf-8?B?eFhBaXB4UUZOVUFVQmVqdUNOdVU0V01tSGV4bWRrdndmODRpcWd4MlY5R3gz?=
 =?utf-8?B?cVQ5eEhMamU3Ny9hc2J4L2J6N0N1MXNlYStJYWFyblhBdjZsTFUwcFFxdnJo?=
 =?utf-8?B?dmNLMGFrL0FHQzVmZmZtR0R2S080WENJWnczakhEOGU2SkpWSEpJMVl4SnM1?=
 =?utf-8?B?czFhanlhaHpkVEJiNThjV2JQMlc3YnFWR3pnUG5PaVVVK1F2c04yYktHZ0dE?=
 =?utf-8?B?aTN3NlMrc0VQYUNXUG91cExmZ3ZkbS80bjFUUE5rRDZTVEkxSUlia05GblNY?=
 =?utf-8?B?QkhvOGZ6U0FUaDJrVXlGUmZYc3dyMFhsT1ErcnY1L2dNUlRKcWdmdFlnMkpB?=
 =?utf-8?B?S09pb25iUjNNdWNwWG1JNENhRDdtcElMNnVINVFmMlJhNjBSLzlLdFlHU3Nj?=
 =?utf-8?B?T1kzaTNEMlRCdXVWUjVQUEdBejQzOWNwR2YxNXZmbWhzaHkxakg1bFl0eEVY?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8HMspi/rkIEW2G3IyP9vAI8ZmEHtHXmsUtZNnJH4wl9YIbFqeVubXjkWpUjIrTcI34gl2fWqgGCmqdkrS4tjYDMN8jBCinURX+uXEjVTAKyNrxV+AfwdBSVUdqWPoT33M6UXigHBm+GQC6yrqLz06Ag/Hw6xh4DFy218FVQLtNiVvWuAV2e/ugHsRsPz3T4/KmJQPAwCCHRa2m1Us3wgcAe+yKIsnZBWlThyaiVex2oCm+kcpfp0gT5ERBh/O/FnK1GS/687746QfzwsVFv/2VONATV2+5RKgfGG7/IHhu6ennSYms5ftD20CKD4aYST14n4QF2mkphrd06fyNOZuwEQaBigS4lfXo5FVBOOtJwR4JHBemy6jWdhgr8w6ZjKK4ytyKfHoo5Qo9i4uHnCbceJDJsgElOYQN3vGVGwR/VwPXlU90ANMT3OGyHH5PQ+u2TJlneXFNhR5XEZz1NvhAKbE03xnqOuSCoQUM/c7pqbLlpcXAKeUMGRFFsmHaW7LAB72XlchZs8KTCm3/vGKqMweStdn9vdguirEFlSS1+QJMepQnYVWxCfwLzV7/XAYBMuUnAVIrGRJ8Q3lgn2oCrdoO1pPg3PJA193WVgxA+091lWVwl+t7uM52kU1/DahyWNK8BNm2iPqL6kOjAzWTHFNhG0djRYOjG6FufUwifnuh58f9loANjTnO9PdlNDNPw5ONYR7TFizn3Xypkv4SHkb3n1leCR18DuK9bPVKd/6jkOcq7ikL4YhrDAj7Sxy5CR6j2lbP4zOPmeFheK1lrhK5rouN5QLdIoM2AVl8MdHnh9fEn8UBjFsGIJCunk57sxC/zNR/fJ+YsSnFx4BCUQzOcnZYxR/gs4oFkn2Y0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19028cd6-4363-42bf-e8dd-08db7d621639
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:14:03.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PZgFnvcFRIAPbbx6B2Rh9NtyOWQsEehda14xdFl1k/ljKU7Htr+JhEJH4b9RrIandn0xA9Zhd1lHu6mNE8JJxCGU9Nb9VQ09lhog6GLyWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6364

On 29/06/2023 4:26 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index bec8b55db2..b620e3bfa6 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -867,10 +867,22 @@ int __init early_microcode_init(unsigned long *module_map,
>          return -ENODEV;
>      }
>  
> -    microcode_grab_module(module_map, mbi);
> -
>      ucode_ops.collect_cpu_info();
>  
> +    /*
> +     * Some hypervisors deliberately report a microcode revision of -1 to
> +     * mean that they will not accept microcode updates. We take the hint
> +     * and ignore the microcode interface in that case.
> +     */
> +    if ( this_cpu(cpu_sig).rev == ~0 )
> +    {
> +        printk(XENLOG_WARNING "Microcode loading disabled\n");

XENLOG_INFO "Found microcode revision ~0;  Disabling loading because of
virt\n"

It's normal (and not a warning) when running under other hypervisors,
and just "loading disabled" is too little information.

Happy to fix on commit.  Everything else looks ok.

~Andrew

