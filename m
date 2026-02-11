Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EDDKUhejGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F06123922
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227219.1533542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kL-0002VI-FB; Wed, 11 Feb 2026 10:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227219.1533542; Wed, 11 Feb 2026 10:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kL-0002Tm-Bt; Wed, 11 Feb 2026 10:47:01 +0000
Received: by outflank-mailman (input) for mailman id 1227219;
 Wed, 11 Feb 2026 10:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kK-0002Tg-0Z
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:00 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa44c4ca-0736-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 11:46:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:46:51 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:46:51 +0000
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
X-Inumbo-ID: fa44c4ca-0736-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PS0YHzjveyLBTGrzrYCR2JPVeOg/91ld5cSUGFJLGf3NdMfzaK1kOAmQST1ZKjjuU2ZFxa/+5jWtGrB1/9XHruoAGZH0DWCD3RaRl4je+s4NSTQl5VARgJBH+/pBpY/gWIAQ15TlOcSARkUPjXnV3UHG4C9cF4zitAOX225PKVtL8MtVAEu3OOAfIo0EXVa8Q99Va6tBmzFTEcyvCByDvMsDBiCbzbP8bZiW6/sJ6pba04HN00AF5ZpV/iNYIk9OPY6XHNKrcAtsZ4dvEy0wjosXM/X4AtyK8keZ+DGs7BKVp6yJj+9Ts22qiyeJG/r+Ady8MfVAjQFNAXu5nr48gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XjQW2o3i2U4ti/CXbbKXAB6tXROGqmcSjrDk3xleOQ=;
 b=qAfMlTFkMMLlznieNQPnhjfuvDaZFNI1oUJVzvDe9kczxr92KFz6HOe8/Fu4le+Q6wBYqAxxWUtgdVDrWJTHjcRrHE/SUlGjLNhWgI9yoLXYvVs1bjys2IDLd31lmG7dZXhkD78kj53cLfYgYsHy1nBh45BxN8oEd53R2L9KnDC6CCEASZlkhz/Mz6crL2+BtGeEvvD6geA8zKd1crfeH+hEoULpy3/6mVvsww6H0IjkwmHnHPPD8JC9Qr8nXEsqXKCXKxVXkKPOBuATOM5TDFlUXVIyBy/wmcrnQO4sGdz75NJeR2WLEAkaz0/IxrRUq5Jupmh4+JhVA3YqJfn2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XjQW2o3i2U4ti/CXbbKXAB6tXROGqmcSjrDk3xleOQ=;
 b=Qh3YNo1CuCD3a/i00SW+gek848MF5rUife/zmYf95i5a4YupLWsbAICkr0L+GEDk7nr62S/NzwXN82GBgNj8nvTK7p2uVpL4a8ebB7TDlr/OAZSUuslNCZRIGZJdLLPMU8wtrzTHddj9iyEvQdfqfBHc/ybFS9OR2+c8r3IR9N8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] darwin: expand cross-builds to also support x86 and testing
