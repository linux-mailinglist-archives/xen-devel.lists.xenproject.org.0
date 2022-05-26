Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D6535255
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 18:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337684.562352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuGiy-0008UN-2q; Thu, 26 May 2022 16:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337684.562352; Thu, 26 May 2022 16:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuGix-0008Sa-Vl; Thu, 26 May 2022 16:52:35 +0000
Received: by outflank-mailman (input) for mailman id 337684;
 Thu, 26 May 2022 16:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hIDY=WC=citrix.com=prvs=13841949d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nuGiw-0008SU-IC
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 16:52:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b48cb07-dd14-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 18:52:32 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2022 12:52:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN6PR03MB3026.namprd03.prod.outlook.com (2603:10b6:404:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 16:52:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 16:52:26 +0000
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
X-Inumbo-ID: 3b48cb07-dd14-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653583952;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D1iy85bGt0AMepCcoTnsVf4tZhW+lfptrVVB8EvquZI=;
  b=PBCC69kzwJnh80nr2/7IwYjjsW5dFK/qJmvyluvo45DOxTieShfMgryN
   WLrkr1TAsq1fMBoZGhpUMAwchKfl5fS1jhkKLhaVt6qf576HJd5N4/lJZ
   8ev5IIPBq2h/50+m7qyi1ALfVlgFn8o7MMFyki7kdkvYu+X09/msjSK6c
   I=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 72662236
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6NKigKP3sd3ezDHvrR3WlsFynXyQoLVcMsEvi/4bfWQNrUp01WZRn
 zcfUDvSbPeIZ2P8L4hwbt63pEkF7J7WnNcxQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 YsXpbfgawESYqzltvw6bQkBNQtTBPgTkFPHCSDXXc276WTjKiKp6NI3SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7H9aaHPyiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2IC9gzP//Fpi4TV5AIg1KHBIMLLQdqxZPdwtWiIv
 jydpXusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/f5F+fD21dFzpZMoV57YkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:sxtivqmdPO5mT2PjC2cEzYjD/6LpDfN1iWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SEDUOy1HYVr2KirGSjAEIeheOu9K1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge6VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPcf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcdcsvy5zXIISdOUmRIXee
 r30lAd1gNImjXsl1SO0F7QMs/boW8TAjHZuAelaDDY0LHErXoBerZ8bMRiA1rkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4YkWUzxjIiLH47JlOy1GnnKp
 gdMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Uol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+93JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9N1lVnQ6dvv22y6IJyoEUHoCbQBFrYGpe4PeIsrEYHtDRXe
 q1NdZfH+LjRFGebLp04w==
X-IronPort-AV: E=Sophos;i="5.91,252,1647316800"; 
   d="scan'208";a="72662236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dth5Ugn2ZdVh7iCOC4x+qgus7DNseEfddRwZlqIBMARMnLdBh8X5n3EFjI2McixrUl+PRMaJKFPJoxRxrNl4AjgpLoqWsxOBsGv1hm9D1rHxKxLbXXIwLhLLet2Nc/8sOEnl88aOnNb/QXU7Iogim8AQGoBoVBUAVcr2m9VLQ1F9nukWYfo6HqFYUzyoHdsrYHmtRQPKmaMG1fmSns/AQXmN65Y5Pf7+n6TCGpKZUiv6Ue9cG7DILfnQtA2MLWWINf/kmv+MQnmwO6Tyexy32EWtXyQdu1lRdZfbDohYihPnYVWq8W71oGHfz4yzDYUUG4KQuOM5n9vURPKsPPLftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1iy85bGt0AMepCcoTnsVf4tZhW+lfptrVVB8EvquZI=;
 b=U6c3jdGrwBKR0FgTsXUrJvbiY92dQ96dHMn3EH65hFXBBG5vAw0wEUkRpCdxL4NSD+yFBgRAUOGCVZu0CdJRYPUAvtw0nhyzE+prhGuSGFRn2cyNrEyf9QRkmDfaRU+0ZWopOOiJlos6+M57ZBwnZ1Qf79AcKbMUC4ra/OX+1lCSZ0XKqKIqkcMhZPh+RcMpVEsVr4y7H0jLlz+jpjEcykg1QOsk8jS5nSSohCwCVFDv4JsL/FcpXKfy4iIB+TjcGnmeAHkKwWPnBiWh5iLE6jSbAJMcuXCQz+Pyiplh4umV6FQwpbDgn29Se/NJKL4+VkOzLuTDeGIVvmrpgL3VjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1iy85bGt0AMepCcoTnsVf4tZhW+lfptrVVB8EvquZI=;
 b=veeGb9ewe47gg70FqeabkHCVIcNnjPi+E+iuzLWObNXqj33zZfBpL/rFNPw4ln1wm7VblIC3f1UBO1M6qjh7hzFaMYOoR7Tc5hv1NfPIkB9tEhO9AqxYyyUTBDgUZ0YF3shaUkcZ6VFi4gYjSaw1oN6hXT4b05+7+KfWcMIELXo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/mm: Remove unnecessary mfn_valid() call from
 get_page_from_l1e()
Thread-Topic: [PATCH] x86/mm: Remove unnecessary mfn_valid() call from
 get_page_from_l1e()
Thread-Index: AQHYWj++Z1s5A5v8NEKWGg6sIKRPsq0xdrWAgAAWwAA=
Date: Thu, 26 May 2022 16:52:26 +0000
Message-ID: <0a02d325-db7f-7201-819e-cb842d714571@citrix.com>
References: <20220427140400.20152-1-andrew.cooper3@citrix.com>
 <d312593b-fbfc-b006-6959-c97a2bc6e50c@suse.com>
In-Reply-To: <d312593b-fbfc-b006-6959-c97a2bc6e50c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9c52a4a-36ef-4092-376f-08da3f381d17
x-ms-traffictypediagnostic: BN6PR03MB3026:EE_
x-microsoft-antispam-prvs:
 <BN6PR03MB302661F17000C5872EAD8B03BAD99@BN6PR03MB3026.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YajB9qTLaKTkUgkxgB9edrl6a1vEFo9oUQBUbG+INCAiYJBs2FJe/N1rio5Q+Yk2zWlpUVPY9gfS4DsrkpvTr97+4x60Mcb7+UX+UlyukWMYjWSCV1JAtTQG9oCHG1Q9FybqmUygYj84UJsozVI4Fh7Z2NzNiAj9UX9s4LRRlYgsiYu2tBE0g8OfGepjoERnBfWIzbb/aWwC6pCkmKReDgLSKq4d1lC6BUnMS72kzg/qSAxBZCZ6II5SGGh+Vv/kL8XxRZeWAKx4Q6Xv1sx7+Y+a1w7+E8yl/lDEbZkmKxdLDIDKTvLoFZYvAQNK/Hv+qXfyk738mxOUvwZcMX1psW0IGtCVK7t5njEkVT3RRROOoOu7Uabwn4/t9qtBQNfcY3+vGy9zVPDQz/fpnGMUJkf6j4ITQ9Q+H5pnHUya0v1fthiFTtbmgW5Xpqp7IGbtECwYRpUQCClRtjfxIQHklhlRUBZmaNfKCJuKISGmCETamT1HhIrwoN5LbMXoM4qLaRpGj6dUIU1fsDmdcJUbwmkuCRfEMaKZhfZPk1ViRXHT2Vdg9hBMvb+3T9t2E9M24G5V/CRCiBvBGb8TuKF8EPudU8jmkAnNmeCXwvueU72vO8szI6fhil47CG4gqc86Lqfi6QyR27YAzjM9PebsCPiAmBcwfrVjeha0MBESo4ZZn8cf+uHKbzLtG1IJAnomcjqGCcfiiwWlflvhc6aT9BA30xYDeEilIGc4OZpbHk0LBqfcCd7Jq49ZkMPTf8cgFo8Q4xcgm6tBblGDdtqjJw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(8936002)(31696002)(2616005)(82960400001)(36756003)(38100700002)(54906003)(6916009)(316002)(53546011)(6486002)(66476007)(26005)(6506007)(186003)(86362001)(6512007)(66556008)(4326008)(91956017)(66946007)(66446008)(122000001)(76116006)(64756008)(8676002)(38070700005)(508600001)(2906002)(5660300002)(83380400001)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFBNRGRiazUxcTlnaldSOE1ES1Z2NVh1U0syNzBmajBWRndlNUl3THJ2ZDg3?=
 =?utf-8?B?UlhxRWpvRzFhU2piVWxOb2tRbHo5U1VIa2lJQTlNbjdsRjYrWWthYWo2ZHBL?=
 =?utf-8?B?eVA4OEVTcHNaTWxFV1B3akthcUZYN2JvbVAzdkdQY0dZWDFzS01FTkJFQ2pm?=
 =?utf-8?B?aEtwMlRCeTIxQnIrcXNodC8zaG1yaGczQXlNUld6VDd0Yi96N0xRRGtCMmFI?=
 =?utf-8?B?a1JYTW9LZTN2cXM5M2VXSllCV0o4ZDFUUGxGeU9pWmo4UnI1dlZDRk56TnU0?=
 =?utf-8?B?cFZiSFdyS1lPSzhmVkUrc1FGODIrSngwNWdpUkhkZjZqd2VIWG81RnR5SzhG?=
 =?utf-8?B?aWRCbjFKVlJZQVdacFpUbFByQURZeHNjMTlRa0lCM3BvZGZDaGNud3ZtQnpx?=
 =?utf-8?B?L3V3bVhhM2pna05vTmR2WjUyTk9vQ0tlRU53RjhUUW1QUytBOXVVN0FHdENs?=
 =?utf-8?B?RExoaTRjdEdTbkJuOEpqZXVWWWZXRU00SjlzT0FsNis5by84dU5lRXNKVkVZ?=
 =?utf-8?B?enlSUUk2YjF3UWRXT2gzU0x1V3VhcU5reTdPUmttc0tLNzRwc2oza1daMDhF?=
 =?utf-8?B?QmFZRGtZQXQyVkl0SHNSYmNzMzJJRm9VWUNFZHVqTExBU3pILzBiSTEyZXVE?=
 =?utf-8?B?TEVVamU0bHVTMFBWK2pMcDVHdEpKS3VyeGpqYm9XbmVURUtpWnowd0RMNkNy?=
 =?utf-8?B?R3ZVeHQ3WitnK2xrdlhaS2JaZlIyTm8vcVdqSUdEU3NpaDQrMHU5UGVlZ2gy?=
 =?utf-8?B?TkFlYjlaWlZBVUpNV3hIVkUyWTVxekFpYzIxb3FvV2FkeW82TTNBWER2WjY1?=
 =?utf-8?B?dmtCMnppL0NkUnNpeUpuZkF6cERPM2J4NWU3YVl3eExwbFlCZkU5eU5MaWV2?=
 =?utf-8?B?bDhpeGVEUWhIMkFwbmZGdkk1VWF5SXhuazl6WXE3ejI1R1NsQUc0R1VEb0cx?=
 =?utf-8?B?VmlTb3JFY25ka1B1TFhKcy9CUXFDNDQzN000U09paHdLQnVaVTZXN3JIUVc0?=
 =?utf-8?B?ZGZGSjZxVzFuL3l1S3lOKzFBOTVQVHZ1Y3BzNXlab2FZOHprcGR4c0JlTlMx?=
 =?utf-8?B?NGs2WGhib0tHdks4S0FqNkYwM0hvYlFwdnVUMnNoUmxCREQ0UnZxVmdFaHVy?=
 =?utf-8?B?aytlUEcxVFdHUkZ2UHNSTDd4ZEVaLzNFTm1taUhvMGpMRURMckN1U0RCKzg5?=
 =?utf-8?B?MVVwenhJVEYza0t4T1pqUjZLUzNkQ0REeXNEazEzWTllbnNNWkRiRHZsbk1k?=
 =?utf-8?B?R0JOSnJpdVpPVk9yWTZMTE9tMkJjV3RjSG00cEh2VlpncVB1d1MrQWw2aVN5?=
 =?utf-8?B?ZWEwVk5UNG0rcVpaTjFyK0IvYngvUFY3UEIvNTJhdFlyalN0K2FTYkkrTnFK?=
 =?utf-8?B?Y0dmaGIySHJpWnhkOU9oZWh3S3FWOEV6REN2MHhBVjBmWllVSGgxdWJlWlFJ?=
 =?utf-8?B?NkhYU3RTbFZPa2t5cFhvWmExRG9KaXZmSlpLN2VoZThTeDRqd1FXQTN0dUFn?=
 =?utf-8?B?NzVxeVlXaStrN3k0ejRiSGsyMW0xMHFiL2haRXd3Uk9EUEEyaXE4TzFyS01W?=
 =?utf-8?B?ZGxxc3ZheDQ2V1lrWGhvSkNaUklydGgrVTg4bmFLbUxJQVk2eGloYndmTkxs?=
 =?utf-8?B?eXpwelhrWkpwSnNnbnl0OWk1T0JFN05STEtWNTNxbU9rN3dNNjRzWUNYblRs?=
 =?utf-8?B?cHdaVHZRR1Rwb1Q5cGlYWUs2aXFsWDRzQXdGWHhzRVNlNUgrQXlXamw4OU5M?=
 =?utf-8?B?MzZLOHk0SjgxTmVQaHhCSkNUTEkxb3R5V3BmaERCZlkyMkpEYUcvaE5ZNkJM?=
 =?utf-8?B?ekltZkprSjFtU0dMM3l1aS9aVkY3Y2FNUUhzc1dNamRZVnFhdkYxTXQ0SS9K?=
 =?utf-8?B?dCtsNmczdHk0bS9wcGhkdTNPeGxrRHcxVXRjWVhLaEVJNk93dDYwcGlnUm96?=
 =?utf-8?B?Y0p2YWx6ZFpsY2FhTGorZ1E2ZnJPbmJRSElWUXJQWEliT3pOdGF6N1pXaHJn?=
 =?utf-8?B?VjhJbGFBdThGQkZHb2g3T3d1YWZ2Y1Fpb1NJUWh1QkZzbEFESEJremRRbnNa?=
 =?utf-8?B?dVU2YU95WGpmOVFBWUhMdkgvVkpiN3JoR2lzMmtNVGUrR2xSbmxmdHhRREw0?=
 =?utf-8?B?dlh5UFF6RTNNdWVQNzlFL3ZGSlBCVHdTZzBHZ3loL2RKMUVCUjZ3b01jZEV3?=
 =?utf-8?B?M0w4UFIycnk1cy9NUDI5T2c1dm5MZXhZZTNIcE9YempRamZ2ZThrVzdVUjE3?=
 =?utf-8?B?dVpEVUFzRldaNktkM25pMEZ6MVhKVThXbGY2eG0xU3NxUUk2eGxtMFNLUkxu?=
 =?utf-8?B?WGVCQkh5aXNwRzRjRE55TXdqSlMvcm5wMlE3U1AvRWo4WjN5ek9XVDBCcjlV?=
 =?utf-8?Q?Q5pz1SfyDgs1hPIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E0D07C57114D449A236F1AC795BABC5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c52a4a-36ef-4092-376f-08da3f381d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2022 16:52:26.4813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J17PjGZaNQXdXzCb3Er5grir5nVE9rcF8Lz0r+fV3tYKtNr5uFhkyp8dywkD6ZNWw92Cfe+xA5xxd/pMsj4rT2TBDId2ITZ4gEH2IRMr4Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3026

T24gMjYvMDUvMjAyMiAxNjozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA0LjIwMjIg
MTY6MDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBtZm5fdmFsaWQoKSBpcyBub3QgYSB0cml2
aWFsbHkgc2ltcGxlLCBhbmQgY29udGFpbnMgYW4gZXZhbHVhdGVfbm9zcGVjKCkgZm9yDQo+PiBz
cGVjdWxhdGl2ZSBkZWZlbmNlLiAgQXZvaWQgY2FsbGluZyBpdCByZWR1bmRhbnRseSwgYW5kIGp1
c3Qgc3RvcmUgdGhlIHJlc3VsdA0KPj4gb2YgdGhlIGZpcnN0IGNhbGwuDQo+IFNpbmNlIGl0IHRv
b2sgcXVpdGUgc29tZSB0aW1lIGZvciB0aGlzIHRvIGFjdHVhbGx5IGJlIGNvbW1pdHRlZCwgSSBk
aWQNCj4gbm90aWNlIGl0IGFtb25nIG1vcmUgcmVjZW50IGNvbW1pdHMsIGFuZCBJJ3ZlIGdyb3du
IGEgcXVlc3Rpb246IElzbid0DQo+IHRoZSBsYXRjaGluZyBvZiB0aGUgcmVzdWx0IGluIGEgbG9j
YWwgdmFyaWFibGUgdW5kZXJtaW5pbmcgdGhlIHN1cHBvc2VkDQo+IHNwZWN1bGF0aXZlIGRlZmVu
c2U/IEl0J3Mgbm90IGFzIGlmIEkgY291bGQgcG9pbnQgb3V0IGEgcGFydGljdWxhcg0KPiBnYWRn
ZXQgaGVyZSwgYnV0IGl0IGZlZWxzIGxpa2UgdGhlIGFkanVzdG1lbnQgc2hvdWxkIGhhdmUgc3Bl
Y2lmaWNhbGx5DQo+IGp1c3RpZmllZCB0aGUgc3BlY3VsYXRpdmUgc2FmZXR5IC4uLiBCdXQgSSBn
dWVzcyBteSB1bmRlcnN0YW5kaW5nIG9mDQo+IGFsbCBvZiB0aGlzIG1pZ2h0IHN0aWxsIGJlIHNv
bWV3aGF0IGZsYWt5Pw0KDQpUaGUgZXZhbF9ub3NwZWMoKSBpbiBtZm5fdmFsaWQoKSBpcyB0byBh
dm9pZCBhIHNwZWN1bGF0aXZlIG92ZXItcmVhZCBvZg0KcGR4X2dyb3VwX3ZhbGlkW10uDQoNCkl0
IGRvZXMgbm90IHByb3ZpZGUgYW55IHByb3RlY3Rpb24gZm9yIGFueSBvdGhlciBsb2dpYy4NCg0K
SW4gcGFydGljdWxhciwgaXQgZG9lcyBub3QgcHJvdmlkZSBhbnkgc2FmZXR5IHdoYXRzb2V2ZXIg
aW4NCmdldF9wYWdlX2Zyb21fbDFlKCkgYmVjYXVzZSB0aGUgbGZlbmNlIGlzIHRoZSB3cm9uZyBz
aWRlIG9mIHRoZQ0KY29uZGl0aW9uYWwganVtcC7CoCBpLmUuIHlvdSd2ZSBnb3Q6DQoNCsKgwqDC
oCAuLi4NCsKgwqDCoCBjYWxsIG1mbl92YWxpZCAvLyBsZmVuY2UgaW4gaGVyZQ0KwqDCoMKgIHRl
c3QgJWFsLCAlYWwNCsKgwqDCoCBqZSAxZg0KwqDCoMKgIC4uLsKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgLy8gbGZlbmNlIG1pc3NpbmcgZnJvbSBoZXJlDQoxOg0KwqDCoMKgIC4u
LsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGFuZCBoZXJlDQoNCg0K
VGhlIGNoYW5nZSBJJ3ZlIG1hZGUgaXMgc2ltcGx5IENTRSB0aGF0IGEgY29tcGlsZXIgY291bGQg
ZG8NCmF1dG9tYXRpY2FsbHkuIGlmIGl0IGNvdWxkIGJlIHBlcnN1YWRlZCB0aGF0IF9fbWZuX3Zh
bGlkKCkgd2FzIHB1cmUNCih3aGljaCBpdCBsb2dpY2FsbHkgaXMuKQ0KDQpJZiBsb2dpYyBpbiBn
ZXRfcGFnZV9mcm9tX2wxZSgpIG5lZWRzIFNwZWN0cmUgcHJvdGVjdGlvbnMgZm9yIGFueQ0KcmVh
c29uLCBpdCBuZWVkcyBpdHMgb3duIGV2YWxfbm9zcGVjKCkvYXJyYXlfYWNjZXNzX25vc3BlYygp
L2V0YyBiZWNhdXNlDQppdCBpcyBzcGVjaWZpY2FsbHkgbm90IHNhZmUgdG8gcmVseSBvbiBpbmNp
ZGVudGFsIGxmZW5jZSdzIGZyb20NCnVucmVsYXRlZCBwcm90ZWN0aW9ucy4NCg0KfkFuZHJldw0K
DQpQLlMuIEkgbmVlZCB0byBhZGQgdGhpcyB0byB0aGUgbGlzdCBvZiByZWFzb25zIG9mIHdoeSB3
ZSBuZWVkIGEgImNvZGluZw0KJiBzcGVjdWxhdGlvbiBzYWZldHkiIGRvYyBpbiB0aGUgdHJlZS4N
Cg==

