Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27E7B50DC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 13:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611431.950979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGm6-0005tq-Cx; Mon, 02 Oct 2023 11:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611431.950979; Mon, 02 Oct 2023 11:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGm6-0005s3-8v; Mon, 02 Oct 2023 11:07:42 +0000
Received: by outflank-mailman (input) for mailman id 611431;
 Mon, 02 Oct 2023 11:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnGm4-0005rx-Mv
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 11:07:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5106eeb-6113-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 13:07:38 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 07:07:34 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by MW4PR03MB6426.namprd03.prod.outlook.com (2603:10b6:303:121::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Mon, 2 Oct
 2023 11:07:32 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 11:07:31 +0000
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
X-Inumbo-ID: e5106eeb-6113-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696244858;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oZLip4tR0yNeU1o8g+YRI9CGG1Oq5v0YC+LWOSUnF1k=;
  b=PAOWguzbha7ccRCH22ipl4T/Df851ibQOCho9ocgzc0YnNFBJcQmWNFs
   rJ64mOJvsslLQ4F5P350ajTwVln0CciWBEWHNyQw5lb5xlGMcLxKZQarD
   gOGnzAKje5SEeztH9F2Uo7hRuXKJ9XYqxFCVGThbxO/cELYFPswPeCi3i
   E=;
X-CSE-ConnectionGUID: Lkw2wk8WR+ea/nhjWN1v5Q==
X-CSE-MsgGUID: SdEcOTHLQ7amRi3EMrl70w==
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 124377054
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:F2kYHamlmGAotF9cVukXjTno5gyQJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJCmyHOv7ZZ2H0KNlzbNy2/UIFuJXSx4I3QAJr/Ck1QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dgbN2oSbUC8vaG7yfW9SutToJ09cfC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee3WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmnA91NTODknhJsqGaf62c0ND0ybASypMO40WObQdYAc
 1NBr0LCqoB3riRHVOLVWRyzp3qN+AARR8BRFewS4hyC0afS7ECSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LFa++jtTxXzbq0
 T2OhCE7i/MYistj/7W2+1HOxSilqZnAQgc24Rj/V2epqAh+YeaNbp2h7x7Y8PNJNsCZR12Ns
 WIsks2SqusJCPmlnyuLW/gJALCv6N6PLTLHjFhgWZIm8lyF+XSuYIRR6zFWP1pyP4APfjqBS
 G/evxlAoqBaOnSCZLVyJYm2DqwCz7XkFNnjfuDZaJxJeJcZXAWK5j10bEicmWXkilExkLoXM
 I2eN82rCB4yN6NjyzanQvYH5pUizCs+2GD7SIjyylKs1r/2TGGRYacINh2JdO9R0U+fiADc8
 tIaO87UzRxaCbT6enOOrtRVKk0WJ38mA5yws9ZQauOIPgthHicmFuPVxrQiPYdimsy5i9v1w
 510YWcAoHKXuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:d90SGKhlGx6MTnCJD1ZR0xRlkXBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-Talos-CUID: 9a23:li52sGBRJEriQ1r6Ew1k6xQLGZAaSD7QxTDWI02HLz93FYTAHA==
X-Talos-MUID: 9a23:9HP+xggb1KNqNMjkdGkPwMMpD8tF6IOSKGQ0zpwDgcjfGAlqP2jFk2Hi
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="124377054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJYnxVrZoKkSoA8vpiECBA4P0y2p/4BgDb4ZZh8y+xR7+XNU+PhTSZiGSJLym1icW+RHpIYsXI/deYrHNCJlqVDX6vte0ZLYcH2bJLAJsKk3AJ9Ho2Sah7MHgC0bxtkbkYlqPFDp7mxdb34EnwCXnGPcsEEFa9S9+Au+SY6B1adKQBYyWrDhpHYxHCbojcrWLLC298LUo669iCOl3XSp4UPJ61p+M/fuGIRC+KYvJi+PiRekvJlvB0Ce96mEGchZO7i1a29Jq0asc3qKoL1ir9vsZPVctprWAHhXmRphnbbbcyfiMIwa6zpl2FC3XYfmVobcnYHm/od5QJEVfkcWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNCd0y7BtYdmbA8kTcy0EHbJEzWCKpTuLLtFCzKUtME=;
 b=i4nYVwYvdmIHQahoaWC6PIs3fwhmRfWQ4hHEAvA81kiDVMYT4Swg4C0Y7dksoPcfKOxm3Ei6ZQIAZsxWqts8HtkiVfQ125vZdzhI5MQxJPSbPltCGw7y+HQZjwBP/K4igKyRYEF5ChWKo/kD5RP9vOe6DDg99i4cbXOsFOWM0UxIFX7W5K7+WWhiztDF5mWioOccaxy2Bfu1yP136pvJ1tmMj9y3wqnVl1XqtbtXWxHdpXeM/OJxtCdW8OQJ92TXIrkVh34d7EqXR8zOwdh4d9x81nNZ2aLulm9k6bpaZ3ZVrijv/qeX8pCW3G+Sh06H8Qyv5Lw556rMu1t+Ua3gHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNCd0y7BtYdmbA8kTcy0EHbJEzWCKpTuLLtFCzKUtME=;
 b=uRkIIsWZHut2awsvLdgbk/k0jD5+gM2xIh2KjjUmKmoyxnezb/9o9oN0EzQQfvfCdNMcE1l3XizOewGje5amNUaSqVmhvVLRTxPL9GsMKX8CuqqjylBYibb/KQl7x7xwqRPwyQ9t9bO4hl+n29cvpdx353N9RlB6i22dyw4VJLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Oct 2023 13:07:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	jbeulich@suse.com, andrew.cooper3@citrix.com, Henry.Wang@arm.com,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/7] xen: add declarations for variables where needed
