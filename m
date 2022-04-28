Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF7512DB9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316129.534886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzAh-0000su-3y; Thu, 28 Apr 2022 08:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316129.534886; Thu, 28 Apr 2022 08:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzAh-0000qq-0Z; Thu, 28 Apr 2022 08:06:43 +0000
Received: by outflank-mailman (input) for mailman id 316129;
 Thu, 28 Apr 2022 08:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njzAf-0000Pc-Rr
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:06:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214412af-c6ca-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:06:40 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 04:06:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 08:06:31 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 08:06:31 +0000
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
X-Inumbo-ID: 214412af-c6ca-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651133200;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=g/PIQmNGDB3LfKlDC9ESR3NY1wR+stH9c77NVrkGaIE=;
  b=QhhSYaig6ve78qqz6zSbWXOIyjEndLkM88lS8vWu3aSsTVxS1WhODbSr
   s/N7Bb1HRiAZ5CpNNDHa8uVkLNZUCJ999k2ZKz9vP2v33IAAcZ/iPUNgt
   sK2xA+iriBVPTftbBcliP6L2nTZUFptaA5EXXAbk0MhQVB6aYaJMSkWcg
   s=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 70114762
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/QVRYaALygs1wxVW/13iw5YqxClBgxIJ4kV8jS/XYbTApDIj3zcGz
 TYeWGiCPKyJMTPzKIglPtu09RxVuMfWzdI1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhxz
 I8clYGSaTwQP5DKpu8xdgdzTCZhaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcGs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjw3yCjLGMCwL6TjaUdwm3i9RN96b3WHsDJX93NVZ5fj0nN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa60iDXtT7GRqirxa5UgU0XtNRF6g27V+Lw6+NuQKBXDFbF3hGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb0nojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:b3ATOKDjt2d+S97lHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70114762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWsfZAnvZwdFAF/+tRbvucOqG1DSQYT9cHROAJe4h2uuwWbSMcHU8S7/9YqsY7cMjf3p4ydMYZHsvKWLBkLG6uBRvHTWFdj2q8jmFUjZWEfa7dZhOr/UqpA88shNVqiXClN+NpftDDHGgI/Oi3gYXZg4MD2mont3VTCfwk64BF2zoEAaX8B9TqOEukSCtR2mDgr7pYuGLuV1DUvv0X6LWgzeaxrQAXeUCsrImNixEicYWbGvSMOfd1/+kYsnkoa1F4tUbfapRxOlDE6XUtFhyGP9WaG+FB7EWjOIL823Bjf0ZHgVivMuMTwjLGC0q+fORgt8RJc9QPGegzBKyzgJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX9pNVCJbjAiUqScrtBfeRLTF+irJiIUFBKoTGvuesw=;
 b=OOPUhqrBPI6KYaqoIpgVwBkPzJT4wH6n3c5sC14lcxhCjLzFhSEr8OV7H2f9E0TewHhRll5YXpo61h0H7pU6RCQXzgNnT4KeoeFS6Y0c2T5Ctx2kh6MUdflcbXthEjJU2hNROK6yJNqXfBpSq4kjhzmCtOc/CyYFnT7llLp9b/InGGoNl97v28h0DZ3sD/gUUO7c2QsC9C/EYcbzn7Ryu8NAG8lm8V9vjmJdZ5Mlx7MEBzImD4yiN16KvHm4HMpQmyRu4EeUFlB31N6pkr5/hXJSgDT8t68LkqpBL2WvZmw7kwvivcO12PSYbrYaJi4t+2X0dfJMSIIBuRZ6ExvoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX9pNVCJbjAiUqScrtBfeRLTF+irJiIUFBKoTGvuesw=;
 b=mRz72rBYehAIYQI/aIpDAd0QPkqjGtGPLczF2FEI6Pvy7wwFJy+DHPXoZZSUpgMTevza0VG4JEQTyeFH8WRi5FvU7zO4Wi9nZOYTb283MSVC7yn7OgNh+f1XXuiOGUgIUNAFjHXjLkEOW8qCxiFqYCUxmkca44RxWO+lJkQcUGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 10:06:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Message-ID: <YmpLAoORo9uG1+yI@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
 <Ymlb2Wly25k9bF0z@Air-de-Roger>
 <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
 <YmlrYNFI75wQlVlg@Air-de-Roger>
 <9a4d1bec-321a-21da-6a11-4b4990c52895@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a4d1bec-321a-21da-6a11-4b4990c52895@suse.com>
