Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A94716B28
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 19:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541324.843973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43Bs-0001QN-Ip; Tue, 30 May 2023 17:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541324.843973; Tue, 30 May 2023 17:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43Bs-0001Nm-FM; Tue, 30 May 2023 17:31:24 +0000
Received: by outflank-mailman (input) for mailman id 541324;
 Tue, 30 May 2023 17:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q43Bq-0001Na-Fu
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 17:31:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0b6a32-ff0f-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 19:31:21 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 13:31:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6055.namprd03.prod.outlook.com (2603:10b6:208:31b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Tue, 30 May
 2023 17:31:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 17:31:07 +0000
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
X-Inumbo-ID: ca0b6a32-ff0f-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685467880;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xPupXtiOvjibfucvNUqXFdPuf+q3cQrntE2/+FNJ+Eo=;
  b=PzVsBulfd0BpRGtfWRkxfkI+MdJ8JakXinhBCgjC4MTkApEQjkd54ILg
   wXK8GMzyPCV2dWC8KXb9ykgTQX68ONQkFvtypftVVtR1J6KXGRecJcxio
   DSYJ9jHfqsZI0xPg+IdpoPeb7/627gH5qjHJk3vT6lVhI7Vuot0uzWTIT
   8=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 113443194
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JvbunKwUKD20aOIwVEh6t+f3xyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 GAbCmCFaK2KY2bwctkjbozj9k5TuZWHy4BgQAA+qiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjPqgT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUdl6
 /k3eWA2VCmarNCc5quLQchplst2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdlOSObhp6ICbFu7w208JBpHVUqHucaehUqSdOkCd
 Gwv0397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWhslS0ay+pAnDm2j1+cePSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:9TY7naqybOV2RnaP4LoVdkIaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3AXg6PVmovV87uikFIz2dWL4DmUeYObHjynSfrGXa?=
 =?us-ascii?q?hIlRDbqSlQn6V6Kwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgBYbuA7Y1Xb2WLqPN5YXRpYCxoxt4ouCDxENgKk?=
 =?us-ascii?q?ehO6LMQBfAGrCrA+eF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,204,1681185600"; 
   d="scan'208";a="113443194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doBwt3EtG+e2cThbT3n8dDguWQFUNep4vTQAEa9CW/thLZRSG1P1DwA8c3UCTzGZLmJgl6x1UDh+xqxp42MYxTSTsimKyIu77uxpsdfQ/t1Ba2eg14NRUrgVfcTrMDvPGcZgOtwzmkotXJmDFhYDegQ2QVTbzB0i0ci5n8bzEqDXcLc7ItufrnOHsXwkuZfiYJPMAVd/gQy7lG640moi+LnSQdcPotbYD12sLZIpdcUYugIRl4vub5mh72WDemqnCjfNPavCIsb6fU+Q/YBbpCO8GXO+WLOiGoh1v3/XQUt42xZ0zAhlOhdgwAszeRTpHAqVx429cle6pT7iU8+KUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPupXtiOvjibfucvNUqXFdPuf+q3cQrntE2/+FNJ+Eo=;
 b=gSunSclFZYfLmWuDlXEgCPTGj08cH2FsT2jDN8Tnhpt8hw1wWDbEmQQSB93WuZjkOvTqkE9Gk+MriQg2fjk45qQTQrWPIHRz6k4y3yK/ykiMWek+xpLulS1QOH31EVaw62sCeRWHgZ2QwQDwZPQfzP7tWLK3qKuo5o/9b+AUvDochU6hlHamAsepKcuL9XX3hCcTY4wyRIl0gWmTITz3hg6rud+SMzOdwQL9OoZ/c6CDfzsexVkHVFaWOZweoN88xcuHforcLeEP/xlP/aHRisbMccJhD9gQt2uWtv6o3641KrbjGyPYjmTAJpo5i+2hBUadu+uVybq7TzHF7lFgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPupXtiOvjibfucvNUqXFdPuf+q3cQrntE2/+FNJ+Eo=;
 b=Xl56Ppr46BS3ll0+34b+7XXCQO6H7I027mN8V9QXQ04LOkflTEzz1NSb5Y8jPZ+83SypTphYDZIswgolBPRjPNdlIoTeke5Dasc7sX7kQaSO9/EKIP7G5v2jk5TCASuRwCku5xJ7ifF/yLw6A1cxpFCQMokotrFlEWxB4aEdi8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2e1bea58-9f6f-08c0-ce00-148f79ba12ff@citrix.com>
Date: Tue, 30 May 2023 18:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86: Expose Automatic IBRS to guests
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-3-alejandro.vallejo@cloud.com>
In-Reply-To: <20230530135854.1517-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 822de12b-ee3c-4fa2-82ad-08db6133a6bf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jcJLoydlj4PYrpwv4ZeRRMEu9F9hKGpodel1COYk+lP+b3psLAiEH23QO2ndzdr2uCW1onHoGV1Ywzp0FPM/VbrlEw678ydCU8TFsvB+kv0yqbgaYtzQTMgOmYdBgIK8ZoO5xBkNqMu1Gx4TaA0nndIISm5r/SKjeLMFDHPVLtjPYVuAItdq12PFuIuzHruzLJ2bnVE04Axa9g9ohjV0ynY+DBqUwoOF1lumrG2PchM1k4wCO1tJfB8rGux0/+KSGoPbEvnD9+4Mb9OVfedQ6kfiVOfET51LElz1d0d6DcsDp+aJ61qd3ffs6AXmArN0sOQ9A4F4BZHlU650c/BPxwTG5LjdEqunD+qlwXKKEj2qUBkUcjhgzpaULihj2nEuF/FJye/A7aV6O79ePgSA3VPVVfkgo6K5/CgSCiExX5ftfD4nIT4tipkYtyTPwk5su2QHplVSoadDDQyf86P3ksH2JaFdO8O0qU6cPJ7squjks+jzI4lHoIu7yk6roGdthgP+GN8N43OCfAipGn0rCJQhbGMpEfMC59UWlH0S5UOLBavXmbHObBH/cAf6vGjUw74GYf03cYhyNnORVXgE/3zwztSsBIl91SH8yyVwJCa9LPFKG1sJkygYO7HFZVr1EfigzMC5rCJVaKFSzgSVHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(54906003)(110136005)(6506007)(26005)(6512007)(83380400001)(2616005)(316002)(86362001)(31696002)(82960400001)(4326008)(478600001)(2906002)(4744005)(31686004)(66946007)(66476007)(66556008)(41300700001)(5660300002)(6666004)(186003)(6486002)(8936002)(8676002)(36756003)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVtZE9FN081ZkVRYlVKMHVNWVRtL3Bqb0x2bzRQeCt4aUREd3JTUTY2bmtl?=
 =?utf-8?B?V0pxVGJ5SkdDM3lFTkpqZk9GZWNTTkNrQ0dwZGlFdE1nUnZJd0wwQ0x5R0Nr?=
 =?utf-8?B?MUl2T1hDZDA0NVlyS00xRTFOSEQzUXMxRERqNWREZ0g5Y3dxbFh2OW0zalpU?=
 =?utf-8?B?TitaWmxnV0dMd01wWnpiK0toQ295dG12RE9NNGtQdDU2Rmp5SjhacU9zNE5H?=
 =?utf-8?B?WTM4N2NXNG1sNE9oU1ZYSC9YL3IxRVZTMXl5YThOaDhRdFBJQ1R2TW13cCtF?=
 =?utf-8?B?Nk9Ed01UL25icXhPdG9uNUQ1cmJ1TlN0QWFBdVpteTZZaUpzZmlUTFF1VkJ0?=
 =?utf-8?B?aWV1SkFHenEzQ0dxQ1A5ZWtMNkFsMWpENmVTQmJyaVc0L3hrQVIwRnNLcE5l?=
 =?utf-8?B?SS9VVDhzdnFCQ1RySHZCQjhtNFRGdllOclk3RXJBaWE3WlJtTGNBMVEvemkw?=
 =?utf-8?B?T3hFb0dCLy9qbVBETVVaTkM3NFZOSFlOZDFnc2xERFRnQWF4QkY3cktSc3Fx?=
 =?utf-8?B?MmU0SVIwaGlGMHpZRHJVUXBLMlpZdXFocEhDWDR4NzduNjNmZlFnQmM4U3Bx?=
 =?utf-8?B?bTJIbDdjZ3RnV3VDemNPTHloM2NQUWpBMzR0Umh1UEJlTm9JcE9vaWZ2bjdW?=
 =?utf-8?B?eWdxU2MzTW00STdBdHBMUUQ2VWVLcFhhajBLV2hnaEdJWkJqNDZIVDlqL0FX?=
 =?utf-8?B?RUdkaituNFA5YTMvVldRUmE3WkxhR2xKbFNWa3c5d0ZoelVoQ2hjdmV1YWN0?=
 =?utf-8?B?cG1IVjE5RHZYTW5PaTdCaURvaHZscEd3TytiTlArelJLUmY3RFdqY2hJQWtT?=
 =?utf-8?B?RmVaK1RFZVgxQUpQem1CSmF4TEFIWGNMcVRhRnNXck5zdTdZWExVc0dkaDkx?=
 =?utf-8?B?bytianhyckJhYUowNVZBcmoxdW10MWRqMDNvd3Qzajg4WGdtWEY2c0R1dUcv?=
 =?utf-8?B?bUVlOGR0UUZicmJ3UWwzZjVWUk9vc3JkQmZqRHV4YVhodFhTLzhWcCsvNFBk?=
 =?utf-8?B?VlQrNmsxTmV6d2FpNjRVVkRWRnZHVUVrSTZCU2JoeTI1UWE3N3pHaW5Ic2FW?=
 =?utf-8?B?Rnl6eFZxSUlCaWtGMlBpVXYwY1JKQy9Bb3RtRnJLOW5VdmNuMFBpV0o0ZWRz?=
 =?utf-8?B?Q2FkcFNoZHFZQkMrb29VNHArUzg2VXB6cXdjb3h6cnkzVXBBZjZUZExndlc1?=
 =?utf-8?B?VzFOdUs2ZHkveThXRTJNTUtMdkVwQXRPZmJ3cTRkRzQxbDFaUHBDemZrSUFJ?=
 =?utf-8?B?MlJXZVA5dzl1TkxWTS9jdU9BMS9pRkpndHhjcWN6anFUNnQ1Q25rVXYrN3lj?=
 =?utf-8?B?YmdDWkxlV0crT0lHaGZaemdLQ3RNMDVDdEl4d0lQVnRPWUNGaFgzbVJzOTY3?=
 =?utf-8?B?d01JbTI5VmJxQ3AydjBFYi9BYUovK1ZqSnZmZ3NHZGJDYmFvZkxPc0hNUTd3?=
 =?utf-8?B?OENQMnBkM0g1MHUwbWdaU2twSmhEWGdyb0NVQVpRWnRHL2RYeXFobmpQOFFv?=
 =?utf-8?B?dTJOcHZPQXk4TEZTc1hMV3l3bzd3anRGTUIxaHNCbk5XYVBZaGlFYXRPaGty?=
 =?utf-8?B?WFluVTZLMGZBOVdpcUNaeFVUUUxLUkVKZi81Q1ZJRjQwbFhUSUpSWnpoMURq?=
 =?utf-8?B?Z3ZjKzgrSFRLcVBHODNGZ25KTlY1TmNOSUZyZldidE9ZNDF1UURSaXdDQkF3?=
 =?utf-8?B?TkVRNDRRNjl5Rzhma1pzMjNQV0l6MjVrMjZubU15eVdaaHR1RmtKUERqZHZ5?=
 =?utf-8?B?S2M4UHM2cTk1WGVQdVdCMldNdUFobmI2d3lVbGdrV2MxODZEb2plUDBXbjFS?=
 =?utf-8?B?NTBJTFpGU0xSc0Y4bnJlSEZqOEczTUZ2Z2h4VU1WbklXZGR1V0IyR0JzcHlm?=
 =?utf-8?B?bDJVSHBibm0zUEhMRTUydHQwRklZUzhCZjRBUndGSTQyTysyajJXQ21LMnRN?=
 =?utf-8?B?T21zenZ3NGRxbDEzMWQrc2MwV2tWUEdiMko2LzB5ZzducHkvZ0xpc0FVcHJu?=
 =?utf-8?B?bG1iSEliam5McW0yb1JRU2hnTDFSQjBjL00zbXQrZXZnNlAwNTExTWdUUDNa?=
 =?utf-8?B?S1RRMFhFdWNjaEk3dlFuSFByQTNCdnJoSk9vMktQdWNxc2VXNndNZ1pJb0FO?=
 =?utf-8?B?cmZ3UGxBWS9vQmZ6OFZISHczeFQ1cEdkeDhxU2JWZFZDR3ltT3dtL25pMkRl?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HY9Sh3J953zJLv90kGeJJ4B2vNRevr6r9KMAXW//IqHMqLdlvCMrJofQ4Chp3DcWqBhShhLYUqgvrLRTzvuf9Ow7REg3clORqwVGoNXQMeCru362BHgriN/W7F8UStC8rsf4rg5JbV2IBwVyd4ALuU7C7swhb84DtAkuVfakhtLi+tdQPCynOvvXmhJt71WFgZjPAiRmct/o4VvP+QamyoYvODEi1pG9EdNwQybSefRCd2FlF4h/me8FyQOZlFs00Cyejj7cDlmYjFwMNrQ7v/Gg1Lj+rqHLOZOWCgbA4DGTDdFAw8BTY+RIk/1gS/YNb5YNe6gD6f7wgFhGBoYAX7mT6ZMA0WTcKMDDRhY7EGoti0DpoAaBWNVrts9tbatgdPDBNPFmF5J6mTnrezEgVpO48NC445GWgLoqvOj8+FLjEYHGEvM18Fz7AhkrS0ANrxp/ekc0INhTHfxdtcExope8OZPmjFYFtczhkyZiUOeGlZ/bWLsfpIT1YihHc2QZwWJz0TBuQSUQjGIdSPJL8CAXdHgSsPEMCkCYJbZwt/egN4J5s5h9W1KDKV0oGxhleIZ6ndE90FolpTL7456upGPVQ61+f2x3eKKj+2zL+cEFj0cXKryGGb6ka31eWH/sHgcQiqRGvF3YnvCNFD9rDZmZVmDgzO1VpdAJVRgRxCNQS0dHc6ivTv3EYvHLNUCl80KcJpn2ImX7XxKEtFQf4tVIre82Y2LPB+EatRZjgS7YhF3jo6Q3xStAx5J91dJnaDQ1bh3llvJHNLH7YJCXyMwL2Yg55i3blITEQDWaJCvhsah5Ghpw3u3Wxz2vQVO99e7yzjjaMCgWx2VXQ7Vlm+x3hhNB3x6Mng1ccvX1l0o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822de12b-ee3c-4fa2-82ad-08db6133a6bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 17:31:07.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0byAj8hmLN28hSCGWNRC1Y9QXSAy+soUZMlJ2tz8IT8d8AFEUVn3HMg/nQ5E5i+qxaX7x1cH6WXmqHDu7WWbjzQkahtF0WgSiVnQTkdpXhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6055

On 30/05/2023 2:58 pm, Alejandro Vallejo wrote:
> Expose AutoIBRS to HVM guests. EFER is swapped by VMRUN, so Xen only has to
> make sure writes to EFER.AIBRSE are gated on the feature being exposed.
>
> Also hide EFER.AIBRSE from PV guests as they have no say in the matter.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've committed this, but made two tweaks to the commit message.  First,
"x86/hvm" in the subject because it's important context at a glance.

Second, I've adjusted the bit about PV guests.  The reason why we can't
expose it yet is because Xen doesn't currently context switch EFER
between PV guests.

~Andrew