Message-ID: <ZRqkbeVUZbjizjNv@MacBookPdeRoger>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
 <357a35c3035d0f8659a64d767791bc41d57494d3.1696232393.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <357a35c3035d0f8659a64d767791bc41d57494d3.1696232393.git.nicola.vetrini@bugseng.com>
X-ClientProxiedBy: LO4P123CA0119.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::16) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|MW4PR03MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cd6add-b05f-4ec9-c133-08dbc337c5ad
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikPWsaE7G0difDd6AJbO5LG7Px7f/0Hu1322qtxTzRJM6Z4FtWMCTr3ahK+d3vtyHCWruRRTfZzmcFYkO5DHIxks88Jn12ylgpsS1/sgJSPAXPOq9UI3wj/s4pfx9YvaqFoUmUngKUpjUQmA21mU0CN/w9t0d0+mTuaIg4YAygTL/tFfLcrUBJnLVPtCJyB8p3d7hcr1ugC8XOZTiiIZoLADjiUIau1QbrXvHKPTf9nrANojxU9RIR12jEE1FsAu/RSTadhKPo0iqzMmsM8KskHB9+/NGaENmcywf3kEnWeZEnpjXjcdFOpL+ZoRvywoZ65q8Sa4Y3TCcGlHCgUFN3NScfKuuWWM/ziCx9DfMWvO8F/J7IY6qFzlAz4zap8fFF1vIxlFKTpMYGw+nsyFHeofArT+FSFPmzyDNiuHoh1ijaRRngDSxOoXy5WRqE5YTRKt1MIwG83Ypr22l6JBO+XVNeUKDc8UtYEY63aSVu7OBEgQVWVf0ooafsQaSEQKtXxLlXs3jt1SYIpMDiHZStGk9xSnXkkQ9Qb3iyCQNtHSw/vAqDyLVxkeO/irYg/P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(9686003)(6512007)(6506007)(82960400001)(6666004)(86362001)(83380400001)(85182001)(33716001)(38100700002)(6916009)(316002)(26005)(54906003)(66476007)(66556008)(66946007)(7416002)(2906002)(5660300002)(41300700001)(8676002)(8936002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0N5cnl2SUh0RDZOVWdDYWRTYkxpODI0eXlROGUveUdFcWVnbnlZL2kwK0Za?=
 =?utf-8?B?bE9UTXZOeUthMWNrcHNiNkRvNEZUdXJub3JwT1J0ekZhbDkyVmJyTFRtRHBw?=
 =?utf-8?B?d2RQS00yWWY3Sk9TSG0yTGNRQnlFZ01CaDBzUGExcEFpWWpYNnY3L1FXNDlS?=
 =?utf-8?B?NGxTVitZWHdYQ2JSbjZTQ25RTnhHaXRlWUVUWDBmcFVtV1lMa2dNc2NXSUU1?=
 =?utf-8?B?WG9GdFgrbUFDSEFkME44Mm0vK0pXcFEra2R2c0dIY0MzSnJmWU84MjFidDZP?=
 =?utf-8?B?RWNRWGlSZC9wSndrZC94dm90OGRiSS9iNURWUHBTSjJiL1JPcHBjaVJkemZi?=
 =?utf-8?B?OS85alBtdmtDcU1XYU0rOWNNZ0I2cHlwNkRtTll5WGZBdkJ4ZlU1YVNlTlc5?=
 =?utf-8?B?QzlINWg3a3VxTmpZaVJtc0xHS2h1ZU43dVhUV1FWd3lOSTFKTnE5aE8zZVdF?=
 =?utf-8?B?UXRSRmwrODRmZFVUb1YyNGloNlp3TEF4NU1mNmEvM3o0Si9qNDdIUWNOZXZL?=
 =?utf-8?B?MlphMVE1cHFnSVdGS1pHR1BNc0x3VUc2dlF5anZ2Q1NTOWt3ZzFkeVlDU041?=
 =?utf-8?B?ZktWejNNUDNyazlsampOOVhjb0NFeE5HRkpweFRqZVRCMnVwVHRoS0I4M2Z3?=
 =?utf-8?B?bGl0NDhkRmtDUm9qV0ZCajRaQWFyVVJKSXhBb280SFZZRklXdkYrUnRHTlQr?=
 =?utf-8?B?bUwrTHlyT2UwZG14KzVNUGZrV1hkdXZqMlp3M0dlSXhNREhQRHlsUXpCaXk0?=
 =?utf-8?B?c0lTaXBDOG9tM0phSFZrYWNhR0xDZnRXdWgzN3dNaFhLRTZJVTdWUkk5SW9R?=
 =?utf-8?B?UGl0bnEwc1RsNTF4N2FGbDVDZlBKbk1NRWtUSjFQaUVmZ2lwUVpxN2ZWZ0Rj?=
 =?utf-8?B?eFF6NEUzdG9BNnFRSXVxbHMzSGlyZHRyYjFMSGNSK1dzTVBoZnYwUUtBOEkx?=
 =?utf-8?B?SWxVQXNxNHI4NzFGbUVSSWdqNzdUTXZBSSswTGVyaDZ4a3RiMENWUW1DVnZ0?=
 =?utf-8?B?K3ZQd3NGVUcwdU4veWl4cWZIVlBVZTNFVTQrVUxMUmx5U1R6aDNXSjdXMnor?=
 =?utf-8?B?NXp3cEQwVjBzR2ZmVXlUTVFlczZhdXk3RkN3eU5GdndZb3ZWdDMwRmgxRVE5?=
 =?utf-8?B?ellHRWVQY2pDTVB6MTdPbU5Za25wakx6OUpxVTdaQkNYZHFabEEvUDBjN1Fh?=
 =?utf-8?B?dVRYbjBIS0ZSUkxIbzh2NWpCaS96anA0bmI4OW1jWlRyRnM3eHVnZWF0Y29U?=
 =?utf-8?B?YVRtQzhoZURZSytZa1k5WVlHRjBpMmNuYVZ1NzRsWjRjSnBMUkR2T2M3Nk0z?=
 =?utf-8?B?blQ1b205T1l0dTdtcGVueG1zc3RnUTcydy9MU0Z0dTloY1FLOXBLV2pnbysv?=
 =?utf-8?B?WlFQbmE1czZmdFhHYStYcTIxTnQyOWtXL0ZxaUF6WmM3dk1hMXhEQ2VBNzdQ?=
 =?utf-8?B?NGIyaXczR3N6YTIxdGlRRVl4elRkd2RCT1BRWDNRTDVuTys1bGMzb3Ribzly?=
 =?utf-8?B?N3ZYNTZaSXZXVEJDZU5xU29tOUcwcnBOL2kxQ2laTi9KeVBOSUJjNmlwRUpY?=
 =?utf-8?B?TVVFTnlDUWtETnM3NUNGbmpOZ2ZEV3ZJLzBoMmZyMXFrOTlGZks0dzhiVmM1?=
 =?utf-8?B?eFB4S2FWSytQYmlpM3R0cXVEbjRHb0tVck43ME5QZi94Z296ZWt5YWZLRHBr?=
 =?utf-8?B?eTRHK2JuMWZQQ0tmRDltN3RXVGhjR0xQZTBsOXp3NlpwV1FiWVBvV0VpamIz?=
 =?utf-8?B?Um9jOU0zRjl6RnBzWUFnd3NBajE5ZnB3Q3NzQ29LZlZaY1hqeDA3QTR6cTBt?=
 =?utf-8?B?Y3BQTU42Q2VLZHJaYnJ4SGgvckMySHVYMzVqU3VWMGN1OVhkZ1hDUG1YWnhi?=
 =?utf-8?B?OC9BSy9RdFlBT203cXhkUWNoR29ucHk1bUNWaWd0UmdrMUtlV2xkQjRic1hQ?=
 =?utf-8?B?WExZRmtGaVFGakdOLzhld1hhSE1IdEJmTHZiamMxNUxINDJ6VnUvV0xTWkRD?=
 =?utf-8?B?V2hsQ0NyNnpRRksvWVVld2hmQUEvNjZWOVFPTVhsd1gvK0tKeTJ2eVQ5Z3Fs?=
 =?utf-8?B?emt3QVBacUVTejhrUWFTbWFjMklicjh6b3ZFOUVORm5HbmU0YW9qSmFvU1hD?=
 =?utf-8?Q?2/9eCfvBhPp6cOO5f6LA2j3AK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?TWxWOFQ2Q09VOGl6dFJndEZlcDR4dENpRDNmdUluSWpuT1pPVUJ4ZE5ZcThD?=
 =?utf-8?B?QStDSTJLVEdtUzVUUzNuS0tDOTY5M2pSTFpDcEw5TXY3emF3NlgwTks5YlFJ?=
 =?utf-8?B?ZTNkNDlEK0FCak84aEFpb2kvek15SW04d2VzTVE4Rjl1WEd4RzNMQTd1aFYw?=
 =?utf-8?B?a0VBVTIxa3ZTZFU1UTZPVWczaWRDQ0VJYURsUWxvQjZMdy9UQzg2WVVEeVc1?=
 =?utf-8?B?bUk4UEdzZjlqdTBJVDdGc3hkaHdLdmlsN1ZrOUJFS2NTa3d5ZlB1dVNQNVVk?=
 =?utf-8?B?MUZSZnQzWE9JemJCNERtdkxOMFJRVWt1RWxkazU5RXF6OFVkYmZRbnBvUVc3?=
 =?utf-8?B?K0Jjc1JLa3VrYjV3RS85NzV0d1BSMlNIbTdlRklrdGVlZCtvbHkyOGkybVdz?=
 =?utf-8?B?RUd6VDdVWlBHYkt4Y0RTbUpZZDQyYnNjdE5PSVdCRTZGZFdWOFVvUWh3Rldl?=
 =?utf-8?B?UXZkdlZSWE8yVE1idy9TeG11WEtPSVE4ZDZZZHNaY1VmT2lkdElERUlrcm9x?=
 =?utf-8?B?T0lqbmtnT0NmTC95SmhOcEtMeEEvdExhS1VvUXUyU3MrYUw3TUlRU1FBWUcw?=
 =?utf-8?B?NEZYcXFwbEsxTUF0K0lNbXZ1TEdOQzBodHhTeXM2cTFWcjVxaExmK2JKRVRK?=
 =?utf-8?B?STY0OE51VHhPckE1ek5TK1lVMi9uUXo3b056VWFhVFJYdUZPZ3JKYVJWNUVo?=
 =?utf-8?B?M05SNWdFUnkrZ0NiSmlYZU9SejVFZTZHK3Y4M2RPUFJxUXl6SzhsU1hJZy96?=
 =?utf-8?B?c1JUTTM1eFFDL3JJYmFwemQ5akc0YVJuL2t2SHJpRzROaDArejlMVDJJc04v?=
 =?utf-8?B?Wi9iUlpsdzJWMytZbUd4ekpxeUd2UUxaTi8zb2orN2pZY3hNekdFTFk5eTAw?=
 =?utf-8?B?N3gvZVZiSUxBSzQvRFgvaTlJcG51KzZpRnhxSXI2QjNKckMwUUQ2VHFmZDhO?=
 =?utf-8?B?Mi9paWIvdW1LZ0JVVjgvSFdKRDR3ZlhDc1cvU0UvN2k3NW9WRjJLVXZhY2RU?=
 =?utf-8?B?SGxiNFJFRjZEYlhsWDNRM01RYk9VV3ppTDlqSU9EQnp3ZlZmMDFWdUNGeWZS?=
 =?utf-8?B?ZGErT1kzMlQzeENSUUVPOGV2YkhQd3kvMCtTWUdyRDljSjZrVlp0SWZjSWhE?=
 =?utf-8?B?Q2FkVkdaS3Jtcy9sVjVlb0dSSzhVS2R5bTRXY3BQZ3l5cTlDTHQrOHIrbklw?=
 =?utf-8?B?MW1CM2dkdndOMGlEcC94UlpZNm9XMGprRGpibDZNWHEwZFUyOE5jWHNlWUs1?=
 =?utf-8?B?U2lraEovVVZVTnZuTzBTcWlEYkZjcktYZk1KN3lnL2NKRUhtZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cd6add-b05f-4ec9-c133-08dbc337c5ad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 11:07:31.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UupHJh6Iq52tZni53n0yv1yA4bLAcoI1je02vvjQp7JQodzSnvI+bM5onIK0iSRykx9GesAmKi4hRCqvCPv+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6426

On Mon, Oct 02, 2023 at 09:49:44AM +0200, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Providing such
> declaration also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/arm/include/asm/setup.h  |  3 +++
>  xen/arch/arm/include/asm/smp.h    |  3 +++
>  xen/arch/x86/cpu/mcheck/mce.c     |  6 +++---
>  xen/arch/x86/include/asm/setup.h  |  3 +++
>  xen/arch/x86/irq.c                |  2 +-
>  xen/arch/x86/platform_hypercall.c |  3 ---
>  xen/common/symbols.c              | 17 -----------------
>  xen/include/xen/hypercall.h       |  3 +++
>  xen/include/xen/symbols.h         | 18 ++++++++++++++++++
>  9 files changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index b8866c20f462..8806a74b216d 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -183,9 +183,12 @@ int map_range_to_domain(const struct dt_device_node *dev,
>  extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
>  
>  #ifdef CONFIG_ARM_64
> +extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
>  extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
>  #endif
> +extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
>  extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
> +extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
>  extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
>  
>  /* Find where Xen will be residing at runtime and return a PT entry */
> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
> index 4fabdf5310d8..28bf24a01d95 100644
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -6,6 +6,9 @@
>  #include <asm/current.h>
>  #endif
>  
> +extern struct init_info init_data;
> +extern unsigned long smp_up_cpu;
> +
>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>  
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 6141b7eb9cf1..e855f958030d 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1682,13 +1682,13 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>      return ret;
>  }
>  
> -int mcinfo_dumpped;
> +static int mcinfo_dumped;
>  static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)
>  {
>      struct mc_info *mcip = mctelem_dataptr(mctc);
>  
>      x86_mcinfo_dump(mcip);
> -    mcinfo_dumpped++;
> +    mcinfo_dumped++;
>  
>      return 0;
>  }
> @@ -1702,7 +1702,7 @@ static void mc_panic_dump(void)
>      for_each_online_cpu(cpu)
>          mctelem_process_deferred(cpu, x86_mcinfo_dump_panic,
>                                   mctelem_has_deferred_lmce(cpu));
> -    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumpped);
> +    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumped);
>  }
>  
>  void mc_panic(const char *s)
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index dfdd9e555149..3c27fe915ed4 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -13,8 +13,11 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
>  extern unsigned long xenheap_initial_phys_start;
>  extern uint64_t boot_tsc_stamp;
>  
> +extern char cpu0_stack[STACK_SIZE];
>  extern void *stack_start;
>  
> +extern unsigned long cr4_pv32_mask;

