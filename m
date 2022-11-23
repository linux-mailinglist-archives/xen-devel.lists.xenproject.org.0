Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D278A63645B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 16:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447635.704111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwk-0000wy-O9; Wed, 23 Nov 2022 15:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447635.704111; Wed, 23 Nov 2022 15:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxrwk-0000uA-KR; Wed, 23 Nov 2022 15:45:58 +0000
Received: by outflank-mailman (input) for mailman id 447635;
 Wed, 23 Nov 2022 15:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nECt=3X=citrix.com=prvs=319181206=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oxrwi-0008Tb-Lx
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 15:45:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9ed70bc-6b45-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 16:45:55 +0100 (CET)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2022 10:45:51 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6935.namprd03.prod.outlook.com (2603:10b6:8:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 15:45:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:45:49 +0000
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
X-Inumbo-ID: e9ed70bc-6b45-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669218355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rqDCpw9PYZ99mLkHO7aHSTRqrOOU9gk4oyTNsde8Epo=;
  b=ZNeNv0R9T/kpR86d9SLdYq0zjYYwiMfr8/OmLYS3v1hOJbf+/26oa+rJ
   B0UOkX7p9ML0xOGIY1JsMXuXIyFWjOCpPJxhx1Wn84VnsHqAr5+drOiWE
   HaLB7oftY/qYO/BLmpXFad+kau2jtDDJ7raGVL+6EWNo9dMfLvzxXT9l8
   Y=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 84481923
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9CFyeKBLddc5aBVW/xviw5YqxClBgxIJ4kV8jS/XYbTApDsqhWQDx
 mcXXGrUP63fajHwfNh1ady+/EkAsZ6BmoNiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxM9nITlp1
 6MjdiEsURCRpt69wL74Vbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVri78376VxksXXqoLDoKx+dsyj2ae4WEOJjQdVwK7nfC23xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xA2EeSzdbZd8OtckoRCcr3
 FuEg9PoAzN0tLSfD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLnW0ophfGT9ImFbHviNTwQW302
 2rT83F4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:U3lO9K0B++xxdi2iVKDViQqjBdJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhNV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYfB9BajYxUXxPF4w541esMmJ
 5j7ia8jd56HBnAlCPy65zhUAxrrFO9pT4HnfQIh3JSfIMCYPt6rJAZ/mlSDJAcdRiKobwPIa
 1LNoXx9fxWeVSVYzTwuXRu+sWlWjAJEhKPUiE5y7mo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST+cNBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fEc+PyqQpoV15E/8a
 6xH2+wjVRCO34GNPf+n6Giqnv2MSeAtHXWu41jDqFCy/zBrOGBC1zHdLgs+/HQ0cn3TPerH8
 pbA6gmc8MLHVGeZ7qh4DeOKqW6UUNuNvH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.96,187,1665460800"; 
   d="scan'208";a="84481923"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0/xB+/uEDWZFZmVvl0mwnarpo3o/1LX15ESmMhGMFPchr2FGOW7c12Qj6DADANkt6pjAD+34GOy5LNeKuUuLqyKW3tzjvnamJKWxGqAf3hc7R2ArMCOYlRf55H7Aki+wexvTsSy5eApMQSvg4WiMfQiqcJHnki0OdzIDFj/9Yz7LSrs8FVuo3arun6O5kHsINmz+OOHXBMeEW42GdRawBe1yKNt4dSps0FfYVpxJY9rYNjAV5AGAH2l2OhBXcwKqynO/j/cg53323+9VlNBmZ3Z4fOkC3l/Lxy6VQvk3aJ7xnoW/RhfdxLEKWAXRJ+/AQdrxBTmtTyX0Qca+c3/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I67lgI11eTbs3SxHKjPkzA3VPvUoeQg5Ok/IMGaO6DU=;
 b=jY+2C0hXbmg4mlAiJpM9IpIXnTPOzFu218yQ3FRtvHFAF+C6mL/GRjTey3N6Xr6GNqKs/KcbfiqCrXbhhTzp7JviIGGCrL0yXduHPF31KaLe/BdEOXj9WbEgG7yALLP2N8A8ivlewGoeqmW31dpxslHcWnnk6K1kGhuBIrvF3WJsslotGKliBLCxB8QmMevkFn/ujmNJHftmmqKxo4S6pJoCFlnAyz9kAdgfC1ZDVMMt6UwKLl0BMUvkr8LvtP9HUp8afEiHHmsoC+T0FttWgKMYLFROwfGcCEpouLaPdO2cvaCVELBh5nU+s4ER4fe4x4H+MAVmzSA0PUfZJ35l7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I67lgI11eTbs3SxHKjPkzA3VPvUoeQg5Ok/IMGaO6DU=;
 b=OWlXlKEmNaZzKHd5UpiaC4nxvLLNrhcpZUTgF6kMU8pRXDiV30KuIoOQFV8kXYZAJz6FP6zO7IQ/VUZti1mw1s+jMDmqK79Dt3+hdHFC9PbBP4mvMebwlLG7xzubGon7nQUR1Br8yNwCHGjseTzcAr3kHcpqqUY819ss/Zi7wdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 3/5] efi: try to use the currently set GOP mode
