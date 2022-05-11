Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB875234B2
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 15:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326885.549542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomjY-0004Zd-Ma; Wed, 11 May 2022 13:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326885.549542; Wed, 11 May 2022 13:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomjY-0004Wm-JL; Wed, 11 May 2022 13:50:32 +0000
Received: by outflank-mailman (input) for mailman id 326885;
 Wed, 11 May 2022 13:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nomjW-0004Wg-Vn
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:50:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c6dc71-d131-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 15:50:29 +0200 (CEST)
Received: from mail-dm6nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 09:50:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5263.namprd03.prod.outlook.com (2603:10b6:208:1f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 13:50:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 13:50:24 +0000
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
X-Inumbo-ID: 50c6dc71-d131-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652277029;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sUHJTfbmi2qdpffDXNXVrXcdOZLEHvpax6szxKt+6Jc=;
  b=b3WzdN0ltulVRFa0GmsnJnS2ntSgLxOZGC+CmrkJh3B7g22obxaPaZSd
   8VW1Q1N9PrF/xDzV+M6FSvLP7eOWHh++2ERLxl8wuXBerOuzOUqSSO9WV
   Jkw2kVgAyBJ+yYJeKHgNRqEVv9PDMvHqyU83ez43d3ohN98icjm6a3JC2
   4=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 70942123
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gs1eK61fGb5s+cfbA/bD5d5wkn2cJEfYwER7XKvMYLTBsI5bpzYEm
 2VJUW/QM6mNY2Lzc98kYYy39klQ68XSzNYwQVNopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ip63qZAQ3YpHdt+NAXVoADwomfox/reqvzXiX6aR/zmXgWl60n7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfmRjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGuL2cB8gn9Sawfu0zjkBwhyZTWCfHtUPugS8N7mxmGq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0c9ldDew8rh2Mw6z84gCFC2xCRTlEAOHKr+czTD0uk
 1OMwdXgAGQ/tKXPES7GsLCJsTm1JC4Za3cYYjMJRhcE5N+lp5wvihXITZBoF6vdYsDJJAwcC
 gui9EAW74j/R+ZRv0ln1TgrWw6Rm6U=
IronPort-HdrOrdr: A9a23:Puhc56r9dK3mHAomQOlwL2MaV5uiL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCDwqhoPRPAh3Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegx2w
 2LCNUtqFh0dL5mUUtMPpZ+fSKJMB28ffvtChPlHb21LtBPB5ryw6SHkokd1aWNRKEi6qcUtd
 DobG543FRCDn4GT/f+kaF2zg==
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="70942123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM+/pCys97UrkwiXeOUlz5mZS40opGI3c8c00KKY80vCfbcokBv7zFV4YmO2L7jqFtNnPmxcf/mjCCxshdmBkQU5ycuSpF2nrxexDbH02HFYtWAu4cb8kr1uqUkzfiZ25tbE/Ex/9ZeFmIwIAkuGrJlU0fNJ91mz2aoLNR34gCtrEXDcdHHlXX8hqukUHV9Z6mgsqOIX9a6d+b3E92htxTkb0NJHHWNFy6RQ41alWlDMQqZtVgBxa/OT6W72THNBu1R75AhvUDtvem4or7wl3u/m6Aib/GdLUdcAEpkj8FbG0c6uvVeUaRTw8ie8P/LipRjGyoyqDwGTCw6kZh6cdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdJ4Yz6ryBPi6qOEetDDDksYNq+VQ8rhd0zvNvhefT8=;
 b=GHh1rKuOxpL1TfOTm/A81dXuG3GTfZWrwPZ1kbI36Z/RL/vssiSUf9u8lMti1fDf0W0otsPhP1YqCnwLLwaVCNdVd04fbiw0P0+xZ7Q/K+YvRAhIDQot08Mx+HudhubDTE7Bhs9a4+3FUmPZ1eVo9lfq6PsnRg2IBfLhyvv0Czpl4LsffIIOIERaYKX2oYSJxV89t55EtJhuehxaIiAFmpSpE3FQtFf0w8AhuvnlbZnWLdNwC4CxFoGaEHu6GPBcnIOu2hffDL8+alTST1aG8auCZzU/+OvoHjYc1JTrWCFd2NH+lpFql1pNSra7E7yRvzF2w6YurwMrdLQUlngpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdJ4Yz6ryBPi6qOEetDDDksYNq+VQ8rhd0zvNvhefT8=;
 b=PsY/EhMfNyuRdoIYsLnMQgoCC61OLpz2ImhNGvnjepdJNMFLZvKq0zfJVjU3ME+MSlieDIs4UEtBhUwEK7CrpiGP3e5pY4a2ceXN4b5io0DoG/vd732At6XC+mPp/+RSlqRNHWmK1eAUrVNtoyQOE8AqqxMkjBeXMHi1h1yXAjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 15:50:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 20/21] VT-d: fold iommu_flush_iotlb{,_pages}()