This one might better go in compat.h, albeit that would require it's
setting to be gated to CONFIG_PV32.  setup.h is IMO for init time
stuff.

> +
>  void early_cpu_init(void);
>  void early_time_init(void);
>  
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6abfd8162120..604dba94b052 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -43,7 +43,7 @@ int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
>  static unsigned char __read_mostly irq_max_guests;
>  integer_param("irq-max-guests", irq_max_guests);
>  
> -vmask_t global_used_vector_map;
> +static vmask_t global_used_vector_map;
>  
>  struct irq_desc __read_mostly *irq_desc = NULL;
>  
> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
> index 9469de9045c7..e4dbec73d784 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -36,9 +36,6 @@
>  #include "cpu/mtrr/mtrr.h"
>  #include <xsm/xsm.h>
>  
> -/* Declarations for items shared with the compat mode handler. */
> -extern spinlock_t xenpf_lock;
> -
>  #define RESOURCE_ACCESS_MAX_ENTRIES 3
>  struct resource_access {
>      unsigned int nr_done;
> diff --git a/xen/common/symbols.c b/xen/common/symbols.c
> index 691e61792506..7c3514c65f2e 100644
> --- a/xen/common/symbols.c
> +++ b/xen/common/symbols.c
> @@ -21,23 +21,6 @@
>  #include <xen/guest_access.h>
>  #include <xen/errno.h>
>  
> -#ifdef SYMBOLS_ORIGIN
> -extern const unsigned int symbols_offsets[];
> -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
> -#else
> -extern const unsigned long symbols_addresses[];
> -#define symbols_address(n) symbols_addresses[n]
> -#endif
> -extern const unsigned int symbols_num_syms;
> -extern const u8 symbols_names[];
> -
> -extern const struct symbol_offset symbols_sorted_offsets[];
> -
> -extern const u8 symbols_token_table[];
> -extern const u16 symbols_token_index[];
> -
> -extern const unsigned int symbols_markers[];
> -
>  /* expand a compressed symbol data into the resulting uncompressed string,
>     given the offset to where the symbol is in the compressed stream */
>  static unsigned int symbols_expand_symbol(unsigned int off, char *result)
> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> index f307dfb59760..12de5a69b5b1 100644
> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -24,6 +24,9 @@
>  /* Needs to be after asm/hypercall.h. */
>  #include <xen/hypercall-defs.h>
>  
> +/* Declarations for items shared with the compat mode handler. */
> +extern spinlock_t xenpf_lock;

I'm confused about why this needs to be moved, AFAICT xenpf_lock is
only used in platform_hypercall.c, and the declaration is
unconditional, so there's no definition without declaration issue.

> +
>  extern long
>  arch_do_domctl(
>      struct xen_domctl *domctl, struct domain *d,
> diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
> index 20bbb28ef226..92540409265e 100644
> --- a/xen/include/xen/symbols.h
> +++ b/xen/include/xen/symbols.h
> @@ -33,4 +33,22 @@ struct symbol_offset {
>      uint32_t stream; /* .. in the compressed stream.*/
>      uint32_t addr;   /* .. and in the fixed size address array. */
>  };
> +
> +#ifdef SYMBOLS_ORIGIN
> +extern const unsigned int symbols_offsets[];
> +#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
> +#else
> +extern const unsigned long symbols_addresses[];
> +#define symbols_address(n) symbols_addresses[n]
> +#endif
> +extern const unsigned int symbols_num_syms;
> +extern const u8 symbols_names[];
> +
> +extern const struct symbol_offset symbols_sorted_offsets[];
> +
> +extern const u8 symbols_token_table[];
> +extern const u16 symbols_token_index[];
> +
> +extern const unsigned int symbols_markers[];
> +
>  #endif /*_XEN_SYMBOLS_H*/

This one is ugly, but I can't see a better way immediately.

Thanks, Roger.

