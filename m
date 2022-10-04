Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983345F4120
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415414.659984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offZA-0000kU-WC; Tue, 04 Oct 2022 10:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415414.659984; Tue, 04 Oct 2022 10:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offZA-0000hr-Sp; Tue, 04 Oct 2022 10:54:24 +0000
Received: by outflank-mailman (input) for mailman id 415414;
 Tue, 04 Oct 2022 10:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1offZ9-0000he-Oe
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:54:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6a64730-43d2-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 12:54:22 +0200 (CEST)
Received: from mail-bn1nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 06:54:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 4 Oct
 2022 10:54:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:54:08 +0000
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
X-Inumbo-ID: e6a64730-43d2-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664880862;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ylt5OtFnLWdrLLv8DhqDaCJzVv/746TlSl1qmvWampU=;
  b=WGkPDpr/yO4GgvYUQ7gsRgaB2ZMFF76h1gFcQwPwZt3RlgCZFedU+dMy
   Gp3CuYybxh8lQ3Rf2LT0We3nJDq5YYANv8roLuQUaifbRUFT5kCy4ZetJ
   1HnluTRk8EppNLFpWTMDG66Lw0m9QC2RKz6MjanioNCNxmM+tCtLHmS2R
   I=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 81052410
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PwISlqB8aP4CghVW/6Piw5YqxClBgxIJ4kV8jS/XYbTApGwhhTYEn
 zYZXmqBPqvZY2X8LdFyaNngp05U7cDcz9RrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk25Kyu4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2lvMtMkxu10XlhX/
 NM5DxosahO+rcGplefTpulE3qzPLeHNFaZH4DRK62icCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAB7g7PzUY0yzG7IAhZyr/iPcCTYtWXbc5UglyZt
 iTN+GGR7hQyZIXHlGDZqyrEaunnhib4QIw0LbKD6e92pwC19FI4JDJMSg7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBzb0x
 DybqTkksL8ah8ULyqaT8EjOhnSnoZ2hZgQ4/BnNV2SpqAZwfpe4ZpeA4ELeq/1HKe6xblSHp
 mlCpMGY48gHF5TLnyuIKNjhB5ms7veBdTfa2FhmGsF+8yz3oyL5O4dN/Dt5OUFldN4efiPka
 1PSvgUX44JPOHytbul8ZIfZ59kW8JUM3O/NDpj8BueiqLArHONb1EmCvXKt4l0=
