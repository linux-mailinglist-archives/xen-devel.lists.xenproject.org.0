Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48695509CC6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309991.526555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTVU-0000us-7c; Thu, 21 Apr 2022 09:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309991.526555; Thu, 21 Apr 2022 09:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTVU-0000s9-4U; Thu, 21 Apr 2022 09:53:48 +0000
Received: by outflank-mailman (input) for mailman id 309991;
 Thu, 21 Apr 2022 09:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhTVS-0000s3-DB
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:53:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edef64ec-c158-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 11:53:45 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 05:53:41 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL1PR03MB6102.namprd03.prod.outlook.com (2603:10b6:208:31c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:53:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 09:53:40 +0000
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
X-Inumbo-ID: edef64ec-c158-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650534824;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YelKCCOI5rhVFrYcp8VpBbDStP1lpfebB6WivQMkquo=;
  b=EDdHgo8akumLUq7yDWrhN219FUSpRLsB5kphMbeklr7skQhF9nYesYQG
   VUnFxMVAPd5gEoDY5xbmP3H3hUqQHhjpq/z3Id3ACXh57AMjiqFpgQXQR
   YxqaMcR9NNam7w7PQNRBcnRXRYYCd76+woTTgwVK0UdCm6n9EHJBQg51m
   I=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 69612332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7tamc6g8DPQJHfjITSgohtI0X161IRAKZh0ujC45NGQN5FlHY01je
 htvWG2Bb/iLMWGgf4h0bom3/R8D6pDWnYMwSFA9/iw1Qygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQwYBKnvl+I0aSkCTT1BYoRnypPoHkHq5KR/z2WeG5ft69NHKRhueKc+paNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuocehW9t7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9gPL/PBsuDK7IApZzqW0EOaSRt22bOZomUHJj
 Gvr3GCoK0RPXDCY4X/fmp62vcfDhTj+WZ4SPLSg++R2nUaIwWgOFBwRU0D9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O9M97AaB26/F+TGzD2IPTiNCQNE+vcpwTjsvv
 neWm/v5CDopt6eaIVqG/bCIsXW+MDYUNkcZeSYeSQIPpdjkyKkxhxTDVMd+E4a6i9T0HXf7x
 DXihDMlm7wZgMoP1qO61VPKmTShot7OVAFdzgfKWmOo6CtpaYjjYJangXDR4OxcNo+fQh+Et
 WIdhsmFxOkUCNeGkynlaOcHEayt5v2FGCbBmlMpFJ4knxyh9XescoFX5DBWP1pyP4APfjqBS
 EPctQ5e/pZ7IGqhbagxZZm4Tcst08Dd+c/NU/nVap9EZMd3fQrepCV2PxfIgibqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0taTNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:h1Y7A6tPM2pCa+IOYnAxriRA7skC6oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ0fSLlMB27ffrzWFjiUWjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69612332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1jC+cHEnVv/iKXWkRRrVsFghsExpZp0QEOM7kubGEounyNB6YD4TPiCD8+COuDzzn5gcnlhrFfRKuurklNoLARdqRltyv3hxcywGF0A5SIPB4qsWbhdzfAw1f88ykxIi/nikXFr1ye22BUxsXml1tShW0T8txLcv85lgMjs2Tk3T/Ss/iWYL5UJFGEKf1XbuMmIBEBZs4bop5rSd2XeLt2TrXU4SradN37wOXadHbbDXk5sBBWsHokdtpsG49BfmByxKQijjCq2tza4q/XvtIRJZHy9vAHJcAOTQIn2YBUAYCJKV90d9cjW2hPifVsCbcKhrEYIEMaWgkKy4C7svA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifnSTuDJqOZURT7kjFvAZMERUIas8xwYlFOSRtNG4cQ=;
 b=WsUJu8qms5Q0mc7iMmVolk3FkSu8X/23X71/T79642MRcYLvwqka3VaaImt102twIesL4hMLmYdgVO41Xh8fV+5k8NriUSr0EgLpmVGoRxQtj2aXTHUI6EtnPaddBbszs9jGJGtMNfGAjn1QrGqRtICicEU1/A1dP04p1oWcDvQObhZzA2upa4WlY7Ku0j1cfmaLTPZFv99V4aQWWLi9R/sNE7lTNleAIH/qXH5ERhTV/RuUeAI6DDNFxSEhCJiYRCLg7qVbbO8ssBos2cwd5wvzcwZRM8LkJRr5y25HvN19SZ4uckV6VkjpckRX2BWPGAZlFZcwiczdF4KVrXbOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifnSTuDJqOZURT7kjFvAZMERUIas8xwYlFOSRtNG4cQ=;
 b=NUaDQ/i4rm1uyHxRkBsBUvyYrI0c3P0prDR4MjgDerjiEZQR3qwxp0l67D+WFrAx1EuJVgW/I8OfbCAj36qB23zsSEgWoUE+bAizHOAJ+rCEiTh6fHdAgO/poX2q4Hvy9Q5db4eM5gevOFhvOERViSRiqcCgszQE/GR4hvWD7wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Apr 2022 11:53:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2 1/2] xsm: create idle domain privieged and demote
 after setup
