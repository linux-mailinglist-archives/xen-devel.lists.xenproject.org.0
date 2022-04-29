Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5745147B4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 13:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317220.536464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOMw-0001Jl-TT; Fri, 29 Apr 2022 11:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317220.536464; Fri, 29 Apr 2022 11:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOMw-0001Hf-Oc; Fri, 29 Apr 2022 11:01:02 +0000
Received: by outflank-mailman (input) for mailman id 317220;
 Fri, 29 Apr 2022 11:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkOMv-0000M7-2K
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 11:01:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5dba272-c7ab-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 13:00:59 +0200 (CEST)
Received: from mail-bn1nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 07:00:56 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5890.namprd03.prod.outlook.com (2603:10b6:303:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 11:00:52 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 11:00:52 +0000
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
X-Inumbo-ID: a5dba272-c7ab-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651230059;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WkM3ixq46/QmwfU/kwCbY4buNEDzge4GV9K1E5SHmGw=;
  b=BVxroKriES6DGZMrZ+WNJzICYKp8MUiy7PI5LwYLBTmZJ7udU4en0l/+
   nSj+nh9Ant+8CQ8ir9S36O3AXnoojllH0cXsvV7Yr6CcwKEz8q26SXpG+
   vqwqrRxDsa+IgZqI4j5iMfBX5qKuI4fVysQZXW2nEguolONczVgZhr9q+
   A=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 70102867
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zMWEx682LWq4xQPMRFM5DrUDqn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 GsXDW6Abqzfa2T2ftkga4/i8koPu5ODmoJiGVA6rn08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3YLoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYbzUgQKPKDlpMoiChMbUB5xZ6dZ3qCSdBBTseTLp6HHW13F5q00SWsQZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvyMuYcwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2QA8gLL+sLb5UDOyD1t07XJauH/IOKDX+lIoUSCi
 nv/qjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtvyRRqju1afowURHdFXFoUS4gaXy7GS5B2FHG8aVT1QQNs8vcQySHoh0
 Vrht9TyHiBiq6HQQH6Y97G8vT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKRNA6Fqew1oLxAWuon
 2jMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:1xkBdqkbMl0CNyYf4/rNpEGRuvPpDfOlimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVnSRULAhKePZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WxDk0nrsALciYsV9MNOA4we7rINoXze2O9DIuzGyWQKEhVAQOFl3bIiI9Flt2CSdgv8KYYvq
 jnfRdxiVMSEniefPFmmqc7vyzwfA==
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="70102867"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV86LSp1n+Wut6d3N3d+8tHPOK2YAaU148iu+Ust8oJiPn/rYtkDkBZ4htQnIzYR1fEeWw0cKTNUkurmQxCdttjuM618CsPnfAvUpK6If2ftD1rFmjtUb28JlXKBRUeADZ479NbQ2P4t22xowWOVzO5SoV1Nx+3QCJCHHN9r1wKVj0Utdr0THjzoXhm/NIGpSpS1pCFVdylJYnvOEchjpBYMvUWuqubZbibUG21aRAcXzhiIfg38ml9EHk/Kidmlue7c3AYyvS63ZKi8BMuRvOOwAYynLN1/KEI5PA/DNKbxEZ6jkf/OavHSWZ/QQAM/S1RomPqab57R0+pbJyF/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9JDzMPrfVicYGsXcEMPT0UKo3t69Qo+iV+CC3lJ88Y=;
 b=B4p3UXE8Q5eg+0K0WtLH0sDySgIRLlPuGB0wmm3NYkPUDT+mbtasSRXlsgsW1Rd88o7+rCSm9uEEHAcwLkhgK6atAVM1iBHKuwXlahK+Tb+vkXlK3RfBJv7jlI6Vynyjj9s0PpX7imZZNj0hsJuVX4zJTNUtYCcKzgBDjlgXKHnjoFThyj+vCQV7DTVKvPBrn/80cOjgBcv6omxQUaymMUOgC6OYc8uh7awNz5ZTmKw0zzdwbFqSo+JFMK10sFhWHF2jAmmdLbPh7y/Bp03DKk8VgMYkkH00574pu27Cfp/L/RdVknBmCsJpCnWFbBRF3K5kFPHLDEv1f3s/M8yQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9JDzMPrfVicYGsXcEMPT0UKo3t69Qo+iV+CC3lJ88Y=;
 b=SnJLURV987O1PFCN18c7HNIle7Htb3/a682q83e74EILEC0ihx0sH439qidGI85gvjDlhixtudLEmC+ZEyYBynPnorAmKPMOy1udkaevXxFDs/laUFMV0Rns8lcLaClKliUxKhIaXbs6l1dujfNjKHI3NRm/ecuaL/THVsM5M4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 13:00:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 169819: regressions - FAIL
Message-ID: <YmvFYK7tk2174HwB@Air-de-Roger>
References: <osstest-169819-mainreport@xen.org>
 <Ymu+WnVjTANHk+na@Air-de-Roger>
 <25a16b3e-e235-698a-452e-bb87920adc89@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a16b3e-e235-698a-452e-bb87920adc89@suse.com>
X-ClientProxiedBy: LO4P123CA0503.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 712020fd-22d2-4beb-da58-08da29cf86f7
X-MS-TrafficTypeDiagnostic: CO1PR03MB5890:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<CO1PR03MB589074E82920F3229790C4308FFC9@CO1PR03MB5890.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7MPlvE5wQgYuOAkQdL6wX6q3UPmqdn81Aray6ydKHMOrJMjI+DvoA//XVpZP7j3woPfAow2VOw0T+Vr5cTk3kfq3iyGwzCMg3XUZYQ9Ggy8B4FZFYF7Dhg8zC0XG5paa3cGebRMlMHO2VinmbDH/NKS/nFz3H7yPo+/RGGOOlSGcnYzu3IplN0D2MMnfJCFZyTAVEBVAj3Kpe9i+pFkLREAu0L/6yjdmb2Rq8mEmsK6itXJ4dHvxlndoHc1HA/cKwkWhNfhq2w0Pi1xe6/33PcBU19m7yoLY4hLhJ/ae+pUkFtAPSjw28flCjOP1zioObmG1KIkdn7NhYLxdBG4LvUFMHcjoI+XRwN7o5BuZFY6IZ10WhSjKFuHOHGyD3ArPJ5QbHRt630oNmRGwoJSfXiIGRxYzlI5xEBNPlFIcU1f8G5KSVn3KBZ+IzZ9hzXzt2FeeDDhG1R9iFFddBdVWG6Y6S0E+X7yVNafZqlp18ykr9V3hhNmnxuT6GBEjYGViVzBv4t6jVdxgrHbEDjle4XcP/h5ZJnJkbYPz+2KjbJJzpODxXzJcV6agHWbLWLh/CqpEWDmusYeZ5t4cZbLq9nKKvVghFrzG0Xzl/nu6UnDu5oSELaDHSqBa4NzTsBLEhJ9269bGNFVfZPgmdguJvpG8U+86mi4WV3ei/KSar9oCfCO3f/TneV3WhxOvcSXbEV8Qz9mR68FlvWdPlsWttTDwsDoFsFsXTOdr4WwPdQ5DGvk4PJEvUvuFGxxxzv79eB1v4EreuJ953qFd3ue5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(66556008)(66946007)(5660300002)(2906002)(33716001)(66476007)(316002)(4326008)(6916009)(8676002)(83380400001)(85182001)(8936002)(54906003)(86362001)(966005)(6486002)(508600001)(82960400001)(38100700002)(6666004)(26005)(53546011)(9686003)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alBONi9oV3VBRkJNMUdsMUVMVnpTMnBGcUV1SlN4N3dlSksvN1RoditUMm5u?=
 =?utf-8?B?YzFkSHROc3BqVGMzTUxPWHdMYzNDcmpFaFc1YzVneG1QRFNaWVFDc3ZiV1lz?=
 =?utf-8?B?Y3hFR0JJaG5iZWVtMnhjTnBRMG5MZXlwRjFNcXV3MHdBbUtPZWhqYWhrdTJm?=
 =?utf-8?B?azNkMVREMUI0UFg4N0M0VFJoUUp0eUhNSTA3cm9lOHR6OVZVWDdjSGdRZnp4?=
 =?utf-8?B?UnRpT3lkYWprM2E3S1Z5dXpHcndKMXllbWE1MnFSVm5zYU5CM0wrVmh3anBG?=
 =?utf-8?B?VFZSQktnT1lBTVp1Z216WjlIQWk3bjEzNWtzR1JMbjMyTS92N2xjdVJVNEMz?=
 =?utf-8?B?QlB5YWZxVEg1YkU5M3hDQUttT1V2TzdLSlVTZ1F4MVAyR2UxVmZmV2xndjQr?=
 =?utf-8?B?YkRKNDVKbHZSbmtDOURYUVJwYUtNSjl1MXJxMGlEcUpEMXcxdGhURitFMkMy?=
 =?utf-8?B?TytxQ29jdTNhallKYm9EZEhVc0Vsdmowa0R0SGE4ckJpdGJtRjZQcThJd0Nm?=
 =?utf-8?B?eHlrMVY1UmcyNGRucUJaTFM3S1pIVkQyU1F3WUt3bzNKQXo4dG8vN1RxWEJZ?=
 =?utf-8?B?RnVSZE15all5eTNaYkxqT0FEOXRxSklPeVBPenQzTE9ldW1BMGdINjJhdExB?=
 =?utf-8?B?NmRnODFPWE0xckpxdFBmSHlzQmhHVStyT2xCT0h2eXZzSGNLejRJaXFHUGVX?=
 =?utf-8?B?MHZzMzcxYWQ5OEN2MnBUVHdzcjlBaVBQRFJZZFZoV0x2Z2pYbWZjMDB2S0FS?=
 =?utf-8?B?blVsbFZZQi9vZ0ROUDVoeHZ4czVjbWNQUGVOdFBxbEZ4d1JhYmFtT2p3VXBK?=
 =?utf-8?B?V0gxK3hUNmE0K2t0NVRoQjFycVVZby9sQlZ4c29ON09ZbFBybkxkSDlNc2hE?=
 =?utf-8?B?c0FGblRDNEFqS3EySVF4K1RmZHR1cmdRVTFvUDE1T1VCdzZ6RG5rcUIyV3hy?=
 =?utf-8?B?M3hBU3pZSzBsQXFrVDVocWZnbEZ4dEFEMFZGU2tIL0tkQll0OFkrekk2Z2dr?=
 =?utf-8?B?SmRIQ3FmQ041YzlTVHlrWlNRVHh1aWQwekRLazZVNmZmVDJvdGl6aHpPUnhw?=
 =?utf-8?B?K0E0TzJGbHI2OUhDZTlGQkl2RDJwUm0yUlVRRXZ4aHNOVEVCaHA4UTlyaDZr?=
 =?utf-8?B?eHNwTCtsem1iWXhQNnEzS0xHdXRGakFsRFFQQ3RBdDVFcWRZS3VBRnQrUFRs?=
 =?utf-8?B?WDN5cVFzUGhlZ2krOWozb0Fjejc5K2tjVkZPM3VvdXZZcmF0RHFzU1NYSjd2?=
 =?utf-8?B?dmxSaUswN1F1aXhnbkNPZGxZdEJEN2ZkY28yenZoaFBJVW1BZG1Sa0w2cDN1?=
 =?utf-8?B?NUVaR0RWNlpldHFCZVpYZ2xUOXM0N000ZW5oMGFvZklIUVJXcHg3dFQ1dGpm?=
 =?utf-8?B?S0xnNjFjc3djcHl4VGFsWTlPYWI1V0JPSUQxRm5sRW5TSnJhNnkrdHVZM0JS?=
 =?utf-8?B?SFZBVm5OUWpoakFJSUgxYlZlSnAyV3BsTTQ2UDZUcjB5a3FvMUs3aUJuZVI1?=
 =?utf-8?B?QjQ5RGtOUHl3TW1QMXh2aVZORjYwUmFseEkrQU5sUFpVRXVwUUpyZXRzdWY3?=
 =?utf-8?B?TnlXcytKK2pNaUNaS3lNdDNsTk9DT3FINHc1RkJXYmF5NEM4Z0VzUDdhSEF1?=
 =?utf-8?B?dnFSWGZYdGlMVzZQbEVFYlI1MTVrMGpTMHh1M1B1aGh3My82L29VSVBOQTQ3?=
 =?utf-8?B?cTRGSGZYRXVvSUVaTUNpeGVEczg2NlpQUENhOXFibkl0WWU4cEdjUTFkQVBu?=
 =?utf-8?B?bVFCZllJcDVSaXdpVCtUTWN5T0luZyt5VFB2YlA5WEJPRWVtcUYvNUxMZHVj?=
 =?utf-8?B?aldZOTJkVGpBbHVFdE9aREpwMUxUOW9DTlJOSGdXUitTUUxjS291czdZMzY5?=
 =?utf-8?B?cHpMRlhVRmxqNVpyOExHalMyT1RtZXM0MlByRE45Kzl1ZklOZmNvYlp3REdj?=
 =?utf-8?B?YnJoYVFpY0I5NDRFQ0lQWERLN2U0T1RKUUp3elBkeEhzUkJ3VFpENlp2WVNL?=
 =?utf-8?B?RXNUbTNlZUwrNjhJWnZPemVIa1ZsUklVSG4ycnIzL1ZNM2c0ODlQZHRNVFRE?=
 =?utf-8?B?OG9oWHc2SGZNM1o2OWR3dWRPK0NoUWVDVHVmSStqb3g2KzJQYVBZcE4reWpE?=
 =?utf-8?B?czhMQlQ0NFA3RGZWK2J3cjYzYnYwMjhtM2FBNUdTRW5sZGpEemlHWkJvdkYx?=
 =?utf-8?B?NWV0eGVSRnBBY25ZVjBYUkZIUWFRK1NpeENMQytSSmdKYjdVd2lKdWY0dTNP?=
 =?utf-8?B?WnJTVkJUOTFISGdHanNrNzhucWgzYldUVG1mY0s0aWcrVlU0VUhuZ0JQNUZ6?=
 =?utf-8?B?Q2FkZFVjUEVNUFJCdzBsellSaUQ5OXhXbEF3YUMvZll5THc5Q0Z6Y09BajB4?=
 =?utf-8?Q?NvWUBs5C31PlUdC4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712020fd-22d2-4beb-da58-08da29cf86f7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 11:00:52.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOmLnaYgF5Xqi7cAUGSFNglPYsL/ZrRaIeqd3HQBUiipgj6W0M8i251H50ymqRGexfuocHv4Ava2iL4ZQKsVug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5890

On Fri, Apr 29, 2022 at 12:37:13PM +0200, Jan Beulich wrote:
> On 29.04.2022 12:30, Roger Pau Monné wrote:
> > On Fri, Apr 29, 2022 at 07:46:47AM +0000, osstest service owner wrote:
> >> flight 169819 xen-unstable real [real]
> >> flight 169843 xen-unstable real-retest [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/169819/
> >> http://logs.test-lab.xenproject.org/osstest/logs/169843/
> >>
> >> Regressions :-(
> >>
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 169775
> >>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 169775
> >>  test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 169775
> >>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 169775
> >>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 169775
> >>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 169775
> >>
> >> Tests which are failing intermittently (not blocking):
> >>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 169843-retest
> > 
> > Looked into this one, and it's slightly concerning, guest seems to be
> > stuck at installation:
> > 
> > Select and install software  [  481.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  509.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  545.093820] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  573.093809] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  609.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  637.093836] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  673.093957] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  701.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  733.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  761.093817] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  797.093898] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  825.093863] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  861.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  889.093945] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [  925.093974] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  953.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [  985.093832] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1013.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1049.094031] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1077.093860] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1113.093938] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1141.093803] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1177.094051] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1205.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1237.093955] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1265.094004] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1301.093835] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1329.094039] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1365.093883] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1393.094167] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1429.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1457.093900] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1489.094026] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1517.093997] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1553.093996] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1581.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1617.094076] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1645.093882] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1681.093896] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1709.094022] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1741.093870] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1769.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1805.094017] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1833.093837] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1869.094043] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1897.094101] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1933.093879] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 1961.093933] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 1997.093952] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2025.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2057.093895] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2085.094172] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2121.094018] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2149.094021] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2185.093931] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2213.093864] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2249.093951] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2277.093899] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2309.094054] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2337.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2373.094111] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2401.094132] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2437.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2465.094003] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2501.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2529.094050] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2561.094027] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2589.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2625.093999] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2653.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2689.094024] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2717.094093] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2753.093913] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2781.094095] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2813.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2841.094117] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2877.094041] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2905.094009] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 2941.093893] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 2969.094085] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > [ 3005.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 3033.093917] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > [ 3065.094060] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > 
> > debina1 is one of the boxes I've put into production recently.
> 
> ISTR this issue having surfaced randomly before. With the randomness making
> it difficult to investigate.

Indeed, it seems to happen on other boxes also:

http://logs.test-lab.xenproject.org/osstest/results/history/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/xen-unstable.html

At least doesn't seem to be explicitly related to debinas.

Thanks, Roger.