IronPort-HdrOrdr: A9a23:ly0GUqmShBB+3on9RBdqlx0sM6DpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cFzp/8tHNxA7dg6MLqK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.93,367,1654574400"; 
   d="scan'208";a="81052410"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqN/Q2c/vvH1tVF8xg/81UhuK3NX1RkyCmfRam19UDANLciyhcadT7MoPwuAcS8RUfsa4aTVzBN7gMtSE4b5+Trwtwn1hq4yUrjMIyXprNoNnuqrS5hdwd2kI+dIGgMXzE+FwUG+qumj1V7BkoRa30YBHmy1v5KqffBEHHWbWHC35gokJe3EeGzBXipgodhz0xibgnkeqe++YKMYAS2Y6AklMZA/mJJlIoAdumQwqyPWeMqtZhRu1bcFlUqaqGpQLfmHzv5uxDKANbZrbCf34L6M90A7+6bkb0edkoVgFH9Dyl3sSvo/Qb268KVlOOxDoIrn69t7gLwOKmDr0JeZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myCsOPLLwvskPzUEyXFnb7Ryw7+J9JKMiPDJIwkI0tE=;
 b=QREvQib2I3DRbmKvh/U9KtXt7CVM6g69xf/HkpDEuixvcao+wdAStZYFskIBx9hl1pr8EnZ3BOFfR+bjoF39OU+TB20yXi6Gs3I86dr1jl2Ydf3oUT3W8igxIxINPJdGRXKzWB1a/Y2xtRLah37lCGKYhtXlPJ9/Seno5yB1PxOAVFNRvVMFVyhi2oehzmZbdankYNIeYlVo641ZRckCgBX9gu1X0H19MjbCRxV76JMJ3l3/FEV6UOKmYhFwFS5bhnqrLMH+kpwpD2991pemonTAi7Yv1UjezjlUNe12uHPC5n7g6tVjXYdk7pjZd3zLxvPwzDYEZ6jW5h04RLq0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myCsOPLLwvskPzUEyXFnb7Ryw7+J9JKMiPDJIwkI0tE=;
 b=iObj3qVF0DUEmrsbB7NGixADsVLgP4gAk9Qs4vXoYXrmSyPVb9YPwj28kvLvdL6T6ceTvEBVLiiOhQVo2sNBr1IZIlXnCy5SrPGOarx84v++xthc9ewcGnrtiyfGysJ0B+m7LaTPRr0EFszpCDteol11wbSesXq7Es9n2jKLMVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 12:54:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <YzwQymW3jkfzUQrI@MacBook-Air-de-Roger.local>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
 <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db9856f9-1777-8fe5-5b5a-ef3f132193dc@suse.com>
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2020de7e-9dad-4a0e-06dc-08daa5f6c2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bL2xfndXbytpPrBpSvqgNUy3I+/gRvyjUO45JFYwBMu+kc8kUefwQ/xJKta1nTx4JmtQuWJB0v3XPO8sWlW4rLiWNroSI5pDMXhkCb1lap7pDjovDb+mwaeBwGuD86g+tn/V1erFYdMdwvqjltPj1NhSIGhV2HsmbVD5Mxlb8r8k/73B7kjPTDWRUu6Hy/Hg0nuoczB0chu6LIghTFGUFUc2oLEG47f4VMWEZ/7B0n2VR/AKFw5WW5J0B2efcHZtnXjpGQknTPs1KyoJ821w+jJSRylrYgg0629eACzkQf+Wk0OpC/br9z6Y7CS+J2Dl3e6OazsVbixzzdRGh8RgIZwDSdvbqv//vEu3+ELtwGdgLjilH9qvxG4pCAYHiaJvn7NxhgJYd1E8Clk52RAUJXtYV5NhzRyX2dIL24Uujglb5si3O17hM3/Yl7Fr17TtWDr+1UZqGCad9sStfEv0F4H39qpWcwkzCDLdnDbOpeXIeTlNFBd1ivSw0wina4CkRJgW3MClnAc4SldAek4hEH8oPA53jkDaF4DTLfoxtw41YS4dVQBjzqFBzxn3ERiZoo74MbCnv0sOK9JI7ui07FM9XbljZ4laO82DCORq2WvnZVBwCDyI/mbFogPFIx+lNyPakVDMp2Mn1rgTWXkY8ETPCn4bSaAyV4I8SXvs9TFV83UYPxypE3v2pNLgrKhVbS/dv3NgDqPzxXRw6cIrCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(2906002)(4326008)(66556008)(66946007)(8676002)(66476007)(316002)(6916009)(8936002)(82960400001)(6666004)(478600001)(26005)(53546011)(5660300002)(6506007)(9686003)(41300700001)(6512007)(6486002)(38100700002)(186003)(54906003)(83380400001)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzIyRTFqa25rR2JmWC8rZm9wcWJuRXZ0a2JtVk5mV3VZQjdHcGQwNXJmckYy?=
 =?utf-8?B?aXZLYUJ5MnFrWXBnWG1TZjJWd2hvNHZ2WWdnRFE0cW9UWjRuM21UbHM3S3B4?=
 =?utf-8?B?a2p6VEY4dW51UHhJQnFCcWpzVmFycDZwdExibFU0eFgrV2pyenhHRE05V3pL?=
 =?utf-8?B?aVFXdUMyU3I4WEdjK2NkNWJselBUSGI3V1I0ckhWZVpzZm4vOTZGaEVMaUli?=
 =?utf-8?B?WXdkYVRDZUFBYURTcDZ3NVBGVkRoaGVYaGNYY2FiZTMrT3EwT1hPb1B6bG1w?=
 =?utf-8?B?NXN5OXVkbHpQYVlDVU50M2swVWZyYjRHQ1lWZnRkbUZwL3pnWTRnQ0lCYTA2?=
 =?utf-8?B?cGJ5QWt2c0hoZ0F1eWZYTW5ZTDNlMlY2MmlnZ213UmY5MmE2NnYxT0VLaWlt?=
 =?utf-8?B?ajNMM0poVVhMVXFVUlhtOFpOY1RJazhWZTEyTGFYU1orLzBLNDV2eHluMzJ2?=
 =?utf-8?B?VUV6cXZJZysrNWdrclkwZmlwcmFKbDNjcmtvU3lDTElzNlpNRlhZWlRRZmRY?=
 =?utf-8?B?SUtnUHhUWml2R0JBaVdxRnoxY2pDRUx6b2VyZ09vSERNYXFpTEYwQTlVMTZx?=
 =?utf-8?B?b01NTnA1Z01rNEF4R2tMclpWdkUyemJIUFRScHd1bTNWZnZITHZGZGpnbFpL?=
 =?utf-8?B?VUY1cVE0cVpSNDBRb0J1cnViSG5mMFgrRXNGei96MDhpb2c4MXRKWTN5VGZI?=
 =?utf-8?B?U1ZzTHIzWVJsWTJBTkgrOEJoTUg4Rm0yMWFFSStXbTA2dUNzdG5qQTBnYmhG?=
 =?utf-8?B?VjFxZWF4STFqZTJ1TytRbjg5V1Zpenh1SDNNd3RCdUJaTEZLbWFNRXRQR2NL?=
 =?utf-8?B?MncvdG43eDMyWkc3RDR2Yi84cmlGTjJ1UE5PaHdUV1NwSEpmcUdCKy84aG92?=
 =?utf-8?B?Q1kwU3BjWGMwSEpqZ0NhNHNjRHpUUjdKWnpvNTEwRHMzYVBSU0FsWFNweXdl?=
 =?utf-8?B?Tm5rUm1kbVRab3FwSURNbElWaTN2K0hudVgvb3JvSWUvSTFXQ1FxeW9LMFkv?=
 =?utf-8?B?ZWdnRmt5SzBhN0JIdWJoSmI2ZmtNcWhickhNN0RXMzRtV0p4VDBobW1GZzlo?=
 =?utf-8?B?TlFkZDVncVpNMW5nVmtpNGlMaGg5Sjl5djBiM1NZNkRrSHJRUzNuUlJHa2V0?=
 =?utf-8?B?RzNlODNqaEYvMkFnRW0yR2hJbElNN0pTVXZocmdEVUJrb0I2aDFMNGtRNjNx?=
 =?utf-8?B?MTB0RE9nekVtdHNReVZrdGh3RzF0eWkzdU9oNUg3R0dtSGNoTmtldjVMVlVn?=
 =?utf-8?B?djkyaTFVcWN2QmZRTU5xMVJySlk5a0RCRXBHUXhzaHA0NG5qWUpVTTZUNUtk?=
 =?utf-8?B?cVpYbzRremxUcGlXL1lCenhOblNwMjczcGNDNTNOKzNibklVOVJmVEppSjFZ?=
 =?utf-8?B?eUNleDRsNzBmU0JlRldFbUZCZWhCOW56bzBrS3lzVDQvTVZLOXgrS05JOHpB?=
 =?utf-8?B?cUltK2FyYjZidU5XajdyWVh3c0hzQjNBVGRDSmxZbGpDTkI2clhhTURtMjdF?=
 =?utf-8?B?OWZqcmRFYWd2RGdKT1pNODcyTG9lMHhGdU1nZUZuMGkvN0swOWErN2I1OFo3?=
 =?utf-8?B?cEE4SVlPV3ptNHFmWFJVL0NXRE1qMFV6bngvTnRhUER4djFpZThZQ3gvdEZ4?=
 =?utf-8?B?TFBBOENuWjhuSjVDM3p6UWZ0R2M1MjVFcm80UW40U2FYWi9wODk0RW1ZanEv?=
 =?utf-8?B?VnJmL0p5S1EyQlhXVVBzWUJQME9oVUdvUEEweHlOZjduVDJxQlAxUTVqUHI5?=
 =?utf-8?B?bXVyeDlsZHh6UFFmSmtJbXp5QnpEU3paQzJOTjhIOEp0NmVTSHY2SWJpNFZq?=
 =?utf-8?B?UkRaWTlGRkdBc3dwa0tLUHp2RFcyTjEvODVMWDZWbGlhWnRSR0F0TUNJZ0oz?=
 =?utf-8?B?aHAyNVdmbWJDOGxzdm1CZlQwb0cxNkRRbXpIQktXcm54c2RVbFdjU0t0eU5P?=
 =?utf-8?B?dkdVWXoxZG1XYjFzWmdhcDJ3SDBKK050RXUrMVJheS96a3FVbzJMYnY3SzJW?=
 =?utf-8?B?bVVIbmNUbFBiMmVaK3V5L1U2N0F5ajhwT0wwWDRSdURIdHl0Q1hqUFpqWkNI?=
 =?utf-8?B?SzNIdmo0UlpzSkYrcWFhaGFEa1ByTi9DbWR5aWVqaUpUS09sU3hrQm96aUtl?=
 =?utf-8?B?YVZNV0ZBS29ZdGgzWVFWbjJ3dmhvVTFFQXQvRGswUkZyWlYydGhRWThDYzl0?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2020de7e-9dad-4a0e-06dc-08daa5f6c2f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:54:07.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89hsky6PaUL83Wxg4bUpHbMx2Vskt87suXf1bEnckAAHRyBYEcTMM0P8TiFt6RJ/LGQQ+Ptbx9Jbzos14uNhIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6428