X-ClientProxiedBy: MR1P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 637a9135-581a-4dfc-438e-08da28ee0151
X-MS-TrafficTypeDiagnostic: PH0PR03MB6707:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6707E4E5438738D23A800AB38FFD9@PH0PR03MB6707.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MWKRAZeiwnk8O605K7DH682wmh/u2v3WJx8bjTqadwTHmEFpQNJ8pcstyzuGeRmRzev+0WXdMqsYl95sChKcNK2hyOitbXRO3RwQjHqKmZqPKSh2uZPrU4G2Epg3Fl0pxnQn0rdlPzhGKo326XGRM+v0wwLDUBlIa9QnsUn9XxTOPKkCK+X0jlujphY5yEuEnhzOmqxoZSltJRNexva/8bLLnVUpkHA3QJOwaNSRsa9lO1Gmg9E8exlbMtKjQGajGNZdYannxeJJHTorMOHqLWmA3MF8WgFkrjXI7WPiVEy1PJaHRvs2lz7AV4sFoayXE+R9opuSj0jWKdPhlMfcpqmznes33lqB3TYN64NSskXesPfBgl9geTT4zYFD4cFBfBDuuBEd3CHHWraM+qbURiUKxhdO5iXbEO3k070cZrWRlDFc3XOFxOF8rfmQAkiPySZioCwmuUAm9Cpzkyinwo4LUsw1UCsmFoJ5jeS55k2Hb+rzqyzNVRUqLT/EiyVkSb+syV4DLd6HkWejJeOVKRKBP03wWuL29UdPlsjv395rWPG6DxP0k5GDCDu62TqraJ0+DBQuUb+J1WCLXj1MkZ0z3EJEoeUv+7GstWSHiBGdbCnQK6hBOHhMLu9loaFW4/eMvTsaeVmXHaayOHIGAxtys/Exb7s5j8ZYPghYgVQJXqTvyOaeTlzY4TgpT+qmOQi6vaJC4OLh9U7lawx+iKXRMeN1VkbOPYr7Xf4zaLfVVpqQaGj6R0GSyqfLBCmL2jceIwQGcWDPpPGUoA2RUHJGlQLjUvVH0HQcm+V4pHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(84970400001)(6486002)(508600001)(86362001)(26005)(6506007)(9686003)(6512007)(53546011)(38100700002)(82960400001)(6666004)(33716001)(66556008)(186003)(66476007)(316002)(2906002)(66946007)(5660300002)(8936002)(85182001)(54906003)(83380400001)(4326008)(6916009)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzMwaWQxeGpzbUwxbndIUzd4SjFWVDJ3dWpxdVBzMC9SMXRIVWptd1VhN3FB?=
 =?utf-8?B?STJSeUM1cnVqUis3eml4RmRXS1kyVWxCd2kxRWc2NVgvNXk0RmVoSlNYaWJC?=
 =?utf-8?B?dGsrUHU1SWhkZVZTSVZ2djNmUnJrVk9xN0lCaXZ3eTl0L005NytOTC83NWxM?=
 =?utf-8?B?eHlqaTdxUjBKd0JCVm00NENXNmdZcFZWOEJGZkpHWTZyMURydng3a0pmeWZU?=
 =?utf-8?B?TkFXWDg5U0xYVU1XOWlSZlFOTGVrVk9TU2JaSXd1TnJFQnRjMkNpK2JYYXhH?=
 =?utf-8?B?aWVUeTNDVWJJTXNXbmRYOTJyQyt1QktDZzZuNkFEaUJUNXpwMDJDbElQV0xm?=
 =?utf-8?B?YkY3Rm40c3R4MzN0eHpQRUdsZW85S0M2amdYZm9Ic1l4MGprNXEwTzY3bDRY?=
 =?utf-8?B?Uk1XWmVOb0h1bzhPRHlLQXNmY3NyRDlhaTVTR1VyOHlqdjNBMk95QnBDcGpV?=
 =?utf-8?B?SkwwUFBxMzJjblhoa2RuM2NhcU9jYkdZakZhVGJ6SEJhQ2I2djczbGVBei9H?=
 =?utf-8?B?Tyt3REFXUDJsZkplU2Flb0xOZjBSclRNVFVvVUhLTkRoZEFpdmpOQW5TSTJr?=
 =?utf-8?B?QVk5OWJzdFRFZ3dscGJ0bkxrSjhUc1hzN24wVUhXZ1JJVFoxQXpPRlhNM2pB?=
 =?utf-8?B?NGd6RFFvRW11bTdZcndHNXdXM1hYRzdNMm1vSEZ5bU42ZUlPbjVnNmFidm1q?=
 =?utf-8?B?V1RvWUQ4QmFVUXZ1NnZmbXJhUHQxSURXcnozSkt5azc5dEMxT1VCUE5EVDFj?=
 =?utf-8?B?b2RQYklNclBicWhEaU51QlllaHh1M0VKRExSMjFMazV5dVB2V2oyUkFvMEhX?=
 =?utf-8?B?cEo1V3hCaDBoY1RqMmV3anJBSTVUb1VZd2paRi9HbmIrQ2FnWXRYdnY3bTZO?=
 =?utf-8?B?UU0rWW9OK3k5dWNtNTA0Slg0dG5sQVEzUUJWaHZFWE9CWVRoTUVEdVdVdVVD?=
 =?utf-8?B?TUFzb0pZMUFzVXlLZldEdE42cU4vRHVkMGNVUmhmU0NOa2I3bXJ6bnhhVVhn?=
 =?utf-8?B?YkhmRVcvODJxbnY2MU1lSnRyOUkyQXVaNG5ha2FieDJHYnM2WnMrUUN0eHE2?=
 =?utf-8?B?SzViTk5LRk41QnhQZDR3cWZEa3FwbDNjMjE1UldrN3FORExFTE1ScHNqTmJn?=
 =?utf-8?B?c3IyOHJ0RzRxakgzTkZPU2Y3WUljSDJ2ZXdMcUdrb1RWWUFHOG9rODR0amEr?=
 =?utf-8?B?b2FjVHFQbmpVMXpLMFhZWEFDNnhBcUpkTjdKWlZFeDJzQTRWN05BU1BkZnhG?=
 =?utf-8?B?Q1U1U2lHM1o4VDlEMGdiaVVFbzNQbmZtNTVjeFpIeExYalI2Z3NIOWJ5M3lm?=
 =?utf-8?B?RVd5T1QwSlhOemFUSFppVVlLMkNyVGV4YkhMZzg0NGpHR1grdlB1LzJnTXZi?=
 =?utf-8?B?bXE3QzZ6b3JnVmxsMnhzZ3c5MHJQOGJPT0d5RTFrblU4SXJtbTRMdGp2VjBC?=
 =?utf-8?B?Y1hVRy9BTnFQRTZLVTBVeERndmVvKzlsMXM3VHo2YVYwK0dmU0k2THFBLzlv?=
 =?utf-8?B?VXJieVFPS3owN1BBSEdNemlJL0lKRFd1NzNtU0xVZ3RaSzBLQnA1Y3hXdmQz?=
 =?utf-8?B?a0RFM1JseWNSMEZHR3dNc0EzWk9zWHk2ZGpWZ1lVZHdLYjRVODREd2ZoZDZI?=
 =?utf-8?B?NVJTUXdQMDZOYVdVTDhOTU1xZzZsUk5IdGlzUHVpRGI1SG5RZGxSakF5YmE0?=
 =?utf-8?B?MGlHckJQejRkeU5qK3N2ZmRQcys0SnhvMWZKdktyb0VwSVRJYUhxSU0vSTYv?=
 =?utf-8?B?Rmk3VDE4LzNGMHM0NU9OM1RYR08wZjV2S0d1TjNlcHpXYVBIMTJQbGVDZHpj?=
 =?utf-8?B?UEovbmR5dzBvQVZqK2RmU1hYYTNTQ2hwK054alhxUXFhdHlDOWZiZUxjYzRl?=
 =?utf-8?B?bHA5SG9VazNiSHhjQlpoRXFjTHF0WWVESk13MUkzN2lGOXhaRDZHb2tWTDRM?=
 =?utf-8?B?ckVoMVFFczFpQVgvSnRFRDdtR0JDbFNGTjVtTlQ0U0pnZ0hwZnlHTzVGYi9k?=
 =?utf-8?B?Z2RGb1FIVGRnQVJWUXFNSG9UWFI2dkRvYytFNUwrQk02d2RTSG1RaW16Q2No?=
 =?utf-8?B?bWlPVTh4T1ladXlTbkFJZy9JajNUTkdrM3BlL1J6UllMZkRPdUwyTk1kQnFo?=
 =?utf-8?B?dFBsa2lVUkJwSXI0ZmNmbzMreHJWOERGYXpXVDg1Q0hPWHhBNXFxc2hoOTBh?=
 =?utf-8?B?NVpLSmkrdzZsNHNyT2E0T0xGZGdXaklsOHc4VW5vSTZsVnBldHBmcm1FZits?=
 =?utf-8?B?K3ZQbXJMb0dTOXNBbUFidHZkNHpLMHZ0WW9IUXI3ejh5QXVFVlU1WUxhQXVO?=
 =?utf-8?B?N0hOa2Vlc2ZvZDRUWDNraEt4b0k2VmpUT1doWkxNdkZOdC85QzVkOWRwS0gw?=
 =?utf-8?Q?6LJEJ3yQMn42KC3w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637a9135-581a-4dfc-438e-08da28ee0151
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 08:06:31.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbD11UJ1RkmaNwE/cPhijTOXE4xGwvTMhG1h3pz5c2XwFOO9IkLyXyMfHyza5W0nRui2NyGIshPInssex7q6LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

