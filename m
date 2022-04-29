Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B86514791
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317207.536442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOFO-0007e1-OV; Fri, 29 Apr 2022 10:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317207.536442; Fri, 29 Apr 2022 10:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkOFO-0007bN-Jr; Fri, 29 Apr 2022 10:53:14 +0000
Received: by outflank-mailman (input) for mailman id 317207;
 Fri, 29 Apr 2022 10:53:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkOFM-0007Ts-Ic
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:53:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8a7dbc-c7aa-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 12:53:09 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 06:53:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB3830.namprd03.prod.outlook.com (2603:10b6:a03:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Fri, 29 Apr
 2022 10:53:05 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 10:53:05 +0000
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
X-Inumbo-ID: 8d8a7dbc-c7aa-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651229590;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rn8HoirgIUtMGhmXEOM+O02eDFwQQ6tUdewazmDcdEo=;
  b=WennZqCx5fI5uUt3Qi6pofGyCRjEjvrHekmC0j7f/N30cnmNacfQxbxz
   HTB36yM/YFgslvhfBWsZV6eEaDEuSPR45Ftay6dQSBxEIXwoRkHp3DLWh
   P9tfZ5l033F2kK+7mpE6cPUi4t3usMKD5FIAf+Suv3/MUyOAqY6PxdizK
   A=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 72685141
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:INWSv68zl8IdTOUtTNclDrUDl3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DYdDGzQM62PNzTzeI8ga9zl9E4DuZ/Xy9ZjGgM5qy48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3YLoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaa9VAp5P7XNofwieit4FCshHohl04aSdBBTseTLp6HHW13F5qw3SWoRZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvuMvIAGtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcG+A/M+fNfD2776F0v26e3bsfpc4bSAv18r2Kdl
 2Dl4DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH/UAe/u2WspQMHVpxbFOhSwAuK0KvPpQGCGnIDUCVCefQhrsY9QTFs3
 ViM9+4FHhRqubyRDHmar7GdqGrrPTBPdDBcIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:aCKcEKAqONs8r8TlHeglsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY15dPoWXo8kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ1yHtycegB2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB26ffueChPaHbzYfJt3SU7lmtrQ3Igfwt2MVdgh8KYS8a
 6xJW+w81RCNn7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="72685141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqgyWQpg0jp4pmSi5wPaznPxjBa8ORa0TjOdM8yocDozNZLt886c5afBYT9gLtdyUWi7miwbwwiFOSnkB94PLHnPLIWpVncER7GZOKl4nOBxZBhaCyPSjTmwFFSpMkKAldpd1RCP/hzhb17iF7C2nkgTMpufQ8hFWXKXHUqszNTK8zw7qm7cRlt/bAsYxX5Lm4YRC77VmY2SXD/bEsmDnMvg5MyExbwpe0tf0qTPubiy1e6UVdQ1ooYimzgd8XNZaxLl85WoD0b56BomRYQbViVDxNp4OKCPVmpXIPxDkr9AtHEhnySLG19tHPaZjdduPk2MoiQ5edans4iZwI8x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDds1ie+iWLIsDLC6wx3t+BDr0rs9GWxIhLkxGO0BiE=;
 b=hhChodlEkQr3bRt3pER7HZic4JGCt1F0tbOEY3ZE+ZHuNjQOb3T2/EZoheXcpuXXPoZ2VOVASDPnzvXfm/U/JIKsuZlyT/fl6ZBLmQJx8KcQKVzmFVXI3pWTsytL1IGHtMVgQGM/TQ69iODfqa7qR9VJC2MAWc+k3C3VGdGHblgIdcKc42e5tqAqsxqXZzVj+8KqF9V5HAqIyM8DFLg1N3R2VIuC2j2lpkyTxwoR5GK/AwYKPcfaUahf1qwi99ImCtpkuQ+D/vCU073RyaCN8YWNNWOW5h5R78jNn7Daa9Vp4Ax+2AJDmgKnIq/o0DA1THq/rNzxzoAR99LVtgCbZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDds1ie+iWLIsDLC6wx3t+BDr0rs9GWxIhLkxGO0BiE=;
 b=t/yZet6lMCrr40uMe83uLOZ18kHxwT4zze9mDpuhqwASy3Og+Cft800ZxNeDRscmmlRePcjeMS3T5qVXwyhsP8u7i8Oxs4UAQckGiTbBSNGvNz8hliM8tccVLqVrKWngWoaCuHTuJilWnttZzGE8POAMJe0gJluOgQ6KUOq/gLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 12:53:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
Message-ID: <YmvDjI4hmmhZ90fi@Air-de-Roger>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
X-ClientProxiedBy: LO4P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6be91ef1-1e40-46f9-7175-08da29ce70ae
X-MS-TrafficTypeDiagnostic: BYAPR03MB3830:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB38303958BDE3EAC808A5CE7D8FFC9@BYAPR03MB3830.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AipcQYtc/qHVyTWUy2Mbmtm3glM30fUmavztfdN0Oa+Ay3vArUktNMougfCHF9VKGfWEvUuMn4KGvIXE71QL95+jMKM4MB1S3AiNtumRdSWgrJiyE+yHaItQpeihVpk/leNECIwnkQwJaGSjInK254SqhnRW2JXA6rH6PQnr7dpjKRK/oZXAgWxBauR7VCsHZkQkCv0OMOQNKZyut7uxhOwFVASM9qDrqOaqCCm+E8sqqbfvIjTN3s8HR9jdh9I3CdGTiVh579dHYvxj1ZkJbUjjs57WMYWkZCDxx4jBOSuCAMF91qbOBWvCxDtvRvkh9gt9ohOg2hxHWM5/PVe8HKYw6eMz2p97/z10jFZslw9liDxJixia4pJ/hlZ/jXWeuvZktiy5BG/+9Xr+IdNucDAPo5c7NA7XijlWouKSm3paUnoOo4MUiNoh7rHa/7DNZVN/51ZbrpALiQ0HFmWHRSmCKitOBfEbPAAbwHoZ63NQ5jk489z+Rmg4QWXbF6b8LRzeNr8H3ruj/UtlPpAVLC9Xnl0XELY2juXOWi8B8Y/sHKQJJcUnABYqHUXZS3NNJSpmL0Mz0H9vPaLGZicwinBj952gkaEOeLJKfyXY4yuKx12MRc1Oz8oVBXqAWpMlxMh0VMgADCi8pKFzQaXqhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(66476007)(2906002)(66946007)(66556008)(5660300002)(85182001)(8936002)(83380400001)(316002)(53546011)(186003)(508600001)(26005)(6506007)(6512007)(6666004)(9686003)(8676002)(6486002)(6916009)(54906003)(82960400001)(86362001)(38100700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzZndXkwWjdUdVkvWWNUUWZna0pVS0QydXowVy9rRXFabmV4RTMrcndyc3Zw?=
 =?utf-8?B?ZUFlalNyYnpLV3c4NGw5TG9Jd09mQTR0WnI2ck5IZW1nUXBUUlNyRlpTclFM?=
 =?utf-8?B?cWwrTlVoTHhuakcvQXF1K0J1eUZER2JmRTZkdnNDUXVoQnZ3QUhkMzk3Wjk2?=
 =?utf-8?B?OW5DMytUTHJid3hUWE96NWpaMm44czhUQ0hjLzFvQkJWcm1DUElEWFJQQXV0?=
 =?utf-8?B?RHlrTDJNUk1xMlgyQU9DK2lDSEFBRlI0OEFvd2FQM0pkNVA0UVBtbFNLa2dk?=
 =?utf-8?B?WWtBRGpOdEhNamR6azh2NTRRT3lSaHIvWHg5aHF5MmMwMm4rUGJGMHYxZDF0?=
 =?utf-8?B?dElFdWg1d0pGMWErMlFHcUdhNEkwa1JzanFUQm1mUmdsbCtmaWpCczVJaDVD?=
 =?utf-8?B?cFBpZW1naEZ6cU83eWdxYUpuVzlHV01HbUJBU3NHSnB1N201ZTV0Y2hySnZv?=
 =?utf-8?B?TEZ1YVBMNVM5Q0xpZGFtcHhsUVh0UTRUQmsrU2hpOGN6TVNCQ1R5dzNEOHgr?=
 =?utf-8?B?bzljZGY5c1RiNTNtMG9VYW5WV2RLQ09WM0svQ0dLc3Brd0ZYQVVRWWtDWG1k?=
 =?utf-8?B?Vy9pNEFxamt4a2EwelFKZ2R5M3Q0eWRIUkpOUzN2dWR3MEhBWGtNNkZJbU11?=
 =?utf-8?B?MmJmbmZDaFFsYmoyUWppVEEzK1dRQWpIZno4VHZLaDNUcitGYWw1RWsycEJt?=
 =?utf-8?B?REhHdEhDbWE2bXN1aFBvRHJTRkk4RUUrSVoxRmdPZlpCY1VJcUhKSm1qN1Bs?=
 =?utf-8?B?QlM2cG5PZUx4YmVpbS9jWW9mcEtpM09TYWNpYXorUEx1OG1VcVBEeUJlRDRR?=
 =?utf-8?B?WnA0WCtwLy9lL3NwTTMyTERIS05ETkwzOGNBcEpQa1creWtXb2dhdTNwbEcx?=
 =?utf-8?B?WE9uMDB2NGVSOE1SSmFQaENMVk01eEg1bENIMm9YN3lDNnBlOXB2SnYxRVU1?=
 =?utf-8?B?eFNXYzRVMDhDbUZDUnVJYXYxbU95c0p5K0FucGk0bFRzVGRCZ0F4eUNhK2ho?=
 =?utf-8?B?SHJ0Sjc5SGZ4TUo5YlJyTEhiYlpMMitxOGswZ3JPU0tUZmpYcnZCTUYrL3k1?=
 =?utf-8?B?SDRjUG1GWHdCclNwcW9mZkhKRCtmclltbk5xQlE4bHY4OTF2QnlDTjZUTGhN?=
 =?utf-8?B?ZVBYNGFDTGh4REtHc1g4MTlpUE1sWmp1NWhCNk0yU3gzOEgrZTg3RTlkczdl?=
 =?utf-8?B?RnEvZFB4YTdxMjVBUVdiTUpSUHJmcGFudklnbzRhZUcxektaa1lmRjB1ZGgy?=
 =?utf-8?B?QlhaMjVyQk5IeXZKbFY3dmt3Z0ZnMW5XR2lZK0ZLWjBVTUU4c3FuK1ozYVMx?=
 =?utf-8?B?RzBDeUZVSzZhVSt0Yk5CelYwQmxscWNCMXNKelh0blpZai9MRGVLSGlmbEhq?=
 =?utf-8?B?NmlGUkdQeFFuVG9hQ1BGMmVlbkFrYzVjbVFyWlRqU0hUYTJVakNjcXl4RXdp?=
 =?utf-8?B?aGRxRlZrTUVra0NPaTFWRDh3Wk1EZ1UxUUpGbVRUNlZHZnJMVFBCZThtdHAx?=
 =?utf-8?B?Z3RxeENsdmVnU3ZVN2tFdUJZU29peGVXVjNheTlDQmg1THRITVNjd2lwMDd2?=
 =?utf-8?B?RU93enFZUkVsUWZnbnZldm1pdzVBSnQ5VUFxWXkxc0F5clVla2VaanJ6VGNH?=
 =?utf-8?B?S0ZWSXEyelVKYUpEcHRKYm1BV1RGTjZxclZHV01lQnJNZFZNM1drK3VEdzB1?=
 =?utf-8?B?aXJTQVpuanhoOC9lZTl0Nk1KRk9sYkxQakdvMVJqU1graWp3VkhGYUZDb3dJ?=
 =?utf-8?B?N29VbHc4MDVzeUhESWNWbU5hU25tdU5BNHJSVkYxdXkyTXNDbU9pVDRKMGNY?=
 =?utf-8?B?WHpEWFV3elg5OU5BcmtDUUpiSjBDb2V4dHUzQmhiaW0yYzRmbjdEdjJDVXlQ?=
 =?utf-8?B?VEFrSGEySE1kdDVUbG5rTHRXbmVHaXc0V3hUeEZXbjV2c0hiNTl2ejhUK05W?=
 =?utf-8?B?WThkcE1zUGQ1T3ZDNytOU2VXOWhVdzVVc2RNblQraEdpbWFNeTYwZ3ZSblQ0?=
 =?utf-8?B?K0p2WHBSOXNFemlPVDlwNzRKa2hHeTBBdTRjQkFMVFdqbDdnM3kxTUpTQ29S?=
 =?utf-8?B?UGs0RTZaM1hRZnk5QUEyKzlIUUJPQ3RaNGQ4SW1xdnN5WVVVZGN2b0xuUVY1?=
 =?utf-8?B?SGJaTGc0c01nb1lEQlZVMkU0Q1p5L3g2a1o1THh2eEc2S3R5RVlLU0J5cytD?=
 =?utf-8?B?ZHZPNk5MTzJUY3JJVWhBdXk5QWZsMHBOdnA3cW9RaEZzY2RCUkZNcjZZS0ps?=
 =?utf-8?B?TFNOL0VEN0xkbkRjVUxXaDFNNFMrUjV4VkJSZFk0ckQwYy9lM1M0TkZmOU1h?=
 =?utf-8?B?bUVSeHVCeTY4dFlzeVRwVFREWE5xSnZVc3d0c0luQzB4UFJsN05tRDBSS3BN?=
 =?utf-8?Q?pyAfX+a1XoF/+kZg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be91ef1-1e40-46f9-7175-08da29ce70ae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:53:05.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iW5NT7O6sn6P7rv3axfJy1uKm/8fHwZuJyaNAlwUo90WXS4JWaT9k5IAYrxcKkMhfOD9cdSlEQxX5DZ2MS04gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3830

On Fri, Apr 29, 2022 at 12:00:21PM +0200, Jan Beulich wrote:
> On 29.04.2022 10:00, Roger Pau Monné wrote:
> > On Thu, Apr 28, 2022 at 05:53:17PM +0200, Jan Beulich wrote:
> >> Hello,
> >>
> >> in the course of analyzing the i915 driver causing boot to fail in
> >> Linux 5.18 I found that Linux, for all the years, has been running
> >> in PV mode as if PAT was (mostly) disabled. This is a result of
> >> them tying PAT initialization to MTRR initialization, while we
> >> offer PAT but not MTRR in CPUID output. This was different before
> >> our moving to CPU featuresets, and as such one could view this
> >> behavior as a regression from that change.
> >>
> >> The first question here is whether not exposing MTRR as a feature
> >> was really intended, in particular also for PV Dom0. The XenoLinux
> >> kernel and its forward ports did make use of XENPF_*_memtype to
> >> deal with MTRRs. That's functionality which (maybe for a good
> >> reason) never made it into the pvops kernel. Note that PVH Dom0
> >> does have access to the original settings, as the host values are
> >> used as initial state there.
> >>
> >> The next question would be how we could go about improving the
> >> situation. For the particular issue in 5.18 I've found a relatively
> >> simple solution [1] (which also looks to help graphics performance
> >> on other systems, according to my initial observations with using
> >> the change), albeit its simplicity likely means it either is wrong
> >> in some way, or might not be liked for looking hacky and/or abusive.
> > 
> > I wonder whether the patch needs to be limited to the CPUID Hypervisor
> > bit being present.  If the PAT MSR is readable and returns a value !=
> > 0 then PAT should be available?
> 
> I simply didn't want to be too "aggressive". There may be reasons why
> they want things to be the way they are on native. All I really care
> about is that things are broken on PV Xen; as such I wouldn't even
> mind tightening the check to xen_pv_domain(). But first I need
> feedback from the maintainers there anyway.

Right, I did also consider suggesting to limit this to PV at first,
but I was unsure why native wouldn't also want such behavior.  Maybe
there's no hardware that has PAT but not MTRR, and hence this was
never considered.

> > I guess we should instead check that the current PAT value matches
> > what Linux expects, before declaring PAT enabled?
> 
> I don't think such a check is needed, the code ...
> 
> > Note there's already a comment in init_cache_modes that refers to Xen
> > in the check for PAT CPUID bit.
> 
> ... in __init_cache_modes() already does it the other way around:
> Adapt behavior to what is found in PAT.
> 
> >  We might want to expand that comment
> > (or add one to the new check you are adding).
> 
> I don't see what further information you would want to put there.

It would depend on how the check ends up looking I think.  If the
enabling is limited to also having the Hypervisor CPUID bit set then
the comment should likely mention why setting it on native is not
safe.

Anyway, let's see what maintainers think.

The other option would be to set some kind of hooks for Xen PV to be
able to report PAT as enabled (maybe a Xen PV implementation of
mtrr_ops?), but that seems like over-engineering it.  My main concern
with setting pat_bp_enabled to true is whether in the future such
setting could be used to gate PAT MSR writes.  It's already like this
for APs (in pat_init() -> pat_ap_init()), but we avoid that path
because we don't report MTRR support AFAICT.

Thanks, Roger.

