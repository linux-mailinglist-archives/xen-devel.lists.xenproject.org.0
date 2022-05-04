Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7C519DDD
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 13:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320596.541411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmD3G-00079S-81; Wed, 04 May 2022 11:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320596.541411; Wed, 04 May 2022 11:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmD3G-00076n-3v; Wed, 04 May 2022 11:20:14 +0000
Received: by outflank-mailman (input) for mailman id 320596;
 Wed, 04 May 2022 11:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmD3F-00076h-65
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 11:20:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28434631-cb9c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 13:20:10 +0200 (CEST)
Received: from mail-dm6nam08lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 07:20:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB3978.namprd03.prod.outlook.com (2603:10b6:5:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 4 May
 2022 11:20:05 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 11:20:05 +0000
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
X-Inumbo-ID: 28434631-cb9c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651663211;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=a7cYbZornsBAQ8naSFhYceZi00oJ3S/vf0SkJczMXFE=;
  b=D4kevFiIxx03IHaPkyZ+g6UP5J8lkglb6/GZUDMG4qvrqV/kJKVUDWde
   A5XgsQKamuoRm0/JvytVP+ltF7tUwSVLeTvkzoYq6P4f7lvFzDO74+73N
   EAgbpBx4vx3ZhAue7/rhS8RFgJdAhpn12k0+RvNUgv+6JUXbeTL017fcK
   0=;
X-IronPort-RemoteIP: 104.47.73.48
X-IronPort-MID: 70563991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/HhddahXbFIr2LWqFa8pbM9MX161GxEKZh0ujC45NGQN5FlHY01je
 htvCDjSP//fZzD9LYtxYYvioBwAsJXSyIJgTARpqyA2Fi4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ4kEbbVxtgmbxgbOT1ufqpX8rDaKmfq5KR/z2WeG5ft69NHKRlqeKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuoQegGdYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8A/L/vtmugA/yiRtyJvvP/7fJeW7VOxEnEHBo
 FLM2kvQV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS9wWl2qfSpQGDCQA5oiVpbdUnsIo6QGIs3
 1rRz9fxX2Qz4PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:z72oLKkB/Q7Uf57Ks1hYEG+Ke7zpDfOrimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qTi2z+8Q3WBjB8bZYOCGghrjEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKwPoSgjPIderIqePvmM/HuQ6d9QYVcegAUdAC0+4NMHf/LqQAfnglOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYp4LSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzSvBky/JlawkEuDzYJ7iJaIfy/gzdZ9vfrWrCpe
 O84yvI+f4Dr085MFvF5icFkDOQrQrGo0WStWNwx0GT7fARDQhKdfaoie9iA2Tkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DMfeMMo/gtiuLElGclsRE0kjTFoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG8fIzmZ0Wd9ih33ekLhoHB
X-IronPort-AV: E=Sophos;i="5.91,197,1647316800"; 
   d="scan'208";a="70563991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE8rHVPNBGUDeiC/ewb4jJtFiBEBkq2jXujGHQf5pSHyzydC0mb7kEiVUuWFKnT4LiPCfi3ByWi1drYD6j1CnljQV95BheYslRzV0gx79ej/mVxJjXBoweoQq3tOItz9TTJzEs0v2d68LqPOk17eqXsEoY/aklwHAwWK/pIePEuyEbZfK6SvbEUcdqRuC1TslUgdfv3IQRUqfxi5/Ox5lD0UfI8mOIdk4bxXAFROFdPDUaSU8Ph+pVFF8aictWOv1mmDVq5XZ76EN7TlSWBuJbpsbyp/tcoyDRdAAueA3lJ2GJ03KAUF0kPx6w0Uag9K+zPEjRR0OLesVSckzadZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGLyz5rNsfkM5+0cdpWMsBi8Jw3UJRIy9rwFb2sFOmE=;
 b=YF1tPFbH/N2uVIysrqiElASPjM+VNBnhI3a4ZGEgv4h/fXBvAf8zVskpRtvXN/EYMOfRDsGpGc1GIiMT4VZ2TgmdWq4P86br0dmDCyuu0ALbct+SUNZ2r97163Hjmf/yY8Ibun7stAK8O/uqQUBonrN8Mn1m6AqBlzU+YjZVusMgDTLZWLnd4PBqMGEMI9lrOgdZULH7EquYD0xBx9/WJzpek4xWNyCDECGoH/R49sxbUTIUcrVq0HaaOXJkUdJfqWXRL7eapV05OTfbE80ENwx4lVqXkl8KVibIxiZxG4ZNQy3565kIWkO2f888MD54j7f5ALm/tZfmEnLHL/+xjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGLyz5rNsfkM5+0cdpWMsBi8Jw3UJRIy9rwFb2sFOmE=;
 b=FCJW9heoh1g21OpJnbNeM9mqGHWdYA2HWGIfJUqpmo6xf2gffBhfrMMx3mPiLZt3iPMaLgTXWrLUEiA73KYG8r2660zMNZ4Tjd2xFaauVJcM4SQ/zX2WhVhnDiKpI3/PZf2ut0XjvjE6nHey34sA2HciDITjm86dML8ob2djpjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 13:20:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YnJhYJSZ2IXxPEyz@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
 <YnFBDsEdaMiMv+8O@Air-de-Roger>
 <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73aabaf9-4509-53f9-8af4-354fd3d13fb3@suse.com>
X-ClientProxiedBy: MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9760b386-f502-48c2-fd04-08da2dc009f9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3978:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB39783F72AE9FBC7E57FE55AA8FC39@DM6PR03MB3978.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4hfqBmyxrpkQ35DTNeVeL6FdOc0SBbBhlTs9apUmGH9cNu8YXhGHXEYxtOlMBAeXAN63R1NXaY6e7wL3X/2EEwqdR205Zn2EBScgz8vgh6QwqmcrK7kuAcNHIL9LPGCNg70KWJSJ3rZxOWsiXTtNGgojHQqavRpiqEJ9ctyzFE/WgKCS5JbPZSbQpJflycDYs4RAxFs7JD/TNyC3RM1IC0mzcfxZApLnLWhrZA6UpGBqSGe2Kvbjiu3GtjczJ5rvCqT4ZDMOVfYJCiBJxMa7FYwykCQeJeg2jp2YktTQAXp+X2g26WvEcVj2C+O+rbmHyE7heWme6DdtrHsesx7rIug9Uaif8IrCF+gWf6KzsuGUqUFomBJPGNgzCikc/3PcJB00tSBq988lffDyxL3PqNyva6zjK5Lt1UU2G6HfTa8L9xWmJL2LhKKjFw8D/j+mexSfOmsfgYaYmh8RSeLOLKyMitHC+z1mPP6sGVk1DnpDkwS0q+opcgXl55886zRG2EBmVv/R3WzgptKUeEbaI/J4L+BJraT69qgGXERo5633D4iKnkmejH8nHKoP6ulUN9MSWd1r8JzZd5hT4Gtu3R3aPcQD44XUQUNFioBIpK3VGtd41UoN1ZIbgEzfSeN/0ZS+NCphGLYcqRbhXlfHpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(6666004)(86362001)(316002)(83380400001)(54906003)(8676002)(6916009)(4326008)(66476007)(26005)(186003)(66946007)(6512007)(2906002)(66556008)(9686003)(6486002)(6506007)(508600001)(33716001)(53546011)(85182001)(8936002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXYyNGJJZTc4Y2pEdkFUTkU4LzdwWjBnTk9kLzE1Yi96a2lxSklBNGhsdytB?=
 =?utf-8?B?Z0VmTWM4NzlBTlAxTGhuSU5YZkFNSkVNVVFCSmZNdDRHQnhxY3kxcXNhOVNu?=
 =?utf-8?B?T0swNkpNNE9jZ0Vib2xUMnFuUWt3eEwxdDNzc1hmMDZ0YzNVNitSYVBlZnhn?=
 =?utf-8?B?Qks1VFFuWTIzQ1VzOFlISExDY2dLNXlURVNlK2ZRVzBncndETXlFUWNWWldQ?=
 =?utf-8?B?WDVnaXdjZlJIdnFWWTZIQSt2YkdIaE4xUHE5dHBRd08xTnZTcmRsK3NqZUpp?=
 =?utf-8?B?SG1LNXJTcGlMWkJ2NnljZXBSenFCUVh3R2F3dmZ3eGlUSk1PZ1FUZFF5bjU0?=
 =?utf-8?B?Q2w3aVFhcjV0L3p0dGI3TjhjZ2pHTXl5VFlpSGFkaUJDZUxyK2RwaVZwVit4?=
 =?utf-8?B?aWdrdFBVL2laK1E3elJZbmZIaDhNTnpCTUlYWmovUHlHc2diS2NQVUFBdnFp?=
 =?utf-8?B?TFZoNlMxMnZhOW5ySVY5L2R0MEdKeVZJOGQ4NnNBa2o2dW9jZ0R4TlVVc1Yw?=
 =?utf-8?B?VjcvbTNYMXJiSW9CR3J0enJuTzJBSm1ucE02MGFnZVo4L0RzN01CVnlaZzRE?=
 =?utf-8?B?dGhNVG81SWw4QnYvTTVvUUQxdTdvQk1UMktIMDNzWVpHY1N2MXI5MVVCMWl5?=
 =?utf-8?B?YjNSdDdSNVJuQmVVbGs4YjBuS1oxQTBpeG9DcjZqUlRMQUcvVmUyYXVOdTR5?=
 =?utf-8?B?aDRHWVFRYzdscW1MQWJEZ25wdzlHVEpSYjZ0WFNpNkZ5bDI1bUFYVFpTOHVv?=
 =?utf-8?B?VmpUYTRtR05yOHh5RkE4dmlKSGZleFROamdqN1A3YnpicDVQQ0tiWmxkbS9m?=
 =?utf-8?B?S2xGakE0M2dRRGw5MHlTQjFncU1oVGhIbCtERFJIWWVQU3EzbWVIYVRPTzlh?=
 =?utf-8?B?ZGx0K0dzWWJTT3Yxbm1jTnRVaEVxdVNNT3hRKzVHZi83V1dQWEFmMWRsTElh?=
 =?utf-8?B?SmlOWHdBSVZQNjBJeC9KK0xqdTV2TW1NUDNRZERUNEJveEFNaWU2Q0RYSGVl?=
 =?utf-8?B?QUFZS2doYjdIQ1d4WjZ1aGl6Vi9iK0JVNlBHNDdkOTBEV0k0QjMyQmRIVmtD?=
 =?utf-8?B?M2wwU3R0a2l4OTF4azZGNjl1K0duNTNNYnVnSzQydUV6NmY4S1dBc2UyVStn?=
 =?utf-8?B?dFRKWThOM0NHK2lWUURYTXVOeEhhdVRXQWRiYmlmdzhUK2FTUWxpK3hydUtK?=
 =?utf-8?B?Q2pQSFg3TU5JR0NyNS9CWDhvSGJtOVFRSzRNV2dLb01SK3R3ZFRzZmZxaDBv?=
 =?utf-8?B?cVV6QzNTSVNST2Q0bFFEY29rdzVxWkxCRjZFNlR0dkV4cWhCa2RHanNza2Rq?=
 =?utf-8?B?elNnOVB6YTlwY2pkc3g3TzM1QXQ1aGVFcWZnb3JNOGk1dmFRQ2VEa1lVTytv?=
 =?utf-8?B?Unk3U21iOEo1Z0RuV21XdnVXYlpHTUNYQXd6VnIxRHdMMTB2cXd6RlpBS0Yz?=
 =?utf-8?B?OHJTT2RRRFNuYmc0UjNTcUNwVHBsM3Q0N1h6cWYzTGZzU3ZGNnU3aVNFYVpw?=
 =?utf-8?B?VE12TWpxU212eUE3SFo4TE9NSEN3VFBMdndQSXEyQ2ViSk9OR0tYMU50MWxk?=
 =?utf-8?B?Q0NDZDVvWGtsYTRiVjAvR0Nrd2FGdjQ1UGh4S0FDZFM2dThnb3JHUzZkRXps?=
 =?utf-8?B?amxLOTdmbVBwNE1TMWppY3lSV0hPdmxRK1JsempTank2RmtWeGdsSS9SNzlE?=
 =?utf-8?B?VjdoU3lWNktzOU5CQlhvSHFJWEZTK3I1dEQxQ2pVbGhKWHZrWStVZE1TcmpU?=
 =?utf-8?B?d0R4bS9iR01qd3VjTXRMTWtDMWdhUUpwcy9URkZpdU9KVVZJQWtybEZBZ1Va?=
 =?utf-8?B?TWhycnBtUHpQL0VRYlhiM3VnQ3VkZHpBUnNyWFM4NTBUVXJJUytKdjhjSmpL?=
 =?utf-8?B?S1Z2a01naWhnM00xQVdmVnZXVkd1RTlpeEZDcVpiOUJDUWNFYTdVSTRsK2Ft?=
 =?utf-8?B?M0JqNHVjS2FpVUFCZ2VZY2dXOGpybHF1RU9LVlc3Y28wbVZzdVI5WitnMUt1?=
 =?utf-8?B?NW5vM2xySkhNVHFKcy9hMGxoNmtNVnJRTUhTUFBiWTU2cW80ZzVKLzI3Wmp4?=
 =?utf-8?B?V01zK1pGVmVJODdzNDNNcXYxUjFBaitmSmFrejQvdjZTS0lqK2RURG9pNU9y?=
 =?utf-8?B?cGRwUkpVZmlRN0N2dVc4U0FoT3ArZXdUWWcxWnJKZndwbHVhblJldnNIMThm?=
 =?utf-8?B?dUJiMTdqREp3OURLcTJnMHBDdXFEd2s4R3dpQjFva2paVXMrU2YwUkk0b1Z4?=
 =?utf-8?B?VDA5dDR2UHIycVdac1R6SEQ1MHVSaUgzZldRc05kQTBvZXVYWTFTUExkWFlF?=
 =?utf-8?B?UzRHU1FsVW95WXJDVFp4R2FodHc3OFFYVllTRjdwTEJtR1dHNlRKeHhvT0ZS?=
 =?utf-8?Q?RftXm3oulLvo9MHI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9760b386-f502-48c2-fd04-08da2dc009f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:20:05.1945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNi2ScNb1n4jW3v6b9FPP1L6soYFIBzWR6idL9FCJc3/4kLLcxSHF0lOXF2Xc0Id4vsL8VY57cOyPcyZCNRLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3978

On Wed, May 04, 2022 at 11:46:37AM +0200, Jan Beulich wrote:
> On 03.05.2022 16:49, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:34:59AM +0200, Jan Beulich wrote:
> >> For large page mappings to be easily usable (i.e. in particular without
> >> un-shattering of smaller page mappings) and for mapping operations to
> >> then also be more efficient, pass batches of Dom0 memory to iommu_map().
> >> In dom0_construct_pv() and its helpers (covering strict mode) this
> >> additionally requires establishing the type of those pages (albeit with
> >> zero type references).
> > 
> > I think it's possible I've already asked this.  Would it make sense to
> > add the IOMMU mappings in alloc_domheap_pages(), maybe by passing a
> > specific flag?
> 
> I don't think you did ask, but now that you do: This would look like a
> layering violation to me. I don't think allocation should ever have
> mapping (into the IOMMU or elsewhere) as a "side effect", no matter
> that ...

Hm, I'm certainly not that familiar with PV itself to likely be able
to make a proper argument here.  I fully agree with you for translated
guests using a p2m.

For PV we currently establish/teardown IOMMU mappings in
_get_page_type(), which already looks like a layering violation to me,
hence also doing so in alloc_domheap_pages() wouldn't seem that bad if
it allows to simplify the resulting code overall.

> > It would seem to me that doing it that way would also allow the
> > mappings to get established in blocks for domUs.
> 
> ... then this would perhaps be possible.
> 
> >> The installing of zero-ref writable types has in fact shown (observed
> >> while putting together the change) that despite the intention by the
> >> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
> >> sufficiently ordinary pages (at the very least initrd and P2M ones as
> >> well as pages that are part of the initial allocation but not part of
> >> the initial mapping) still have been starting out as PGT_none, meaning
> >> that they would have gained IOMMU mappings only the first time these
> >> pages would get mapped writably. Consequently an open question is
> >> whether iommu_memory_setup() should set the pages to PGT_writable_page
> >> independent of need_iommu_pt_sync().
> > 
> > I think I'm confused, doesn't the setting of PGT_writable_page happen
> > as a result of need_iommu_pt_sync() and having those pages added to
> > the IOMMU page tables? (so they can be properly tracked and IOMMU
> > mappings are removed if thte page is also removed)
> 
> In principle yes - in guest_physmap_add_page(). But this function isn't
> called for the pages I did enumerate in the remark. XSA-288 really only
> cared about getting this right for DomU-s.

Would it make sense to change guest_physmap_add_page() to be able to
pass the page_order parameter down to iommu_map(), and then use it for
dom0 build instead of introducing iommu_memory_setup()?

I think guest_physmap_add_page() will need to be adjusted at some
point for domUs, and hence it could be unified with dom0 usage
also?

> > If the pages are not added here (because dom0 is not running in strict
> > mode) then setting PGT_writable_page is not required?
> 
> Correct - in that case we skip fiddling with IOMMU mappings on
> transitions to/from PGT_writable_page, and hence putting this type in
> place would be benign (but improve consistency).
> 
> >> Note also that strictly speaking the iommu_iotlb_flush_all() here (as
> >> well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
> >> needed: Actual hooking up (AMD) or enabling of translation (VT-d)
> >> occurs only afterwards anyway, so nothing can have made it into TLBs
> >> just yet.
> > 
> > Hm, indeed. I think the one in arch_iommu_hwdom_init can surely go
> > away, as we must strictly do the hwdom init before enabling the iommu
> > itself.
> 
> Why would that be? That's imo as much of an implementation detail as
> ...

Well, you want to have the reserved/inclusive options applied (and
mappings created) before enabling the IOMMU, because at that point
devices have already been assigned.  So it depends more on a
combination of devices assigned & IOMMU enabled rather than just IOMMU
being enabled.

> > The one in dom0 build I'm less convinced, just to be on the safe side
> > if we ever change the order of IOMMU init and memory setup.
> 
> ... this. Just like we populate tables with the IOMMU already enabled
> for DomU-s, I think the same would be valid to do for Dom0.
> 
> > I would expect flushing an empty TLB to not be very expensive?
> 
> I wouldn't "expect" this - it might be this way, but it surely depends
> on whether an implementation can easily tell whether the TLB is empty,
> and whether its emptiness actually makes a difference for the latency
> of a flush operation.
> 
> >> --- a/xen/drivers/passthrough/x86/iommu.c
> >> +++ b/xen/drivers/passthrough/x86/iommu.c
> >> @@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
> >>  
> >>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >>  {
> >> -    unsigned long i, top, max_pfn;
> >> -    unsigned int flush_flags = 0;
> >> +    unsigned long i, top, max_pfn, start, count;
> >> +    unsigned int flush_flags = 0, start_perms = 0;
> >>  
> >>      BUG_ON(!is_hardware_domain(d));
> >>  
> >> @@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
> >>       * setting up potentially conflicting mappings here.
> >>       */
> >> -    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> >> +    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> >>  
> >> -    for ( ; i < top; i++ )
> >> +    for ( i = start, count = 0; i < top; )
> >>      {
> >>          unsigned long pfn = pdx_to_pfn(i);
> >>          unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> >> @@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>          if ( !perms )
> >>              rc = 0;
> >>          else if ( paging_mode_translate(d) )
> >> +        {
> >>              rc = p2m_add_identity_entry(d, pfn,
> >>                                          perms & IOMMUF_writable ? p2m_access_rw
> >>                                                                  : p2m_access_r,
> >>                                          0);
> >> +            if ( rc )
> >> +                printk(XENLOG_WARNING
> >> +                       "%pd: identity mapping of %lx failed: %d\n",
> >> +                       d, pfn, rc);
> >> +        }
> >> +        else if ( pfn != start + count || perms != start_perms )
> >> +        {
> >> +        commit:
> >> +            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
> >> +                           &flush_flags);
> >> +            if ( rc )
> >> +                printk(XENLOG_WARNING
> >> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
> >> +                       d, pfn, pfn + count, rc);
> >> +            SWAP(start, pfn);
> >> +            start_perms = perms;
> >> +            count = 1;
> >> +        }
> >>          else
> >> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >> -                           perms, &flush_flags);
> >> +        {
> >> +            ++count;
> >> +            rc = 0;
> > 
> > Seeing as we want to process this in blocks now, I wonder whether it
> > would make sense to take a different approach, and use a rangeset to
> > track which regions need to be mapped.  What gets added would be based
> > on the host e820 plus the options
> > iommu_hwdom_{strict,inclusive,reserved}.  We would then punch holes
> > based on the logic in hwdom_iommu_map() and finally we could iterate
> > over the regions afterwards using rangeset_consume_ranges().
> > 
> > Not that you strictly need to do it here, just think the end result
> > would be clearer.
> 
> The end result might indeed be, but it would be more of a change right
> here. Hence I'd prefer to leave that out of the series for now.

OK.  I think it might be nice to add a comment in that regard, mostly
because I tend to forget myself.

Thanks, Roger.

