Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826F707E31
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 12:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536276.834461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzayL-0005hY-8Y; Thu, 18 May 2023 10:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536276.834461; Thu, 18 May 2023 10:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzayL-0005fH-5K; Thu, 18 May 2023 10:35:01 +0000
Received: by outflank-mailman (input) for mailman id 536276;
 Thu, 18 May 2023 10:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzayJ-0005fB-RA
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 10:34:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c207d1-f567-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 12:34:56 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 06:34:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB6917.namprd03.prod.outlook.com (2603:10b6:510:12c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 10:34:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 10:34:44 +0000
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
X-Inumbo-ID: a0c207d1-f567-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684406096;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s0ml1uIjHIpXatrOozPdarLFDLtExfZEVROgwFh+ALU=;
  b=KYtAlsT1cFy825UZ55PIKv1pVuRtkHvXAMS5ioGCwvuZHNNFOY1x4/SC
   0Q4YjffnZh9fgLdc+UhIbL4+VGMeWv07IOpaifkHjPdFaKUkSVkLqHw+Z
   cnWJz1G2H1ApvG8sY+yaslMGdWEQBdjk+NdAhs35yil8IXnU50Ybbt3+1
   0=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 108260436
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HOtTWqOjLBuIYFTvrR1KlsFynXyQoLVcMsEvi/4bfWQNrUolhGFTz
 moaDGuGP6qCZ2ShfI1/bojn9EJQucLXxt9iHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t5HLmhl6
 qASE2kcUyqzhd2z0omgd+Y506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCMpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr83LGXwXilMG4UPIGh8fBKgh6I/0AaTz8XbGOBsaGgm3frDrqzL
 GRRoELCt5Ma71e3R9PwWxm5pn+svRMGXddUVeog52mlyKDZ/gKYDWgsVSNaZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsSAIf5tD5rYIbjxTRT81iGqq4kt30Hz7rx
 zmA6iM5gt07ncMN1qz951nIgjugr5vOUyY84wmRVWWghj6Vf6agbo2srF3Et/BJKd/BSkHb5
 SBb3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxezC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:QN0EtK0/OHn5hoKCPcS4AgqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-Talos-CUID: 9a23:08gSP2/P/qiW6uchR66Vv3YkNckObSHX9y7BHnWIC1lsWoaOdFDFrQ==
X-Talos-MUID: 9a23:BPtL/AgRAU8RDng7LFubrsMpCN5v7YSsS1s0vZxBmci9DRZgYy6MtWHi
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="108260436"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtRwgYRa+sK56jaBCM7BJVnx5gsui4ogtJ+31uiJz4gGpKBra8dAsJ3F/M5HQxQdD3n9oSH9IWfg2LFiRo0kXT62x5XndbkMSkCGY//1C/bfgM7l8KMBl48ckamPit654RcP+wSureu+K4yf//2iGbnJoFXij9MdKBVgwEEJbyoAAv12RtO2yKc7HfH+H8qLqJ7FEpjViYnLtUP/ZprnImO8grEdlyltOQvZkSeYipHvSD/2awXQL7UDXkJSYALdLaTaIlN1SlBIvY+/nlnxdrR8MAlCfezu0sqV6LG/yrTE8hhkTiB2MqAtyLA47G6z2+1BaomFRQYWU100eGY5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BbAKP2nPjjoO3ABgLWbb/zSXYNFRcfc+NcJ53uOQQk=;
 b=GOLrlNQxcqMzHLWenXsKP3wHHT0DLYsq7/kzB4Ut3NUK73qCVNEeD61HdU7Zg2zpEoLBnFDOIu/w9i9XZKCF84xC/OKk+3V2fFQ0J55W2taVvpqAmJaZ/E2IrVbaAiiyUEbXQwQfJqoFTr4LPXmFjPoKkPSwHTvBpqFnh+we3RzIFxyL0RbHCjHHbNGPFnUGTUSFZgPcpTiQN5cQdNrWAw+U0uSh4+ADxIxJ3oDgqJN4CuxileFVhvIjXEbZ0R5oYlA9qOlCH9fFCNLc3h+PVUlF2Atq3Sm+nZO4d/ReJg77fhWVwiY5GlA3OqEc8DP5Mgr/1lT8O87Q14IDciqPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BbAKP2nPjjoO3ABgLWbb/zSXYNFRcfc+NcJ53uOQQk=;
 b=bGEuEkXB4OnPGPUY8poeBym225FE0agHXXJZ4qgLxTR99LwRglfxqAWtI6mXTiAaubhQQxF9qbr6/amxaxKoXC1JnTbq+yfPkCgFxjRvb7YF6/rLUbfTZDhzfzteI1oHY6/XzLOg0/CgsQ6fGABiClXhs5CZpD0PNiwhjgHe55w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 12:34:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7baf81d2-bf2f-407c-14d8-08db578b7e95
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t7BgAPRzTm3J9asIVC8POQ8XF85eSvrNtAQY4846UJmSJC9fqKPtX5gFbRAzMblNCIWmi+kP9xpkCD5TZUfXPkFiCHeRZU0zBlUroNkP+NrjD9OFLpxT7t0mfQ3WsYU+Unjl5LO83P2ZGy5uBxqxkqxBfcIHs2mRLjI/uxMeF7sbqmoddSQZ7yHnEAPHHcQJ4I8Uf6IOg1CdFjxV6zn7n+zJZcHXbHboNnnKJakiONNSuXEqvVuBZ6pSlIB5xTyvzYstHSWXAvQRwrxFd9r8gW7D2ILzhcUPqP4fP4IN7MMrRx5xAjSuiaZ9ZDvflNTi3QwE9kXpoumpq2AoouaCCs1QSVPekCB70f79SIFbmXV9h5tlaoXqGsfBTC8G94A/v3x/AUwGc/yTuZaMADHT3bagZoBW48S1GAHSc7H3uGQbkHg5w7HRAMTp6ynr4qqinDDz2MDnPuioeiRuxojkTP6mbBf4p/GnfH4XSOKbhcR3reg5cgJLLV45kTqjy77H8OUvVd+fcMh/Z/Q350CwJ/v/JzigGRn5P1fUJWhM5nMmosu66L9s8Vl92E3LvR31lGZBCY9/7a7/0vMCLRZ4qegLicnJZYev27qKYMn4Ylw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(66899021)(966005)(6916009)(66556008)(4326008)(66476007)(66946007)(478600001)(316002)(86362001)(85182001)(83380400001)(6506007)(6512007)(9686003)(186003)(26005)(41300700001)(8936002)(5660300002)(6486002)(2906002)(8676002)(33716001)(6666004)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRrRUlsS2hXNzJiL3hBdlFtQkt3aVMyd2RGSGpNclBRL0JMQ1VvUlU1cTBL?=
 =?utf-8?B?YXNhc3Z3MFVlNmtXWjI5NWpBVnFjWVk5TGgxT2FXbjhmWTJ5WDFMVWlac2M1?=
 =?utf-8?B?SGw5M2lGOVJWNVM1UGxmK3VMcW5ZWTA1dkNKMy9uamsrUFVkN3p0TlcrMmJR?=
 =?utf-8?B?QVZ1VUJFcHJPVEx1eVNkektGZFY3SXJLejZHNjJHbTFLMUJBS25qR2ljU0NN?=
 =?utf-8?B?aXc4bDJvWXBNRlBTb1ZQTEF0ajVZaWxnZGJEQ3B2d0hBU3NMVFFUZlhtVUZP?=
 =?utf-8?B?d0EyNVdnVzNRUHpZUnZaZ0tGc3hKbStZejFJY3JqcFRpN3ExN1piZEtDZWsv?=
 =?utf-8?B?Wmw5SXBIaXVYUkdaRE9TN1lBSjk0bC9COWllSkNGVFI2ZG5VU1lna01XaVlH?=
 =?utf-8?B?MXdPVDhES2Z2NERYTFVQWHdqbHYxb2swTW92Sy9YanZPYmdpVFliYzZ6NTB3?=
 =?utf-8?B?ekhuNGxDNmVubXltb2dsOWtVYlBqUmlKcWpBQ3BIK3RhaFd6RVZZMjJZNmNn?=
 =?utf-8?B?VVNrZkoxOVd0Y3NpcHgySkkxV1RocjFkM0IyZG1FeTE2MXBidThFSW1JVHV6?=
 =?utf-8?B?T0VxTVlYV2dvVmpyN3BSa3Q2RTZVa0ZaUVFxNENITTlxWEF5QU9WRzB5WDJ2?=
 =?utf-8?B?Q01jTDRhT3AvU1JSSEVKekt6c29MVElhM1N4RVFaQU1hN3lwT0FXaXp1blJT?=
 =?utf-8?B?L08yUTl3WElaL2p1anlBKzR5ZjlyTFI4WVBoY2lrdHc3M1p4R3BaZW5wY3JR?=
 =?utf-8?B?TXQvUGhvNVRtZlB6bGNMbFhrbjJvbnRHV3NRSkFkazRocC9VVUkzZHBsaDJx?=
 =?utf-8?B?ZWp5WHVEbmpjL3RnZWk4cmZ6eU05NFBwRDJLZVl3WXkrK0dJak1TVmRISGVW?=
 =?utf-8?B?SmxLWXpBTFJaN3RIQlRmUzMyZW5aMGlZVmdnQkZaV1JNYmdzWnNZdUljUnlR?=
 =?utf-8?B?Mll1M2VXT0dkTzJjV1RmSlg3K0o4RHFGQ0dsVEhpeitzdkkrZVA2Y0oyQ3Uy?=
 =?utf-8?B?aU1zdkJraWRqUHlSRlJwaVd0U3ZKN0lKbUZaOVE2MC9yMktIdXZFZmtxRUhZ?=
 =?utf-8?B?TWI3bE02ZXY4bFpIanN1N0JCZE9MVnN1c1M4Z1Zpay80UTJRNkVIcG1yb0Fu?=
 =?utf-8?B?YnZyc2VHNitoOGlZTEJEZytHZXVVZy9lNTZuTVprS0JuMnpBQitkdkxkWG5a?=
 =?utf-8?B?N2VFNUllTEs0aDR6UHZWekVVNlVWYk1YYjU0WXZ2cEgwTDd3SjJCVGJORWR5?=
 =?utf-8?B?UktlelFqM0pJS0IzdHF1UWNiUlBJaXovUTVLQnkrN2hsNExwNmVwczVtSVdt?=
 =?utf-8?B?Yk5OUDJIbjMreHVUUlpWZEFFKzk1K1I2a0thV1lCdTZLRmVZRTVFTlhPZkh2?=
 =?utf-8?B?T1p0WDFBbDVtTWFZcm55YlF6SFBzNlZRb3dodVQvQXFIelFsZldadDZPL09m?=
 =?utf-8?B?MlJIbUljcGZjc0N2anpvWUw0UDA5VFhQbGUxWHdsTXlJVVFmWVlNelMxL2Jo?=
 =?utf-8?B?TUpTQzJKcWdjNGtNbVRKeUhwK3ltZFdBT3E5ZElOOVpaUzdsR3Fka1kvMStx?=
 =?utf-8?B?U283V1BNRkUvditxU0drVzV4Z0hDcFI5T3ZEUUY2MzVSN1ZHSU1Wc2g4cklX?=
 =?utf-8?B?bmV0YlhHYWxvWXhmd0VTdm02SWY4cTM0ZDlNNmYvZ29EUDdlVWtTRmhZRUxj?=
 =?utf-8?B?UW02alhYMkpydGdsbUhEZnk4V1krZVczbVorOHljQXRJSVhmb1lybzFvNitK?=
 =?utf-8?B?eFVNbFZCVUZPNHNsRDNYbFRBNG11eTA5VjIzK25OZVJWTDZaUktsam94ZExk?=
 =?utf-8?B?dUl2UXAzaElueVlpa2s5Y2xEZE5jSklmY2lVaUJvTzhlKzlEdnNrTk5GcTVl?=
 =?utf-8?B?WHdwQ1lucGt3RGZzbFRmVlFYd09IbmdsYlcxbUMrVC9uMDVtV1pWdURWWFl3?=
 =?utf-8?B?OEVCTmxHMWdpUjRZc0tqRDZEeGUzeUFlVlFFRVZsK1A0aUtYUzVCa0NjSUg2?=
 =?utf-8?B?cmFQWHVhWWZUUGZ0SWFCUU02Y21yckF3aDhMcVgvbGZZM3Z3UTN3clBnTmFv?=
 =?utf-8?B?OTlVMjRrUmthZ3FJRFpkTjNIMXg4dE9XZUhURlR4SGg3YlcwNkVMemdRRXZx?=
 =?utf-8?Q?LbDrGB4swmHwzS2N8c30no/MQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F/Se5tsAeoG6NFmJGzn4zBc8x70gdL5fX+c6oHifnvgHkzbjooitLE95iNaH6bByxwImz39OU/fXQZewgr++Ovt+xex4hpssK1W+UbkHkrZF0PBW0K05WaObdGVDKJKhzqqPTnT9d1rfUjqXlcnvsU8IStKKrfIz2G+kn3y+5YdhmfoxZrpkFquCi98pQrg3Pj4/WaiI4/KzV3BzdV4OrnJSFuXN97lAAuYRJocFQFMYk1XFJBKZoWazh1y9Xb/7j6fCzJ/QnmgW8SJaL4DOHaP1WAPAL0W2jzIrCGqUdgXnPwQj4CB44RIBsNwISYmROAsZbfVpTzl3S/vDKL16zlO/r3aUehxwvSw5kCy7eENW+97tntf37/Xdg0wjn2/gQ9T/osQRUkfj6jEk9cSXqx3KzHZ3MVHCdgvcoy3j+VEiliBpdl1DZ1J2UdlIGmqPSw/q+B9QmOaX4JOBnpZcY+zbJZ2OE8TWO1rRhSJ83ippIcHB0JKKBk9hab0KVFCqpZXNZ0iUiYHN0uGHW7DOVmTpQoh0FasFcCIcmus+C8iPnYK+mTDuFN+k2ZOdgA8j9qo7x6OZwK+hDblWUigSpm8iPA1ONTn7esbTk6LRiNxXsbzolkeOkdXhAZNpdTMg+vFgjfu8btBO5w7YAOjhK+/y60qvbYJoPsHdLGz4maIiR9QZP8J82Rwj3RphWfgmPpUiCt7McN/gsXIymCvFy13TtWqLONXjGZ+4t6ZTqN9akJDq7tgua7onGaoZEcKs58DXr1bpZoxJM8R1kUl1eGF88UFAFc4E3mQ/SrHmnNhAZtGcylFZ52BNZjkn5nVHXoQTRTYEyTQmMUJkOf6rfaN7Xt+eZLQVancDdjjXyP2KqGaY68+KL8LRc/IxB43BB2xYlk7TRa4CZ3ZUUGeI+SpbOJtosDfH6D89pj/hFro=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baf81d2-bf2f-407c-14d8-08db578b7e95
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 10:34:44.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoN6U4nICLch50PPobsIctnJvoJdqSz2aha6ncg9N2rWaEMCi5qCbj1sUK5NNnq0RRHddz2onLqo83ShDurfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6917

On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> Hi all,
> 
> I have run into another PVH Dom0 issue. I am trying to enable a PVH Dom0
> test with the brand new gitlab-ci runner offered by Qubes. It is an AMD
> Zen3 system and we already have a few successful tests with it, see
> automation/gitlab-ci/test.yaml.
> 
> We managed to narrow down the issue to a console problem. We are
> currently using console=com1 com1=115200,8n1,pci,msi as Xen command line
> options, it works with PV Dom0 and it is using a PCI UART card.
> 
> In the case of Dom0 PVH:
> - it works without console=com1
> - it works with console=com1 and with the patch appended below
> - it doesn't work otherwise and crashes with this error:
> https://matrix-client.matrix.org/_matrix/media/r0/download/invisiblethingslab.com/uzcmldIqHptFZuxqsJtviLZK

Jan also noticed this, and we have a ticket for it in gitlab:

https://gitlab.com/xen-project/xen/-/issues/85

> What is the right way to fix it?

I think the right fix is to simply avoid hidden devices from being
handled by vPCI, in any case such devices won't work propewrly with
vPCI because they are in use by Xen, and so any cached information by
vPCI is likely to become stable as Xen can modify the device without
vPCI noticing.

I think the chunk below should help.  It's not clear to me however how
hidden devices should be handled, is the intention to completely hide
such devices from dom0?

Roger.
---
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 652807a4a454..0baef3a8d3a1 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -72,7 +72,12 @@ int vpci_add_handlers(struct pci_dev *pdev)
     unsigned int i;
     int rc = 0;
 
-    if ( !has_vpci(pdev->domain) )
+    if ( !has_vpci(pdev->domain) ||
+         /*
+          * Ignore RO and hidden devices, those are in use by Xen and vPCI
+          * won't work on them.
+          */
+         pci_get_pdev(dom_xen, pdev->sbdf) )
         return 0;
 
     /* We should not get here twice for the same device. */


