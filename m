Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4106C34C8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512777.792977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedL7-0006zS-9s; Tue, 21 Mar 2023 14:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512777.792977; Tue, 21 Mar 2023 14:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pedL7-0006xh-6G; Tue, 21 Mar 2023 14:51:53 +0000
Received: by outflank-mailman (input) for mailman id 512777;
 Tue, 21 Mar 2023 14:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pedL6-0006xb-27
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:51:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e80af326-c7f7-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:51:49 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 10:51:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6942.namprd03.prod.outlook.com (2603:10b6:510:157::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:51:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:51:36 +0000
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
X-Inumbo-ID: e80af326-c7f7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679410309;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ABS3/fMU3ONbnQRjUAtsQkLqmZTkk2QyiHHdhyytP98=;
  b=XGrgWxaIKdRLkbkHmdteoGUO0976aQSs8WxGWQOXSeUCXk8a0FVlTy2W
   1hu/eST9jT4D19T7zrU0c307x43tqpyrd4cSCHpn9Ui0+SSOLvEqGcunG
   yhFZ+2LtEMquHdBhwymcEpvkxiFaSwtI+hoqQLKxFMTImKgu82PYrPMVB
   w=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 101086739
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mQWa+aAzbaFUYBVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApDoi0TdVx
 mVKXz/UMviDa2r0e4hzYYm0pE9S75PQx9JrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+OJTXVBl5
 8cjMjUhdzmHtviQ+pu5Vbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXxHurBt1JRdVU8NZYoE+W6GYfEiY3C0SnvPn6iX+cXNhAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBRw1V5dDm+dg3lkiWEIclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:gfbIpK01RDm/0Wxh9gekDQqjBLUkLtp133Aq2lEZdPU1SL3/qy
 nKpp536faaslcssR0b+exoQZPvfZq+z+8T3WByB8bGYOCOggLBR72Ki7GSoAEIcxeTygc379
 YFT0ERMqyTMbCk5fyU3OHee+xQueW6zA==
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101086739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr07UTXqOs/gq141VfJZHkwlV7MP7WjVTK0JZ0DOPFx8fJUP9+jwml3VU0gYXYJCt+2OdLebxZAsa0W15Rtm0NgKjdwpAaKcZqpZtuIAyw0sQhwMaa/8x1W9QalUfRu+jjbVBqTH62R6Y2Y2MlAxYeitzruQ5h8IoWVKslIX8mIeYRGpVdUPLvsojLwgFpQOWcTKPMU/4RXjy+HR0KVLfTnOvtNc3kNzXQD7JR2ntJtPuUMOooiwNmdGJNmWCfTPbvZnw3/e/wEZAjiClg0vcu/k+hvVb4UurSd0kEtUG/cwYIfwk/UB3A7tg7yjnSCR26iq0V1B9jzA6F4Yk47Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9BJe+0y/uYdfgD0pS0o33L7+hpL4Z1mB0nGrbYNQWQ=;
 b=IXslA+c1X4UGd/NFz37nXJD2vyWhYStp9U8+w31YtrVYH6c/IvyxdSVWWfS6i88H3xsRDVGQlRxNSDRcozwRq2DkwSwDg6GNy+IKSSV/N+KwBPZ7MeP1sn8WM9Sg2yQFaCFaBkgmbNXbbOz0HxQxBGdMkC9jnIXbA8rYNuTDKESlO6jw1TnxQEIJv8wYPOVexopXV3XiRLRvht0rJy1c2g4qLMrhRM69vigB2lvxDBQyeDl5ABZIq4OWsCJEpmYt1BthlUStv1ca1GkYopFxrM56/WmLo0yuvBB4+jyr8v5+SEaUXkTcXhVcq9ORvlMPDxf1fVeCVsyMklnT5BAOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9BJe+0y/uYdfgD0pS0o33L7+hpL4Z1mB0nGrbYNQWQ=;
 b=Xr3Ow54ALNvV+9QNhG9Nl+7TnbzcrUpbS6UkKmP0wHFjGz/z6ShAfJEgWvbTthuTHE93bhl0mNp/DN7mPM4nKnGbCPjHvD4sC9bM0I8Ebjs8p1MCcmzIMf+TEy1Ihqg4XiHFR0K2/foozaQQR/+HjRU4F9k2fc3otmsDvB2Wfi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
Date: Tue, 21 Mar 2023 14:51:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
 <ZBRRbnBjWHXAM1ug@Air-de-Roger>
 <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
In-Reply-To: <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0349.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: b67847a3-36cf-45e9-20cf-08db2a1bc4c6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q8NgGwyUY7P82VSvxy7NmoH6J4jMZKXlif5HfWSFZnhLVCbVSyzHhrTDiNLdaqrtM+eVhidefORnqzIk4eWlwxQOaQJPaflxudTPh69oAu+P/dN5n59jy0sphLIu9RHKTZozs9NHL5f6ErnTQwbUNnuuWhLH+Kxx1e7sCjGuneApc3S30KMqy22m5RBVEhV0Csl8p5BYVipexS8tXffjATj33PAr8gXScuc6vpy94DzJhUz1erKjUopwVDEnzxgJQX+/8phhRfUs6wHbuBycUn6KCZ5mN8gK/M2UvkjwkypYMmzkcp1po40rIbt0X4c2cWi8cHoi43Car+Mh7r+7r4inDlAPveu6YSno1jKjFnRwagMeyYY7EMYRvlnB1zFkU3v0C73cMT+1+DHLwD4eneVfkWYCEMSXHSz/9nfyhjO25ES0dICUUzTx20By/ofFPRlh475/F0iiJo4VDb6HJt7xCp7XhRya5bWAUgFhlOQJy+8VrkfJR0Mga6OrnW5VYU7zq9WFTc526fcU7fsTJC1hccOrB8VXnrdixl4HIBkVNLh4aDFVDY6Sn1kLELXsbIgXPXH/ZwKbyH0oq0yt7XieA4/S7fC9Tl6qRz+Z2o8TRJS+hgRpjXBUOoMVrmpNKID55x9U6RTVMwocN70BCpZlMoeN670GUMvl3170WlXioRKUBNolbYF4RvfaFqdrMEXDMwFn2Keb4KWi6GwvVy99IH0fdgt+uYhl4tQ7OmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(53546011)(8936002)(5660300002)(26005)(6512007)(6506007)(6666004)(82960400001)(478600001)(66946007)(66476007)(8676002)(66556008)(2906002)(83380400001)(4326008)(86362001)(54906003)(110136005)(316002)(6636002)(31686004)(31696002)(36756003)(41300700001)(6486002)(66899018)(2616005)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXd1OHpDYy9yZFIvVG8rSlVLbVJUYjA4RHYzNmNmdWFhL2ZmTXN2NkhqWTVC?=
 =?utf-8?B?bjBLWHBXY1JqT1c5RmVrR2x1VkF3QUtSWmhzZStvcFpiM0Q1dDVCVHVFWklF?=
 =?utf-8?B?RHUrNEJkQnhnemVqVE9mckRqbStPMkVDWFdqTXgyNFBuNWYzNEdsN29rQVdS?=
 =?utf-8?B?RklHTm4vS2Vacys4UXNnTkVWeUdIeU9YSGJCNFkzWm4xRWlvTEQ2RmxMaFZB?=
 =?utf-8?B?Rit5UmNPMngwQkdGZ3VjaDdsbWNPMnc0UmNmU2t1Z0lGQVpQS21lUHk3SGhP?=
 =?utf-8?B?OWU4VUNLWGtqVTZNb1c2TkhqTjBnK0ppUjNxQmxYSWF1NFVGcEI4b0tRZ1lU?=
 =?utf-8?B?RDZtK1JpM0h3bkk1YThraWRZcDlOSFRBVVJNeitpWS9TcjVZKy8rUlVZOExu?=
 =?utf-8?B?YWliWUx0N01CdE5pQnd6bnlHQ3l0ZTEwQTV6TXdha1BHMnN6VHgwdUpwZld4?=
 =?utf-8?B?eER1UVMxT0Vld2NxNjRiazhkOE8wU3BOR245U1lGWHRWejkydHp4ZVAyUGRJ?=
 =?utf-8?B?UTJHWjFpdTZqU0xqaXNvZUdHZHpBVklodmx0dXBTSGJSQzB4MlhNT0FqcDYx?=
 =?utf-8?B?eDFSTVEwQWlkb2ZYVEU2eE9vWUQ2OUlkS2xaZE42V3dwNEZOcFVnUm9DNnlF?=
 =?utf-8?B?c1hWVWRsL1ViUEY3elFZaXp3RWlQMEZWcDV5T0t5NXovbU5PUU53dklxa0hl?=
 =?utf-8?B?ZG9ucGFnSisvektROVh0aThpWGRHRGI4cmNsZXBwNUVXZTN2U0V5cWVvQlRT?=
 =?utf-8?B?by9HamJyNzBlNWdIcmY4RG1yRENLcGxBK1Y0ZDNaNTVJZ1ZXNklYUGk4OVpI?=
 =?utf-8?B?V0krang4aGpYM09QWEdvZ21RYWsvOHZCSStYVTJrZkNLZmJCUXcrNklqSjFa?=
 =?utf-8?B?ZklVMFNNMmNSYlpZQTNuTGk1enhwWU85eEFFNEUvQ3RBN2hlczJ4NWFxaFBP?=
 =?utf-8?B?Q1ExZTRjN05aWkE5ay9KRmE1YXUrVytpQktMUkF4cjRzbG10cTVzZ3VLbEJ0?=
 =?utf-8?B?aUFKUlU5N1B4TzVDYVJLMDJ3WTlyc2JSaXU1VDA0aUlIdFNxcHhMOGlXSHpr?=
 =?utf-8?B?ZHkvL0JpVEltc3pzSDN5QmQzcEl6N0w0Z0FxWmJpL3FYSUFLbjZKeWIxQjdo?=
 =?utf-8?B?Wm5KZitrbHhvTXpWTkMvTmRlbjd3eHNBSmRoc1JDTEV2VnFoVE9xVjdvUUFE?=
 =?utf-8?B?ZFlTK0Y4ekNEcmFBOGFQZDh2Z093ZWlJYW52V1BSK2JTbjZ0bklsakw1dUhP?=
 =?utf-8?B?QzhwM1VjbHIwbXdTU0RNamtmVVlKQ21Ob0FqbnZjbjdLYnh4cStMOVRFV3BH?=
 =?utf-8?B?Zkx6QXNzclZLKytnM3hGTXNqTGJ5VTd6cU1rRkdnUzZBUUt4eVZtVHhCRklE?=
 =?utf-8?B?YTZJNFNtcmZhZVl0ODE3VXEydXJ4WDZySXRLUDRQbFpja1ZYK3JpNmx2d0h1?=
 =?utf-8?B?SmszeGUvd2IzaDFxaDdzcEFtdmpvU1Z4anZnVUdYZFEwYkhlM2hxZjV0amdw?=
 =?utf-8?B?SjZIczB2MHorZ2J3UjlUTnVJRmlzVExPc1Y1RHNCb1VwNjV2STJDUUZYaHZq?=
 =?utf-8?B?STl0Rm1YZEpiUHNnYlBjMEdHanJuampySXpzVWErQ2FLVXVVQWhVVS9TUEw4?=
 =?utf-8?B?MldtMy9hcklBTGd5bXZnL2xySmhKVFNjd3dSNUNab01RS3RHanhkWVZkaWZS?=
 =?utf-8?B?Y2ZnTnpieDlHRXg1VXp1ek5ZNGhQMDFoN0I5YXprWnhIcTBONUZEcEhoaDBH?=
 =?utf-8?B?djA0QzdWRFRKaHJFOE1TWmlPdzRGNzZ0ZldJWjczeTEycVF0b3dqMmdWV09h?=
 =?utf-8?B?RzAxNzdpSDBnZHdrNG8wQmkyVmhFZzl3YXdMMVJtZjBES2pINEwvRTJEUndx?=
 =?utf-8?B?U0E2NWNDMFVaN0Nmb3ZaczEyR3NJM1BvVGxEeWJPcitZdzZyblRIa1VWdDI2?=
 =?utf-8?B?bndsMER2c3FqaGV5bVZiRk4vRXNYK1YxR1dtaVdXY2xiblVlWkkxZ1dHOVlj?=
 =?utf-8?B?S0FJWGFNYjNjS0I3TXovSmVqdTR3SGxPZEZkQWZuQmpqWmxMQW1nUGpvNVNJ?=
 =?utf-8?B?ZVdoTmlzVkdTdjZIODF2VHVucTdHamJ5T0JzSG1hWFNyMisvdVBTcU4wMVhI?=
 =?utf-8?B?TlNqZ1ZEdHIyN1lLSDQzOXRZbzlhMXpxUzdmRVJZVFQ5emZwK1JZeXZyUC9T?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KfMuYCXetp//AwuXf73LHb4DWX6SrQhtHg6f8QPLXT5E5VaemCWED7xj2/fOeY4FLTgdUnnFC/Xxp83mtxZuh+rztzmR2jG/nFuhpa1W6Dg+7N44150oqOvd6YjKfRC53X6xii01ww+tWRzmnMSlERkRLGiSCHk+anaq/CxOZfhfCsHGSogdZr5hJi3jZOrGD5W9wnyXp15oBvhM1rbz45TS3jGYlCUIdbSYvh8DqTp+z+Chwt6CV13sOZuSstjHc2N5OtxK9gGVRC7FWCZdwOQdm23akQqCbdNuDjrNuOwgasmmq7ehPMGCK2/YOqZoCZ+81mHYwvpzYnXDJf7+IADf7pO5Vq/EHjGt1N++BrAf7Lz53cUvoCyTa9zWfkJ01KaPAu9L4srZZ6OZ0OYdWf0vJXTATc7kgafNWie2o/g7Bm3IfwrVL/Trb3ldZW4x6BwI/t07voGBpIKhFExRqXacXfhWQZsUYNDx5LY215/VTobo56v7ls+zkVMCj+eOR+lyBBPlKyKtAedxijFgOi4WQx9WbPWm6PWbs1xZQxSi86rO3O/dzrJwj5vVCwOgpFiGYAG9acV2yAXcJLC6ex2fcWINkmuPVmHQMR8lQbK4TvIlxoC2W4x/+4SeorXThy3JqTpPYeZrceh4rk91zLk9gvedN0kzgKhBpylDyj2HnPqOgvjEjln4N8NtCQ0ynyWdloMJH0QuqLywa+xlLiC8NJz9aZtbDiIoDX9VR5Ze3rpN1dQCJpWs70HQ48ZTvKfWe02ROUSHT0wjyO3gBGlrBS+BNsvI+IqHgeFD5xpp+f5KFvmhL5xEuQRrQaQ5
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67847a3-36cf-45e9-20cf-08db2a1bc4c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:51:36.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os6SK0ASxvh5UdWXFKLZh+eD6PjKsom8scddsogiHLB1GKz3ox3qaYSTAqn0GKvDFXapOrDNUQwv5+O8pjNchnJ41o4WlnAizE+fkVgTvpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6942

On 20/03/2023 9:24 am, Jan Beulich wrote:
> On 17.03.2023 12:39, Roger Pau Monné wrote:
>> On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
>>> On 26.05.2020 17:01, Andrew Cooper wrote:
>>>> On 26/05/2020 14:35, Jan Beulich wrote:
>>>>> On 26.05.2020 13:17, Andrew Cooper wrote:
>>>>>> On 26/05/2020 07:49, Jan Beulich wrote:
>>>>>>> Respective Core Gen10 processor lines are affected, too.
>>>>>>>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> --- a/xen/arch/x86/mm.c
>>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>>>>>      case 0x000806e0: /* erratum KBL??? */
>>>>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>>>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>>>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>>>>>> This is marred in complexity.
>>>>>>
>>>>>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
>>>>>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
>>>>>> no longer exists/works.  This applies to IceLake systems, but possibly
>>>>>> not their initial release configuration (hence, via a later microcode
>>>>>> update).
>>>>>>
>>>>>> HLE is also disabled in microcode on all older parts for errata reasons,
>>>>>> so in practice it doesn't exist anywhere now.
>>>>>>
>>>>>> I think it is safe to drop this workaround, and this does seem a more
>>>>>> simple option than encoding which microcode turned HLE off (which sadly
>>>>>> isn't covered by the spec updates, as even when turned off, HLE is still
>>>>>> functioning according to its spec of "may speed things up, may do
>>>>>> nothing"), or the interactions with the CPUID hiding capabilities of
>>>>>> MSR_TSX_CTRL.
>>>>> I'm afraid I don't fully follow: For one, does what you say imply HLE is
>>>>> no longer enumerated in CPUID?
>>>> No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
>>>> microcode fiasco", the HLE bit will continue to exist and be set. 
>>>> (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
>>>>
>>>> It was always a weird CPUID bit.  You were supposed to put
>>>> XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
>>>> on old hardware and go faster on newer hardware.
>>>>
>>>> There is nothing runtime code needs to look at the HLE bit for, except
>>>> perhaps for UI reporting purposes.
>>> Do you know of some public Intel doc I could reference for all of this,
>>> which I would kind of need in the description of a patch ...
>>>
>>>>> But then this
>>>>> erratum does not have the usual text effectively meaning that an ucode
>>>>> update is or will be available to address the issue; instead it says
>>>>> that BIOS or VMM can reserve the respective address range.
>>>> This is not surprising at all.  Turning off HLE was an unrelated
>>>> activity, and I bet the link went unnoticed.
>>>>
>>>>> This - assuming the alternative you describe is indeed viable - then is surely
>>>>> a much more intrusive workaround than needed. Which I wouldn't assume
>>>>> they would suggest in such a case.
>>>> My suggestion was to drop the workaround, not to complicated it with a
>>>> microcode revision matrix.
>>> ... doing this? I don't think I've seen any of this in writing so far,
>>> except by you. (I don't understand how this reply of yours relates to
>>> what I was saying about the spec update. I understand what you are
>>> suggesting. I merely tried to express that I'd have expected Intel to
>>> point out the much easier workaround, rather than just a pretty involved
>>> one.) Otherwise, may I suggest you make such a patch, to make sure it
>>> has an adequate description?
>> Seeing as there seems to be some data missing to justify the commit -
>> was has Linux done with those erratas?
> While they deal with the SNB erratum in a similar way, I'm afraid I'm
> unaware of Linux having or having had a workaround for the errata here.
> Which, granted, is a little surprising when we did actually even issue
> an XSA for this.
>
> In fact I find Andrew's request even more surprising with that fact (us
> having issued XSA-282 for it) in mind, which originally I don't think I
> had paid attention to (nor recalled).

No - I'm aware of it.  It probably was the right move at the time.

But, Intel have subsequently killed HLE in microcode updates update in
all CPUs it ever existed in (to fix a memory ordering erratum), and
removed it from the architecture moving forwards (the enumeration of
TSX_CTRL means HLE architecturally doesn't exist even if it is enumerated).

These errata no longer exist when you've got up to date microcode, and
if you've not got up to date microcode on these CPUs, you've got far
worse security problems.

~Andrew