Message-ID: <YmEpoDHpGP3xkAQ/@Air-de-Roger>
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220420222834.5478-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf9bfdbf-fb08-4c6d-890a-08da237ccff7
X-MS-TrafficTypeDiagnostic: BL1PR03MB6102:EE_
X-Microsoft-Antispam-PRVS:
	<BL1PR03MB6102C29D49B9E94C49A144328FF49@BL1PR03MB6102.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ssmGI6n2QrZRNxBM8iSPQsDV83uQKomDJz+1Ru+ETdbMrBElfgn+HQrl+1mCmsYtgt630Y4INF16CZHdNdwmfkdmXIMX0GcEayBHLvFMVwxPBRX9n+ACsqYLAVdDcLUszjGhCC1/6FRZ5IUvHaz0kr2P5x5Uy+JlXGsZ3FjfNz7ghNjKrt+OtetHM1ZiibG2zoNHFeA9i5T0xW6SKiPFEdyKuLdf+uQ72qFMp1G/DrlTLLEtHso/Y/7gSxW+WpcPV6VF8mVkTdtGvEoIHTGOA0YvH19gYdYUciUWxn3uKRYnyWHARp6DpwgEZnhh+UhIOvodwn6kRLJD9vB918IG5x4Qs4dPfqEqxgL5ffLYjCxYMghysv2c2WnNsuLWBGXZvFcZ79KZY5voiL3afwBm4nFWhZveLogLj3vfX8F7zKUOHcnRSnBeGmbzIAZOhJZAbjW28SMxxkpDU3K4EaIya1DC9GlJzOCIJjWATZBJiKzTzZcMj7lKIN+D3TYISPjb9AtWRTL5o09ntj7I6Xu44QY1fzO9tnBKjK54A5AEyVD3G3QTWDGAaHsC96R6/15vC2m2qqa/v1/6SQDHrB4mNsIJ29KpaSDDehZkHBeXS+D/1tEiabu6e3mfZWZEvkSty7Q+WuWdLJM6vkYYLky8Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66556008)(66946007)(85182001)(66476007)(86362001)(8676002)(2906002)(4326008)(316002)(38100700002)(33716001)(83380400001)(26005)(7416002)(54906003)(6916009)(8936002)(508600001)(186003)(6512007)(9686003)(6666004)(82960400001)(6506007)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEZlR01MQTlSdEFGSGZrcGtKcDlOdHJ5MkN1eVBrZzFOVzJ6SjlCTm8zVGZO?=
 =?utf-8?B?NHNxb2k5ZFF3RWZsWTJsQ3dZQ0dwZnNGbHc1L2xsbUczNjg3Zk10cy82dFNv?=
 =?utf-8?B?VzBFckZNanJkNlgvZ3BiTTQ0dmF5aURyWGRRRkkzVFFTTXRQY1EzclNrQ0tu?=
 =?utf-8?B?cHhvd25TdnFKdjlsa3JCQjlPbDdabC9FYTFpZm1ucGR0RkdRWXR4UUNIS0hn?=
 =?utf-8?B?emxnRGJrcWVxMDdBMzdzcWdNNHUvOWYzenNqdG1jME9oMVBGTjZzRElxTjBn?=
 =?utf-8?B?Njc0S01MdkozTmFhNDEwT0VzZklwNDB4TnFPUzRCOXE2UXpoOHdhbmtEbmJD?=
 =?utf-8?B?b1FBYW9lVTF1d21TajBzTG1aUlRTYS9zOVlXeWJjQ0JXWFNqeXpNZFZ6dkp6?=
 =?utf-8?B?YVRHeERYV01vQ0lGTlZreWo2TXZnY1JVOEgvdTNoL09YeTUyVmRJUjJBR1Zs?=
 =?utf-8?B?RlNzQ2lqUEJrMkdUNE1INjhWU3hhMWgwcHZVZ01CdEFuOW9pVmZ4RjEzNEp1?=
 =?utf-8?B?TzVVTlBhekluUXk1dWk4NUFNN3VnYVQ2NnIzMmd2czBLZHB2VHB0My81cVda?=
 =?utf-8?B?ekpWNVVJdVp2SHlMdVgvSkNINy81ZFNCWDVEaEFPaVd6Z2toeHl0SlFhUkRv?=
 =?utf-8?B?SGQ3aEkwYXlVL2tEeEg5alFIWGpPbWNtc1Fub3gxa1U4LzhPaEpCZkhqRGU3?=
 =?utf-8?B?ZXNXS0kraG53WWhVY3VMcW1uRm02Z29Xc1BNT2paMWt4Q0t6bjVWeE54WGdG?=
 =?utf-8?B?akY4TGJXaVZGRHZpVDRUM0tuajdtL1FIRk9jZC9WRjB0S3FvcUU3dkFRdzJR?=
 =?utf-8?B?ZnRNayswSWlaMWtUQlBRdlZQRE1mQkZ6MHhHN05TQm9Pb2lSWS8wOE9CWFdz?=
 =?utf-8?B?Y2N3MmNWMWsraU5wbjJGQW5PQkxBajcvRDhlSnZXNEVrS1JRWnRZUVV5eTgy?=
 =?utf-8?B?RUJuL1Zra3R3VDJHVGJZa3JSQkR4ZEdVWElUZkNTd01CSlY4UWowTlA4WW9Y?=
 =?utf-8?B?ekgwWndGRFM3cFVyd0dHV0tkN1Z6Rkd0bXlrVUZRRnkzVFFXVlVTZUVIbEpE?=
 =?utf-8?B?cGNMMlFpTlVUNFk1WklLMkNyRjRGUm1ZODBjS0lndEpIenIyTXNQc1NUUFB5?=
 =?utf-8?B?dnVCbzExd3RtblBBd3RYcE9WVThMNnBzY1JMbFZHcit6MFlWajBoYmk4MFp5?=
 =?utf-8?B?YnVySDFTRTZXaVlDQVNuQzl3REdZcWNVQ2dLay96WnkxMVZ5bXBmYmltZzRK?=
 =?utf-8?B?aXhMdGVZWE5ubTVHWmpxMVE2azlkM3ZZYWN2eTQxSWlsSnA5bnJuSlBpejZT?=
 =?utf-8?B?MVhTYVMvcEJWUWV5Sk1vVGZsdlF1MU9DOHNwY3R3ZFI2VlV5ZU9mL2Q3c3NQ?=
 =?utf-8?B?ejYxV1ZZNUxlQkE1dW9CV3dEUWFCelBkM2k2ZHQvMEhIaXpPdlVHQ043SVpC?=
 =?utf-8?B?MmR4YWEwYjJlOW8xaW1TUC9QSUlKN2tsYThVVTAxV3V4SEVoM3F6NDBDYVQ0?=
 =?utf-8?B?N2V4VlZLcjFmZUU3QW9zQzMxSlhYdXJ0bXJCTlp4cnAxRDk2QkIyU3dIYWlz?=
 =?utf-8?B?ZS9qYldXY0VGWU1rNmFLcTEwRlVpai9UeG1aQ1hqKzBQQ2llaFM0QW54eXl3?=
 =?utf-8?B?czZOckp0WHpralRkR1FqMnE5WUw1MFlXTk5kdXRwTjk1Wm1yQWVRVk9yaWl2?=
 =?utf-8?B?TlAvekc5UnNvcnp0K0graW5WOGk0VzdrQjVjSWdKejRGQ2NiMG5QSHpsNkp2?=
 =?utf-8?B?M0pGMGdROVhOaVloZnorN25kWWdzSHcydllOR0dhQi9zTUJGWmZuc3Y1dUxB?=
 =?utf-8?B?alNxR0tBeGg2ZEJYcHoxYUFrNjk1UzFTT0ZtblNKZFR5UHFVRGV1dk5TeC9v?=
 =?utf-8?B?aTRUS3BoLzdhejZ0cXpDNHlQdkx2VjlHYm5pRXdGc3NUSlRWdjFQUTFoT0xF?=
 =?utf-8?B?L29rTGhYcisrM3VQNGg1UzFqOU9XWnRtSFBxNjdCV0tJbkhPc3dLWjRDV2hI?=
 =?utf-8?B?TVovcjQ2OFFMMnBtZVBkejdwakRXb3VZNU1jSk5mQmhrS3RIb0Ntc3lnYTI0?=
 =?utf-8?B?dEJ5V0trek4zQjNOQ2RwNHh4VS9kZjloVG9TSE5vZTJDZ0VzeWJyN2xmSG9E?=
 =?utf-8?B?WmViNE5Wd3JwYVNGR3ZzVUJGSTYzUUZmcFRncUIxRTBHdS9XRXdMYWI5UDBx?=
 =?utf-8?B?bjY5R0tiQVM1bUhmODVJWkpIYUJybHRVNFV4NE8rT2hRRVFtMGdGMGNLTXA5?=
 =?utf-8?B?ZlZMR29YaXNNYWgzMjk0SXdqVUIxL2hUcDEzK1pjbjNiOExpdEZER3RORjYy?=
 =?utf-8?B?RUpISFBqS21ISzFldG1KbmVIaEpVVGhmN2k4TWFYWXNQL2hmZTBxb2g1dXln?=
 =?utf-8?Q?5egGSzc5imRdbJzw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9bfdbf-fb08-4c6d-890a-08da237ccff7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:53:39.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vw6l253GQPZ3GR6rsycqKDjIs+XQTzvORNRRVV3ZM2QuGBjxj+ntFbosCvg3tXmHQYsQovl1W+TgzGFR5ACJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6102