On Tue, Oct 04, 2022 at 12:44:16PM +0200, Jan Beulich wrote:
> On 04.10.2022 12:38, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 11:33, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> >>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
> >>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >>>>>> higher priority than the type of the range. To avoid accessing memory at
> >>>>>> runtime which was re-used for other purposes, make
> >>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
> >>>>>
> >>>>> What about dom0?  Should it be translated to E820_RESERVED so that
> >>>>> dom0 doesn't try to use it either?
> >>>>
> >>>> I'm afraid I don't understand the questions. Not the least because I
> >>>> think "it" can't really mean "dom0" from the earlier sentence.
> >>>
> >>> Sorry, let me try again:
> >>>
> >>> The memory map provided to dom0 will contain E820_ACPI entries for
> >>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> >>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> >>> overwriting the data needed for runtime services?
> >>
> >> How would Dom0 go about doing so? It has no control over what we hand
> >> to the page allocator - it can only free pages which were actually
> >> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
> >> DomIO - Dom0 can map and access them, but it cannot free them.
> > 
> > Maybe I'm very confused, but what about dom0 overwriting the data
> > there, won't it cause issues to runtime services?
> 
> If it overwrites it, of course there are going to be issues. Just like
> there are going to be problems from anything else Dom0 does wrong.

But would dom0 know it's doing something wrong?

The region is just marked as E820_ACPI from dom0 PoV, so it doesn't
know it's required by EFI runtime services, and dom0 could
legitimately overwrite the region once it considers all ACPI parsing
done from it's side.

Thanks, Roger.