Message-ID: <Ynu/HIW2SEnJ+1O4@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <eec16b83-7f8f-e94d-b1f6-9113ff93fd14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec16b83-7f8f-e94d-b1f6-9113ff93fd14@suse.com>
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74ad91fa-65af-4bc1-b269-08da335532ee
X-MS-TrafficTypeDiagnostic: MN2PR03MB5263:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5263615F83F2DBB41B4487878FC89@MN2PR03MB5263.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ly7q8Q1aRrOq3cZ/o0yuiFpF1EvTYK+CKG53H962qSg7yhDKC/bl5czNqdr5C+dxuaQ4tGH6RX6QtMn6ZtF53mgLWFnEJRYCXd3jJUn/La/hUiGn/bx6OnD+jMsMSYwSQJvUOWOzGvu5Thtyfe7IbuswNs6KFg0uPyuliDK11NCt7GjdzqNNi7jVBhm2GwM+MLENhtalXRgCpuCDH/SYeK44mhGxaSJfzD1IqBnsd/J6NRquneyfNXMA6a5ZoObh+NJVq6q8OKkz8iX7wQ0LwVvk34l9+oyz9Kz+EW/LRXKlQepAnkNYy90HY4kF0C2C2ixYhCgEtE1O4WGI/LjHnnrz5ioEhU66DzxWT1a6vwuLY9CAFhZ4OyHOel5n0HtBbR24m2W4BUFK35QrwNJJ99UQ+3DZm2Y3DGeUaZIPg6YrLBaDYZeJepn52KzAk0hJ2WXdneHPsOEurEO2nxNIL9XyExq8qZGPSK4AARpg0xW9yOWDZmnHQ3COVmDBS9/97yl3afLlGNIWdfWzzWsFk6FnvzVwuK9JdEPbGYn/Z6JJwyr4RVpmGK2pHMkeFvxw4R4o1L0GEJXES/kl9LswwcX+mBU2xzMQvnRZO64ROvSiME8e7K/ZYV3a9HLwc1bkv/i17GDbJfjvR7JSq+0jFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(316002)(186003)(6666004)(85182001)(8676002)(508600001)(8936002)(9686003)(6512007)(6506007)(26005)(6486002)(4326008)(4744005)(5660300002)(6916009)(38100700002)(66556008)(66946007)(66476007)(82960400001)(86362001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi85d2FWY3RGZXcwNUtOTjZsRmI2QVdmR1prNWc5ZFdpbFRBZ3kza01HSzky?=
 =?utf-8?B?RGVvRnBoclZUeDNaR3pqaVZRVi9CSEZzNkxKeituTlFHdXNQcjh0MVV3aHRR?=
 =?utf-8?B?STZnc0picE5GRUp0QThCeGNSeHg4SW1IOXdKdC9YakF6ODI0Qmo5TWJ3dVR3?=
 =?utf-8?B?Nm5YOG9xWHBQNldEUkZZUnR1cU53cEd5NzRnTzRsL3BhckZVcnZIRkd2TDJy?=
 =?utf-8?B?amdBd1VXQklwbzNyZjNubmU0TVB0RFdSVjBGRzRyMkhoSy9SOURVZEE3aWdQ?=
 =?utf-8?B?Y3ZhSll2ZVVoU29JNlBsbTlXL3EyNGJFVDdjdkltM1FqckVyV2FMbGFFTzcz?=
 =?utf-8?B?MCtqTE11TmZ5VlJ2YjdLaUFybVUxRTFaSTMvMCtiVUljZWs0aXlJYTIxZEVT?=
 =?utf-8?B?M0NrMzFQakNwV2NCRXhvSVBQeUk3bGN1KzA5ZzQ5ZUVQcTZORDllRU5FTFBu?=
 =?utf-8?B?SFgvQVpKMEZTQkxtcTk2UkNoSTVZT1NubXNMVmthQkRHRk82ak9XRk52M09s?=
 =?utf-8?B?aUJteEQ4STBUcTJZUmFYQ09ab3J4TWNlSTNpL1BMUzVHY2NTVHVPdnN6UGU4?=
 =?utf-8?B?dGR6L1BLWWFrYUhndkcvVmYzVUF5OCtzMGFBUHBVZW91WkxWcEpObzVoSkxs?=
 =?utf-8?B?SnpXcHdCNkN4clhNWmpTdnN3b0FjSmJFb3c1bURSM0dCN0dMdXNnTXBZR0FT?=
 =?utf-8?B?QktrRTVselJVeVJTZ0lpa3RBRUVRbnhpNjl1aC9uT293amVuRFFCcFE5M0Nu?=
 =?utf-8?B?aFZsc1B0MklOZTBZSkZSYVBrZXpmNXYzVzdXU0lCL1dSb2d3dy84ZG1lUjkz?=
 =?utf-8?B?OW5sTnJkWXhjSFJUek1MVWpuMWNrRUtnbk16RTV3NE5wcG1OMVJhOHJrSlJF?=
 =?utf-8?B?c1JpaS9MY3dwMm5pbUhLdEYwQTZLZnYzZWd2VkJLK1AyTHp0cHRBZm8zMGN3?=
 =?utf-8?B?SVNWa3RwSThCYVk3bndNWXV6VDVhN0JkNC94SHY3SXVzQ0N2Nmt2SEpXby9U?=
 =?utf-8?B?S3Z6L253cjl6SHVWMG95TElYMU5QYXlGa2RLdk9qSFd1SS9TcnpFa2ZRWWw3?=
 =?utf-8?B?Z29xR2hmdWpoSFRvenovTUsyNUZWVkV3bXh2RUQ4TytockNRNkpubmxlTG5q?=
 =?utf-8?B?SVJPelNpTWhwK2toY3UxSGpVd3pIZGZGN0FoU2VXRXRaeTBZQnVpdms1NVBq?=
 =?utf-8?B?UHZQQlJZMDlFTVIrNnZYQnFUM3lpY214OTkzSis0alQ1ZVR0bC9SQnUyYWVE?=
 =?utf-8?B?UHRYNWl5Ui9Bd3lMaHpsdnVRUjhVTCt1K0M4MkpzWjJwUHNoNDREUVJjVHk4?=
 =?utf-8?B?eGcxTm50cHNBbGpsVkdZOVB5dTRyYzRVY1Rzd2tub0QrRlk2a1JiRkJ2Y0pX?=
 =?utf-8?B?d2NDeUwzeERMVEo5aG8yeWZnRXczR2dUYUJxR0dvb2hWbHNwS2lBMmtiN3Aw?=
 =?utf-8?B?L2JjaG9Vbm1abHhQbGJNTFVNU2tsNVAzN0l5Q0EzN3ZodlN5azY3cFR2eFpY?=
 =?utf-8?B?Y3pwUmVUTlg4V3lBaEFRVzlNUnpRa0U4Znc4T3ZqVHdMRmVNV3VpeVFPTlhD?=
 =?utf-8?B?RG9iSzdYK0ZVd1RDeU53dWN1dmZ4dzVTNE9aL1RoQVd1QTdZbDNtV2N2bXdM?=
 =?utf-8?B?QUJFTUljM0NHcnFaNUdxVGJybmt5Ukd6S2dRem9FQTQ4b3VsRWNkVjRXMlc1?=
 =?utf-8?B?cTVLNUE3SXYyaG5zaHFQMDhXN2UvdXlFVFdMQ1hZNktvakx3Zml3WVpKSzBv?=
 =?utf-8?B?UksxTG80L1A5aHcveGdsUGRwRW5kTVR4Qnp5OStJRUVIMHNhYzZxbUdBUVBi?=
 =?utf-8?B?V0pRSkR1TlEzcGdEZmRIZjlrVlhtS1VMZWFNWjhQV20wa1VsZ2RyaVBNODNF?=
 =?utf-8?B?bi9sQ3RXMHgyUVB6dHJnVUJNeThOT2c5bjh1YUt1d0lvck1ndnpWNitDRXJa?=
 =?utf-8?B?K1FMRTNobXpQNlVDbTRlMGYya1MyeXdrRnBGUytxK2Y4bnkwS0RjMUUraitx?=
 =?utf-8?B?VXk2RWNQenNHUFFTZ2diUENzeXEwcmNNeXpoMCtxRmh6YU80L0VrZnVUTDM2?=
 =?utf-8?B?dkE1SE15S3orY2tOSjk0NlY5WjJKdTR1bW8raEIrbXhpUm5pc3RRZlFOT1pN?=
 =?utf-8?B?UFZIVGJocWxCVnhUZDV2L2dtMG5MMnhCYm94VnYxNWpQcy9rL2NPc1VvRWFX?=
 =?utf-8?B?dWFtZTh4K1lrSXdWR0xsY2hXVjczTFFrby9BRTJsSGh6U3BaQ2tud250dXQv?=
 =?utf-8?B?OFg3SHZpWTBGc1daOTh6N1JqcWgraEFkNUpXV29CN25oWUtvWVpINGMwUFJk?=
 =?utf-8?B?QXRlUkRpWkRGSVYxa3RwUHJRVTZoMXFtZnVMTk1ZVHk5UlVkZnV3ZVQxYVl3?=
 =?utf-8?Q?l0dLjCux2hLTTc4A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ad91fa-65af-4bc1-b269-08da335532ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:50:24.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTUsN7GDTxzwnGyGA0TmuhQWFHNZwk7HwOq0dGXoSI/gdrmpXilAD+A3jLojOmBr2qJbRW0PK+voGZAGa4lxdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5263

On Mon, Apr 25, 2022 at 10:44:38AM +0200, Jan Beulich wrote:
> With iommu_flush_iotlb_all() gone, iommu_flush_iotlb_pages() is merely a
> wrapper around the not otherwise called iommu_flush_iotlb(). Fold both
> functions.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