Date: Wed, 11 Feb 2026 11:46:33 +0100
Message-ID: <20260211104638.7938-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0021.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::13)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: b29e021b-c6fd-4510-7d0d-08de695adcfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVR6TjAzenNyWllsMk0yMjBwS2NNSHRuNnRvNUQ0NEZ6NDc5MFlXT1diSDdu?=
 =?utf-8?B?SEpaV0RZSlZOSzd1elU0YTBDci9teko4emVWaEpjemVMQ3Njb00wQWozT2hn?=
 =?utf-8?B?Y1hxcDNCU0RDQjZJNW1lTHlEb3d0YmdDY25RS2ZadWVkQXlxL2ZnSGgxbkFG?=
 =?utf-8?B?Z05tNGVBME52M0F5aitXQmdmY21WQUV0T25QS1ptL3hsU1ViZCs4dXJYNHhV?=
 =?utf-8?B?OEJVNzNqZWRTaDRuSW1YR3VLbzNta1N4QVRzbWJiMS9NVVVzNFMvUVRzQmJN?=
 =?utf-8?B?ay9lQktaZkNqRjVhdU1SSjJzWWVHdGRBS1pRMmRhSUJCSHBFWFcyS09mdTE2?=
 =?utf-8?B?R05NcVJnQUpERXRoMEhLcHR4ZjJINWRmamJ1RTVjdmUyZFUrczM1YlVPNXAx?=
 =?utf-8?B?RTl2VTdpdWdWb0JsUTN1d0FaUG1OVmRjb2p4RWpFMEc0TG9vQlBIQjJSU052?=
 =?utf-8?B?eVBHVlk0eWNCbGtFWGFCVGFIdnZWaFkrTHduVjJqUXorU3puMkNxUWJ3NkE4?=
 =?utf-8?B?bmlJcHJrRDZMMzZvYnZZejIwOFlpUWJrM1JXeXlHaU9ickJtVE8xTE1ZWHlY?=
 =?utf-8?B?OEZ6WlJwTmdnM3d3cC82Z3E0cS82RmlBeWJKckY1WjE1c0FGYkRzL1MxVW5p?=
 =?utf-8?B?WXJUYlF6Sm9GWkNHb1prYnJUV2NpN210MWowcnJSVkVyWVhtWTFTRlhQdGs3?=
 =?utf-8?B?Y3YwNzMwenNVTXFaT3QrdXR2bGRNMXNUYTlPSUREclpkUy8yMlc3UUZzcTVa?=
 =?utf-8?B?cjdMS0F0M3ZBSjRXRGxzaUJqYmFqeWRqOHNzQ3N3ckZNejU5K0VTWitoUlZN?=
 =?utf-8?B?cFJCQmFPRVZoZmdmK2tIRGppbGJZRFVBSWNSYlpZcVJwN3liRlhGS0ZSY3cx?=
 =?utf-8?B?eFkzakswcU9tNS9nUExXT2NySG9vMlJ1YVhOU3Z3NmJuaFVSTStPUWg1clBr?=
 =?utf-8?B?QWlpOWh6cVJHNlRneTlUdyt1NncwckJQMFgvRUtlKzE5VXJhaHpzc3ZhT1FW?=
 =?utf-8?B?YW1HcWlQaXBmREJ2MGVhVlMyOTYxNU5GT3VjQTRPaFhENmh0TkUvRXdGcFVW?=
 =?utf-8?B?MC9YeXd5anB0M2EwSkxkWnozbitPUlBsNXJ6dFMwczR4TTJyRERNd211eG9H?=
 =?utf-8?B?ajBGSk9LT1lKY0dxdXBpOWVZbisrZU1wOHZzZWRULzd0OGl6UUxITWJtN0FL?=
 =?utf-8?B?cHRqVTl2aUZtTnJzenVDUHB0Z2xpODNyVzhyUld0TDJ6OTk4R1dRc3JKZHhU?=
 =?utf-8?B?ZDlZSzVoYVpsYys0Y3pXN3MyK0RnTllEQ1F5Q2hxbGxpM1RhcmczSHFidzAz?=
 =?utf-8?B?YzBnQnNRNzlMbUJnTUFkczJsalhuSk91UGhna2R0ZExHYWdOME9sOElMMnVF?=
 =?utf-8?B?RlgvRjFXVmpwcVZER3IrNk05SXk3MXFoOG5wOGZ0TGo5YmU4V3ZaWmtHTS9V?=
 =?utf-8?B?bkIwaDh2aXpkazhqY2xtTjdQRXpNS0swb0Q4d0xzaGFORzl5ZUhNR2VCUjVn?=
 =?utf-8?B?bEpSZ0xNVVZTWnJER24wSDhCbWZ2ckgvRGtCTEpKcjkxaHlnVW9nK2JUSjJR?=
 =?utf-8?B?M0pNRzdocDFDQ2NIUmRqM2ZuSWM0dmxCd3lRRTRldytwYjk4amN4YTg0Sksr?=
 =?utf-8?B?RERDUmw3c1lOak44YkVGN2FKMmhkWUdrR0Fkcml4VXBqUUUxTStvOU5zNkNC?=
 =?utf-8?B?eGNnUkFrN2lyWlRQZTc0eTJvc1ovOXM5WmlRalIrU2o3SmpsVm9ZY3NUZkYw?=
 =?utf-8?B?SnBlWTFheC9GOVJadERsL0ZmUFcwV2hoYSt4d0lHcVlyL1BScm8yRGdjQVdY?=
 =?utf-8?B?WXdoLytqWWZXTlc5djRtTGVHanlWSGp4c0pQOUJKUG1BaXdVSTRCazB4Qmdp?=
 =?utf-8?B?TCs2SE9YMG85dmVmYngyNmhIRWJ1Wis1NFU4RzlYSy9lOGtxK0p3MWg2anl1?=
 =?utf-8?B?NC93MzFLalo0VXplWERCT3RLL2pDZFFsSGZOUFFIZlVxMVVDb3IvUEFHWUpl?=
 =?utf-8?B?NUc4R2pYVGpjSXBzb1BjSFlQemhpb09rQVM4UG1Kby9id3lyZmZ6c2Y5Ry9N?=
 =?utf-8?Q?J/bmMX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTlYNzZWUWMrY1F2WGc2bDhNRURscVg2UlE5emUySjI1TFFyblZnSlpRdXk2?=
 =?utf-8?B?OGt6L3JXZzh4WGtSc2RBaHIwaUR2RkxsZzF1VTNYRWZBaE9obW1FVlltdXM1?=
 =?utf-8?B?ZFRhbTV1cW16QTM0SHBHTnlFSlNWSjBPN1ZiT3lpZmpXSW9FZjNPZ0U5b1oy?=
 =?utf-8?B?M3hhZG8rTy92VlJ3TEwvRUsrMys2a2NTVE5LZXlvUHpnZ0hrOXdmbmFQeEdG?=
 =?utf-8?B?MWs1VmZHeFh5Q2F0YXI3TnhVY0pFMHBLbmFkd1JxbWJxNjVzTmNRSzNHS2o4?=
 =?utf-8?B?eDI0bHNGcXN3K1FXNGRKM3NkNFB4QURScmxoRk1MdGJlYWZBYnJSamhWd2lG?=
 =?utf-8?B?bWNHU3BMdTJoYzZNaU1ZRng5UFFNMjNwY2lKU2oxQlY5RTFVMmFaa2M4TlJn?=
 =?utf-8?B?Si81a2RHT1U3WEJya0Q1a2ExanR3NExVRFpJZVF1TE00OFdKVHZYNzJsTVVC?=
 =?utf-8?B?TW42SkNabHZmVHdXeE9zemtkaVNzVzZJWmhvN25XSDdrZXdOMmFva211aEpH?=
 =?utf-8?B?dmtBWnN2YWhFUFU1L0lGWTBJQ0FRU01vUE9TUFRSTVpVbTVGS2g4YUpiVEp4?=
 =?utf-8?B?bisxU3E1NG5Va0QyUlJ2V1ZueUpXcndhUk40TERPN1dLdHE5MnZ1OWtMM2Jz?=
 =?utf-8?B?bFdlbXNWT001ZXNuRDhmREJPY1JlUkdMUTJxdUJjVUhNcFQ0SnV3RHdSNXVD?=
 =?utf-8?B?RE9YU2w2RXI3VTV1TDVaN0xpcEM2QXFOelQ4TFh0ZkZPR1VOWCs5alNFOFUw?=
 =?utf-8?B?WkNSbmVFNmtROGtQSEFRcUVWR1VGSVdITzdKTjE3T0VCaVJ0NjVNVGNxdm5t?=
 =?utf-8?B?YVduK0lvTHI5MC9nWnVYcHl1dmp1bEhzZ3U2T29maFNtSmZOVjIyZ3lRVDV0?=
 =?utf-8?B?Z0lpUjdiRDlSZDFvS0lHNWtQRTUrQVhHWFFFdTJZNTZVTWFHc2drL1VqTEVk?=
 =?utf-8?B?K0k1WnU3dkZmUkMxVUdnVTZ0VGJLb2t5OFlPNzR0QjhDclBGVjhiZ1Z5c3Ru?=
 =?utf-8?B?TkVLS0RWUHY4TWNYNFMzVDRLeUxTTmc4bnZ6bittbTVBWWtvZFB4ejc0dDc5?=
 =?utf-8?B?UnZwQW9USHdpcDJvTXZyMkk0dHhDUHQ0cTlIT2NOTVRFdTVUd3B6ZFp4QVFY?=
 =?utf-8?B?YVNydzlNcDdKbyt0RFU4K2lkdlZ6RGVMTFRyTlZrc3Urb0ZVNkhwYXpHcVEy?=
 =?utf-8?B?bWFYdzlOZFBaRUhLZ1JvZEV1Q2U2VkxZOFRyZlJldEROblpJVTNrN29wUVZD?=
 =?utf-8?B?YkV2VkROZCtpM3h2ZkFyVDR0NGIyUkNSNnRuNXluSk9SYjgwQ2JDbTNjaHhv?=
 =?utf-8?B?Y1U5OGNCZHNCS0lGU1o4RmhoNmpOUWFieVlld1k1UjlSSEp2eWl4TFVjQXF1?=
 =?utf-8?B?UU1CZ25Qb3IrYWJpRXJma1RuUWNwWmVOalRsRXY2MzN6UW5vdElBRVg5bjI3?=
 =?utf-8?B?WXBVazBwMGlVYlZwUDBxZi92ekRaWTlPa3ZJWW1FcmdRenhtMjNrUlQyNlFF?=
 =?utf-8?B?ejlGKzd2eHdLMFBSMzRLOERNWmlmeG94K1VyT1Jqdmw3dzhyMjlqblJCdDlJ?=
 =?utf-8?B?Y0pYME84Vm5sWlc3NkJNT2VHWUZXWEkyMllUM3hDTUg4RnpCZXJQblRSN3lF?=
 =?utf-8?B?SnV5QjhhT0I3V1JqTGcxK2h6MUFES2FOaXdSeW5pZ2FsSzRvUDByUEsvOGNL?=
 =?utf-8?B?ZUlGMGs2YjVkL3FFdlI2TEF0SFd1Z1ROeXhnV0RyamJxSG83ZkI5L0RwNnlm?=
 =?utf-8?B?OE9XU1FIYjJtS3NDdWNubGI2VTFoeUlOWUk3eVFWYjFIckc5Q1ZxckgrTmFL?=
 =?utf-8?B?MmJsa0dUZ08rTkFzMjZxa3dUNnFMVDhmVmtlRzNTd3k4WHM4UTBlUC80cEhJ?=
 =?utf-8?B?cVRId3c2Vyt0NHlXVCtVYkxXWlZUZzdxYzBFS1A2K0JqRXFkeFVCUVpjcEhl?=
 =?utf-8?B?MEJVRVIxN0d1bytqTi9IVHM3V2FiNUIzYzRxbGpBN25kQUhmV1lFVlVoMUk0?=
 =?utf-8?B?UTduTW8yRm9relJla0tDamg0Y0FBdkJhTG1mOWk5dlNhSEN6QTlJNzNLRFUz?=
 =?utf-8?B?QlBaMkRXbFNoMGU0ZUpBRXMrK29yblcvWnd3SWErV0hJZE81M0pDUitPQWc5?=
 =?utf-8?B?Q04zWFhlVjM2RnBqMi9BaldDTlpGaTZDZm5uTS9LejZsek5wdzhxQmtaT2JR?=
 =?utf-8?B?WEJNcTg4a2YvTmxkUjQ0NnZaVHp6MU5Wb0g4NlFjRFlxMERYSFh2enA1YWdv?=
 =?utf-8?B?U29rRm03ZW1CNHJ3SCtHazBLKzBmeVJOZk1wcDZrQ2FFdGdrZnJLRG8wRjJ6?=
 =?utf-8?B?OXI0dkovb2ppWGg3SXZ4bGFTb3pySisxcVdWY0dNS1BWRUFtTVNSQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29e021b-c6fd-4510-7d0d-08de695adcfe
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:46:51.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nekY+Szb5mP+STY8TrMW0wm9m5Ch7Ei4p/QbCu0pcq6U4Dr0myMoZ94B/F3l2dYiu1MhbJ3bXACSPIW/+2YJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cirrus-ci.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46F06123922
X-Rspamd-Action: no action

Hello,

This series expands the recently introduced Darwin hypervisor build
support to also allow cross-building an x86 hypervisor, that's done in
patches 1 to 3.  Patches 4 and 5 introduce some Cirrus-CI testing to do
cross-builds from macOS, plus it also introduces some basic smoke
testing of the x86 builds using the XTF selftest, just like it's
currently done for the FreeBSD builds.

A result of the updated Cirrus-CI pipeline can be seen at:

https://cirrus-ci.com/build/6723050642604032

Thanks, Roger.

Roger Pau Monne (5):
  xen/x86: always consider '/' as a division in assembly
  xen/tools: remove usages of `stat -s` in check-endbr.sh
  xen/tools: fix grep reporting 'illegal byte sequence' in
    check-endbr.sh
  cirrus-ci: add x86 and arm64 macOS hypervisor builds
  cirrus-ci: add x86 XTF self-tests for macOS build

 .cirrus.yml              | 51 ++++++++++++++++++++++++++++++++++------
 xen/Makefile             |  7 ++++++
 xen/tools/check-endbr.sh | 18 +++++++-------
 3 files changed, 61 insertions(+), 15 deletions(-)

-- 
2.51.0