On Thu, Apr 28, 2022 at 08:37:58AM +0200, Jan Beulich wrote:
> On 27.04.2022 18:12, Roger Pau Monné wrote:
> > On Wed, Apr 27, 2022 at 05:25:35PM +0200, Jan Beulich wrote:
> >> On 27.04.2022 17:06, Roger Pau Monné wrote:
> >>> On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
> >>>> On 27.04.2022 14:45, Roger Pau Monné wrote:
> >>>>> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
> >>>>>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
> >>>>>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
> >>>>>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
> >>>>>>  
> >>>>>>  static unsigned int mwait_substates;
> >>>>>>  
> >>>>>> +/*
> >>>>>> + * Some platforms come with mutually exclusive C-states, so that if one is
> >>>>>> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> >>>>>> + * Sapphire Rapids platform. This parameter allows for selecting the
> >>>>>> + * preferred C-states among the groups of mutually exclusive C-states - the
> >>>>>> + * selected C-states will be registered, the other C-states from the mutually
> >>>>>> + * exclusive group won't be registered. If the platform has no mutually
> >>>>>> + * exclusive C-states, this parameter has no effect.
> >>>>>> + */
> >>>>>> +static unsigned int __ro_after_init preferred_states_mask;
> >>>>>> +integer_param("preferred-cstates", preferred_states_mask);
> >>>>>> +
> >>>>>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
> >>>>>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
> >>>>>>  static unsigned int lapic_timer_reliable_states = (1 << 1);
> >>>>>> @@ -96,6 +108,7 @@ struct idle_cpu {
> >>>>>>  	unsigned long auto_demotion_disable_flags;
> >>>>>>  	bool byt_auto_demotion_disable_flag;
> >>>>>>  	bool disable_promotion_to_c1e;
> >>>>>> +	bool enable_promotion_to_c1e;
> >>>>>
> >>>>> I'm confused by those fields, shouldn't we just have:
> >>>>> promotion_to_c1e = true | false?
> >>>>>
> >>>>> As one field is the negation of the other:
> >>>>> enable_promotion_to_c1e = !disable_promotion_to_c1e
> >>>>>
> >>>>> I know this is code from Linux, but would like to understand why two
> >>>>> fields are needed.
> >>>>
> >>>> This really is a tristate; Linux is now changing their global variable
> >>>> to an enum, but we don't have an equivalent of that global variable.
> >>>
> >>> So it would be: leave default, disable C1E promotion, enable C1E
> >>> promotion.
> >>>
> >>> And Linux is leaving the {disable,enable}_promotion_to_c1e in
> >>> idle_cpu?
> >>
> >> Iirc they only have disable_promotion_to_c1e there (as a struct field)
> >> and keep it, but they convert the similarly named file-scope variable
> >> to a tristate.
> >>
> >>> I guess there's not much we can do unless we want to diverge from
> >>> upstream.
> >>
> >> We've diverged some from Linux here already - as said, for example we
> >> don't have their file-scope variable. I could convert our struct field
> >> to an enum, but that would be larger code churn for (I think) little
> >> gain.
> > 
> > Hm, OK, could gaining the file scope variable would make sense in order
> > to reduce divergences?  Or are the other roadblocks there?
> 
> I don't recall. It might have originated from a change I decided to not
> port over, or I might have dropped it while porting. To be honest I'm
> not keen on putting time into researching this, the more that I would
> generally try to avoid static variables.
> 
> What I would be willing to put time in is making a more user friendly
> command line option, but as said - I can't think of any good alternative
> (except perhaps "preferred-cstates=c1e" or "cstates=preferred:c1e", with
> internal translation of the strings into a bit mask, as long as (a) you
> would think that's an improvement and (b) the further divergence from
> Linux is not deemed a problem).

I think (b) won't be a problem as long as internally the user option
is translated into a bitmask.

Regarding (a) I do think it would be helpful to express this in a more
user friendly way, I'm not sure whether it would make sense to keep
Linux format also for compatibility reasons if users already have a
bitmask and want to use the same parameter for Xen and Linux, ie:

preferred-cstates = <string of c1e,c1,...> | <integer bitmask>

What I think we should fix is the naming of the two booleans:

bool disable_promotion_to_c1e;
bool enable_promotion_to_c1e;

I would rather translated this into an enum, as right now it's
confusing IMO.

Thanks, Roger.