On Wed, Apr 20, 2022 at 06:28:33PM -0400, Daniel P. Smith wrote:
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protectd by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit changes the idle
> domain to be created as a privileged domain under the default policy, which is
> inherited by the SILO policy, and demoted before transitioning to running. A
> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
> type to demote the idle domain appropriately for that policy type.
> 
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_transtion_running.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/arm/setup.c    |  6 ++++++
>  xen/arch/x86/setup.c    |  6 ++++++
>  xen/common/sched/core.c |  7 ++++++-
>  xen/include/xsm/dummy.h | 12 ++++++++++++
>  xen/include/xsm/xsm.h   |  6 ++++++
>  xen/xsm/dummy.c         |  1 +
>  xen/xsm/flask/hooks.c   | 15 +++++++++++++++
>  7 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..763835aeb5 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,12 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Hide UART from DOM0 if we're using it */
>      serial_endboot();
>  
> +    xsm_transition_running();

Could we put depriv or dipriviledge somewhere here? 'transition' seem to
ambiguous IMO (but I'm not a native speaker).

xsm_{depriv,demote}_current();

> +
> +    /* Ensure idle domain was not left privileged */
> +    if ( current->domain->is_privileged )
> +        panic("idle domain did not properly transition from setup privilege\n");
> +
>      system_state = SYS_STATE_active;
>  
>      for_each_domain( d )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..72695dcb07 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -621,6 +621,12 @@ static void noreturn init_done(void)
>      void *va;
>      unsigned long start, end;
>  
> +    xsm_transition_running();
> +
> +    /* Ensure idle domain was not left privileged */
> +    if ( current->domain->is_privileged )
> +        panic("idle domain did not properly transition from setup privilege\n");
> +
>      system_state = SYS_STATE_active;
>  
>      domain_unpause_by_systemcontroller(dom0);
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 19ab678181..22a619e260 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
>          sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
>      }
>  
> -    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
> +    /*
> +     * idle dom is created privileged to ensure unrestricted access during
> +     * setup and will be demoted by xsm_transition_running when setup is
> +     * complete
> +     */
> +    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
>      BUG_ON(IS_ERR(idle_domain));
>      BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>      idle_domain->vcpu = idle_vcpu;
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 58afc1d589..b33f0ec672 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
>      }
>  }
>  
> +static XSM_INLINE void cf_check xsm_transition_running(void)
> +{
> +    struct domain *d = current->domain;
> +
> +    if ( d->domain_id != DOMID_IDLE )
> +        panic("xsm_transition_running should only be called by idle domain\n");

Could you also add a check that d->is_privileged == true?

Thanks, Roger.