Date: Wed, 23 Nov 2022 16:45:22 +0100
Message-Id: <20221123154525.63068-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123154525.63068-1-roger.pau@citrix.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e3f350-ee96-4275-53c7-08dacd69cb36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wKA6FqDO0O3m02ihKx/TH6DMrrisytEv4oqdRV+M4hjwrvjqJ7KkDXOHdipKFrHa+vpzSGbTMJ9J2S3VPp3gguauu8fvyQmhg2TosuPNU3xwd1/0L9RPpRMCtsx6YqwEKijdDBwxLtyK11M20vnlJXDcyzXmSlRcffSMb8W/4uXfR66RVq+kgrazSwZz7UPuXTibKwJEFtZviHzJ8l/X8fcJmCEps9GEDCFKvuGkTHDC6HVyhU+gNG72IKEf+qZY5TYjDYfCuFjTQ+b5jvqdDaPAXB8qNg5Yp1tJpDQDBo7lxurKjzunlo0kqIxE0X6J0Fa5Nctxp9kw1eeRDRw1eQTSk/fhLG1Rw3I04xoz15mJVZyyKu/BuXKCeZ44lgbcDX0PoHTqIqf/vi1/C0X1vOCKl39+yBc0NLwbARBMkKpqksraLoatFN8sJKOqjU9EeZgDNul9Z/O5mniwgrmxxtRo3m1qD+L/Mu4EH4Pyij14Z5fyFEEXzeCsF5jcd0PyAym+O5D3S9aThQ7yRJqCcLeunhK2rUchrX4Q4HuoCps98jQVFtzxPacoC8q3z7qK0Py9x2K0pITMGYXU/F7vgPiqtRvACWobahEcwPHabcmERYxPoP+aM1CfCYygYVxCHhTwGHVbysuYaBirGGbcvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(36756003)(86362001)(41300700001)(66556008)(66946007)(316002)(66476007)(4326008)(8676002)(82960400001)(38100700002)(6486002)(83380400001)(54906003)(6916009)(478600001)(186003)(2906002)(5660300002)(8936002)(6506007)(2616005)(1076003)(26005)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJWbHMwNGl0ZUVKMXdCcDFEYVdpYkZWZStINkt5bTlvVVErdzZPWlIrZzhK?=
 =?utf-8?B?eFpmUjMzend0dHVVRCtnN0lEY0M0aDRSOGFEcUs5OGhQTkZXaC84enowZEow?=
 =?utf-8?B?YTExU25WMEpWcDIzd0F0MEs0MkJBREFlMndNUnl6VHpVeDcrSnFuTXZtcE9s?=
 =?utf-8?B?N2doNXJhWlpiMnFKM2s0cnNUL2lUWS9XQjZRNWhzUVBucUxqRUhEUGFJNkd4?=
 =?utf-8?B?UVJIZ1laYm1YbGhTai9ESmZRMlEwQ3N5bjJtT0NMVVRta2xFVFhVSithdytv?=
 =?utf-8?B?VG5DN1hNOGRNUFF1NXJVdnRabW5nVk1CRE9vNmxiVkQxMWVHNGJxQ1VrQnVX?=
 =?utf-8?B?eGYvWm5RWGloYXhHa1BiNEhzM1o4SHVCa01qaVkxK0V6REJUN1NaSVFSbnpE?=
 =?utf-8?B?emRGS1RvQ29DcmtMR3BrVzVhQUxLSUlKSEJmN3ZmWkgvNGM1N3pZU0V0aWJN?=
 =?utf-8?B?SGpUUlh6dk9ic0J4ckdEQ1NkajVBanlkcktnZnRpTGRlSW9OcE15c3k2Mm5Z?=
 =?utf-8?B?QjV1QU9TUGRiaFM4Q2x3a0lUM2M5T0xDeGJ0Z3lEOFVwVUZKNGVNUGZKeGxV?=
 =?utf-8?B?TWwzc3ROajFMTmVpd0VHdmRWTVQ2NXFlWEFpeHZ6Z2FBRkVnWDU3OFNaNjBT?=
 =?utf-8?B?aFlZWVY2d3RjSFI2dlJHbzNjOU1UTjhwQUtaaElNRUpOaEtWQXNwY1B3WkFM?=
 =?utf-8?B?OGxoUlI1YkJkR3lxeHl5aXVPQkFQZzNqWnNsZWNTSTh6TkczOUErbGdqNHpu?=
 =?utf-8?B?UlcwT2RzYjIyVVFETWZvVEJVOEpPSFZISEJnVTZ5b1hieEZib2FpK2k5OGpu?=
 =?utf-8?B?Wnd1RkFwdkd3YVNrSnBDTWZLQ2d0NlFDdlc3ZHhLVUtMODVQanA4Z0MwNm5p?=
 =?utf-8?B?eFVqY292SW9URUFvaDJtRjlHWHkvTTNMWUZ5SXBqME1JMU9hcEdYUEswTWox?=
 =?utf-8?B?UllTZ1JvRXI1aXNEK2NDbUYxT1JCOVdFTWNCQmJpZEpROXNZQURYTXBhaS9D?=
 =?utf-8?B?MzRqSEw1YmV1M0ltc21qNUo1eDY2clNBWU5vaFFHejZuK2crZjBuaG5Xakxa?=
 =?utf-8?B?RmlZQU9VUXRXcURSUWdCek4wa3dSNzhUNHJiMm1xQVpDem1ycWJLQnhnUzlU?=
 =?utf-8?B?cWMvZGJUVk4wdjBjUWJUWG1LeXM0YnRRMnZoZEFOQk12YXptTk0rM1p3WjZR?=
 =?utf-8?B?VXRia1ZRbUF0bFNkVXFuNTc3c0NHa0dDT2J6QXhPN0JaSnZIQy9KTUcxNXF1?=
 =?utf-8?B?dVFHYThBT293bzdGaFBTcDdQVTE4NWNVTGRMdUFsTVoxdDFHNU9OQmRGdFBQ?=
 =?utf-8?B?U0Fpdi82U3p5R1FvMk0xTmtBbFJNUnFEV3ZGZmhIQUJ6RmwxNk04a3RSNkd2?=
 =?utf-8?B?dEdWN0dpSm1NYTBuMG5vTFRuck9zNVErcEliMXJLRk9CNTV5ZmtmUy9VQXhI?=
 =?utf-8?B?dnNEMEpGQlpTTnNuazNMdVVpVUk4SW5pNy9GeDZuQ2JZem52bnA5STA1T0tj?=
 =?utf-8?B?WEtlMjl2eU85ajNZSE5QajB1Z0pCdUJSWkRnMW10aXplL3puTzNTUk9vdzZn?=
 =?utf-8?B?MS9UcjM1VWp2NnhnNnlSVXhzTm5IVmZVL090ZnlnWjFBM0xYVHhzUksyYkVW?=
 =?utf-8?B?YXpCbGU3b3dWMEZ6Ynl3ZG5pOERrRTRzUzZFU1dMam56QUw4N2hsbE83bkFs?=
 =?utf-8?B?ajEvb09pQzlJYUtMdWF0NEJUQllsTzIzdExXa1lvM2F0WFlFdFowZ0pYVDk1?=
 =?utf-8?B?V20rOEwyL2Q4eW4wM3h1L25UVzVYZkVxUS85VFZPZ216dHEydFdveTFhWE1y?=
 =?utf-8?B?VjRFWnVjNzVyaFE2RUZMVGNvN1NqdmRUNnhpSmVVTVdQNTRUbjMzcWZFTUlC?=
 =?utf-8?B?VEU5RVVCVy84dzk5U1ZnRzJjVVdOWm5UOGw4RzVYeE45YmMzRThWaWwvcm10?=
 =?utf-8?B?MzQ3L2VtSFNETDA3d203cldkVVl2UitBUW1QazErZ2ErV2ozeDBVZW85VHNn?=
 =?utf-8?B?OUQ4NXJ4Q0l1TG0vWkxhbGl1N1RhZ09WS3hwdUJqWWErTGpZcDl2NHNyQXZv?=
 =?utf-8?B?RFp0TExUQlduYUhNTEdhZ0lMRU8yR1Vqc3hnTEJVQll6MUgwajA3WUh2Qm92?=
 =?utf-8?Q?qDJcLXqmILfITqbHssDvzhBP9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7GksLdGfk58sBZE6LAz7wMUOGiKsFnqhkcOfSDtL4spcNlQ5MB7Pv0SRhieBGlYRYj9kdq8nnMXlrqtdHvxvOIP9TgdUXyK+tJ/q6RfQ9g+dvVB9dKYGGDvudaF7yF4xO8kwPtvA4wLzfmUK6FceXWGVFgImTI51tS3MmmMfv/lX0Bc10J9MvyaQiq+42YGB4tlceo5pYM8tSDWMZavd65yNO4iPx/eRDYWAPqehdo6Fn0LYC2qB+FSwKOhP1XbxtjGvpaCez2epgY/ico2l9SQ+XPnA+4U7agyb+5YJeNRom1qq3lDFoM70WLTIppE1OjaQ1nvzyMPGeXUNzH9qJZMB3gT5awfKOSyHXOI3Nr6tfdjM1egrgz7gqyVd6BtPRNT58UKWmGezkURVFZdRwwBHs09gCwLVj4/waAMCqnMRAt/ScIEVE1ReXVoQ/US8jgl2xOfkJQbYLu6O4P0YdFKevGuEpBpDBh6zUDP9Sk6zYB5ri5oHR9Kp2hE2JRZtF2FwmgFVRwIl/Uych5xgZxJcKl0zBL6GXDJAfjrkIMZMaOMCCrb1ktSivApYt4qExTXD8BIRu3stL8l84wVXG9/g9RFdbOnuIy46gl5Ep2jvZkpDsCtvzLMwUfhMvAIh2RSUWjcbE74QWj58KxlGDMT9CWF4uUlS5jKA6pH9VwYiuMH+3aOtKnar4X8mwAgWaq56QroVIpXuojTAJFqDaoXBm0WuYJwKF3XSH+d3soEC6iAJFoduothZd6Ay6ifeIiOcCXUNhLeDpbG5F0SK0K8gCQBLAyVlbRO4V79vInBWatW7F0XITU/p3i/CiUvQAKaazVvPvCIIrfWaoqE8bzPlzuuYHOv/4WYqiiZaF6g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e3f350-ee96-4275-53c7-08dacd69cb36
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:45:49.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egmCyMRRPyGKtezAP6wHPlO5nQWEluohaAGje5nYe050li5BJURyP070BVR0eMpA2/crBjCH0dX8FfWC9cmXxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6935

Modify efi_find_gop_mode() so that passing cols or rows as 0 is
interpreted as a request to attempt to keep the currently set mode,
and do so if the mode query for information is successful and the depth
is supported.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/efi/boot.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 7e8a8b7857..b91a7179a9 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -864,6 +864,26 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
     UINTN gop_mode = ~0, info_size, size;
     unsigned int i;
 
+    if ( (!cols || !rows) && gop->Mode->Mode < gop->Mode->MaxMode )
+    {
+        /* If no (valid) resolution suggested, try to use the current mode. */
+        status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
+        if ( EFI_ERROR(status) )
+            PrintErr(L"Invalid current graphics mode\r\n");
+        else if ( mode_info->PixelFormat < PixelBltOnly )
+            return gop->Mode->Mode;
+        else
+        {
+            /*
+             * Try to find a mode with the same resolution and a valid pixel
+             * format.
+             */
+            cols = mode_info->HorizontalResolution;
+            rows = mode_info->VerticalResolution;
+            depth = 0;
+        }
+    }
+
     for ( i = size = 0; i < gop->Mode->MaxMode; ++i )
     {
         unsigned int bpp = 0;
-- 
2.37.3


