Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF357CEB9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 17:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372859.604872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXuN-0006WS-3L; Thu, 21 Jul 2022 15:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372859.604872; Thu, 21 Jul 2022 15:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEXuM-0006Uc-WE; Thu, 21 Jul 2022 15:16:11 +0000
Received: by outflank-mailman (input) for mailman id 372859;
 Thu, 21 Jul 2022 15:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZbT=X2=citrix.com=prvs=1940a87fc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEXuL-0006UV-S5
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 15:16:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a1a8a8-0908-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 17:16:04 +0200 (CEST)
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2022 11:15:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5113.namprd03.prod.outlook.com (2603:10b6:5:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 15:15:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 15:15:54 +0000
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
X-Inumbo-ID: 08a1a8a8-0908-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658416564;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ytzgrtUFFx3LKktpPwq4XSpiq6w8QlT5XznI9x0gHYM=;
  b=BQcMnHnTpBzVvBvd2ZpmIUswxaB04zZ3WGPtTtM3/WM9wiuD9CFxjQ0g
   B8Z5LrRDEhcpkWnJnYQV+q/T457yxxdXMPrMx2jcao4ICArcP7Qg2GAjm
   OulRv5CiBgB2CuKjx6bUjYsA5i8naFV7M13q6cdTOhSdqdYaEua3xZjhc
   8=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 75627852
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iIwHv6mmA4Nh/Y3PwQz05hLo5gxzJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCGiGOv6LN2SkKNAlYI3j/BwH65HVy9RhQFE/pCoyQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk3466r4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kPY5QB8OErWVpX3
 t8qGG1RUxOllrq5lefTpulE3qzPLeHNFaZH4DRK62icCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAB7g7MzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLaryz22b+Sx0sXXqo5ToG5z/1b3Wa633cCFEQQTgPigsWm3xvWt9V3b
 hZ8FjAVhbQ78UWwCN3wWRKprXqsvxgAVt4WGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+fRG+Z97yUhSivIiVTJmgHDQcbSSMV7t+lp5s85jrNU9AlFqe2h9/0HDjYw
 jaWoSx4jLIW5eYI2ru6+xbbgjuqjpnPUgMxoA7QWwqN8gp8bZWNe4+s5F7U/PtEao2eSzG8U
 GMsnsGf6KUEC8iLnSnVH+EVRun1vrCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZUqzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:Xc+6nK6i4rMv77nyXwPXwA7XdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0B/YueAcGRSvILBzySTV/wb57C8gceVbeW19QYQcem9AZsQkDuQCWygYzNLrBEtP+teKH
 IFjPA33QZJfx4sH72G7ilsZZm6mzXT/qiWGiI7Ow==
X-IronPort-AV: E=Sophos;i="5.93,290,1654574400"; 
   d="scan'208";a="75627852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+OuQQH48OQA5KoX1S3L1+2p/E8GCAk6QTQ3SIzPSXTzESeoUkKwG086SFaKVzcAJS8rE2igxACv4qK8oQjGtphJWJ/3r6c/VyVQn9vA3zHpI4r97bfjeTsPJyp155VNumyWXJVJX4k/8KULy6i1K5iFHZv+ZonkmrmrellsR4pnGQb4SBMoAZ8/2/QTXBOsktiBX3j7cydhY0kAOx+afHg7emcUEgKhmPuSsxR+stXV3uuYOdvi3r0+u7CrLHgfwTeJTQuaLUGPOb3eHaJebY8+e+iL0EMioGaIaJmjhQJzxbDZCXeQHpnn9rzHmUgZ2jQTHxyIUY3aH739P1iTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytzgrtUFFx3LKktpPwq4XSpiq6w8QlT5XznI9x0gHYM=;
 b=NJxo1LvxxM0RXvY3JCv+ZBEUZKfFJdypCqOrWioqNufLgTFg/udR94+UcWHHh1PmJCJoWu2ord8Q8RO3koszBAJInYqNzlv7Su87KPxxMzjD4d2wvYxwRFVxHFaZsqN4QpRdv8uNsHgcArzUaPMfBl1PHuwIbtJOkYP6T5Uie8NPF+VzRtCglHd8fElcWGoOs5w4J1JQcQz5Yz3du5Og/bK+ioBvzjvbGqz3fMZv7mnXqDh7BVkwuFSNNYlTs/w6GK92wx9ZfHqysI6L22EskwUXeRuak/jO2xdjh0ZD6rLnL8RTiwj50GsD1NCCPBMIpapVPBOrCl+eRDwMQHfQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzgrtUFFx3LKktpPwq4XSpiq6w8QlT5XznI9x0gHYM=;
 b=FE3vnDL0pUxYx41OJhQRGuPA8dY7KChjPq7biRfFcp6Hi/vB5Vk0qt4cypj7Gb61iMXcdxagZ+JdcpdMlkNi6cDobGGVGm3SnSHlhWvNu7cDTMSWonOyceppfVF4n2ub/3eXbiP/b2mbxB/v8bkNd1D1W50gd8XXreDxQ+OdUKw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap
	<George.Dunlap@citrix.com>
Subject: Re: [PATCH v3] xen/mem_sharing: support forks with active vPMU state
Thread-Topic: [PATCH v3] xen/mem_sharing: support forks with active vPMU state
Thread-Index: AQHYnRAaaj668bQ3XUia6H9jz2csv62I72oA
Date: Thu, 21 Jul 2022 15:15:54 +0000
Message-ID: <622e0fec-c041-50ef-661d-1d541db9ef78@citrix.com>
References:
 <249a26c7c469ee913af5c3b367917b2e4bd4d86e.1658409173.git.tamas.lengyel@intel.com>
In-Reply-To:
 <249a26c7c469ee913af5c3b367917b2e4bd4d86e.1658409173.git.tamas.lengyel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f349524-82f9-48c6-22b0-08da6b2be825
x-ms-traffictypediagnostic: DM6PR03MB5113:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tCX2KvmFu1n1uKL/nPV1kp7gxkrVX1ZHzEAKyZdyvheEsuySY8Lw7dW1sDhV6O6KK4Mvrm6hstJ8vo5dpxkNt4EdGxTvTY9sQk2R2jk5YVVfnoYUiDWFEBDBvxms1rTaI2CilfCPSR01wsgCEAmlsnsTQYZmEY+rfCZNA+zdDkY1814OI8HGeboY3td4fvZrhlnWngaiUqr8Jsv30diifP3foXPPnGMJ/04ps3cO/Kc2CT5wq4BHqGzdbKwa3TcY3v8s8wd8RkrRsqozIkjVGthNuW1OkBgsgbkRIFp6ixZ3okCaewpKG1+HiPHQ8/usYpNRFmD5VC4D++02m++Z6RhPCaYlf9KRh6N5eV0xJiCcS+sb9APLGv6xzBqE0/UHhbX55VkY79cEC059BpRkRsB5uvDIoLkkqt6r35fOD5TSsSM/SK2pL5g7XruPNWXf2s5GkNJKZujcXIGcLxvit+jMegZTzLFjaTGuO+cacnV3urGaJ0zw+HjiHQJNpVoPc5+v+yap3XqAGb+FXxxCKTUpqzcyfvOofFNXw52OMvg/q0Sy4tP6ndgYtnCIov74PBgxfnHsltp9fBp3AkxBLKU3LtVAJ6s+1bitAH2l5/NhNUgZMGDePTPfAH2PDvi++lyoYFIel3ug7t/C+x8a7HHVF+0gTYzcJozjo19Zq2EtJofEa+MSsWCh24ur2/bFFPp4ZGUIkk9AJDH+60/O5wOhneBzivSx1+yRfHBfKw6xGLUI1odRZJlRNSWB2xTuh55b7mhWitRizq5I/RL26t99CjkTB3WbqQsx25p9272rgd8H7qAmdkBl7J2HO63bOM11iRcE3tmfGeJYkuhLOer0sa1j6lMmgWqKBJ/WbtvRieK8I/BCtDxjIpBK9FmC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(31686004)(2616005)(110136005)(186003)(107886003)(26005)(86362001)(38070700005)(38100700002)(6506007)(54906003)(31696002)(53546011)(6512007)(41300700001)(66476007)(2906002)(91956017)(76116006)(66446008)(66946007)(4326008)(36756003)(478600001)(71200400001)(5660300002)(82960400001)(8936002)(122000001)(316002)(8676002)(64756008)(4744005)(66556008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V05zTDRBUzRsL2pDVVhwWFRyWkF5T0QzWGFFOFBDM21jSCtiR0lvSzdPNzQr?=
 =?utf-8?B?enNLN3BJWW12RFdyeUp5WFdZbjcyYXRWS2VrV2VjVE9kd1U5OGNmVTB6c0Nh?=
 =?utf-8?B?NFBlY0YxakpzV21EVEZVb1BKeW5hQ1plVVlnREgrUDZQY0xKQVh4cmF4cVp1?=
 =?utf-8?B?eFl2bkxCRkRCbHNxVUh6a3NOV2lRdzNrL1pKVjd5Q2tGZ25sMzJkL0VXaVJM?=
 =?utf-8?B?MFBDcU9TYzYrUTJSZEt6aHRwKzlEa2Q0WHBoVVFvU1Z3WTAwOUpIeTQ3aFNu?=
 =?utf-8?B?S3MvNWNIeFZlQzd6eU53MUpER0NUTzBIenRaa3V5bEtQeStSRVVHTmloQzRt?=
 =?utf-8?B?ZDZWSXJudk5ZaG5GUitMcGhNRzk5Tk1QN0ZTeklDLytMZWRDZm1xbU5Ibk9X?=
 =?utf-8?B?SnBxY1pQN09ub05tckU0REJLNUtBTnhGUzB5OFpDZGU4Zm00cjd3ZDQvM1Zp?=
 =?utf-8?B?a2phRmVwRTQ0Z2Irbks4VHRTU2FLcmNUMlZkYnBKZVNBQ2gwY1hzd1BXblR2?=
 =?utf-8?B?V3VnR1BDWkhMek1VNjlGREVaU21aaEx5aXdyeSt6ZzN6REEvOEdreG5oNXpj?=
 =?utf-8?B?cVc2U3pQQ2wrS3hNc0k2UGZKbXMxNnZ4MGd4amYwb1AzVUVwUVVMNXNzeHdY?=
 =?utf-8?B?MndQeDFFOHlhTGdSd0lNNVVoMnE4ZlhLaGU5VzdoL3Uxc3R5N0VhTDF2c2hC?=
 =?utf-8?B?YVFwQkFCUVZPcVkvS1pacS9ZU2tpUmh4T0dQOUE3OXV3OHpLR3VRSkJBUTk3?=
 =?utf-8?B?V2NPN2pxSG9WbGpUcFlwcWxtQXlPNUpVWkRxcktQajBNNGs5TWJrWmxWUVU3?=
 =?utf-8?B?OXNNNTFodWFMc3B4QUdjZWF4SHFYa0pCS3dUS1pvM0t1M211NnJBd2c5enhp?=
 =?utf-8?B?bjNPOVArOGoySlM2aHFMNEhlbWpXWU9rODdhblpXY1NnTVFCM1NkMzVVWnBj?=
 =?utf-8?B?K21xQXU5VFF2Q3doSE15cWEzckRhVm9sWEpwNExxMUVxdDhBWXRSMm1iVGYv?=
 =?utf-8?B?bFBHckJSRU4wSWxxUzBnYVdzeExncnpKakw1cnBXbkE3bHpJaStwYk9XZnR0?=
 =?utf-8?B?ZFE1OFNXbTNxNExXUVBvckZPYXA4MDQxUCs0dFF6TzMvNUtGQzBRa3VlaWds?=
 =?utf-8?B?VkV4VktRb2cvUzVBa3BmRkpDNWcrSUl3RkNiYmFuRUFMMk1pN3ZFNnZ4YzUy?=
 =?utf-8?B?ejhOYVU5ZjM1QS9YaGpXcUE0SCtKTTY2aXN6QldNRWtMZ0N2RHVxVnI4di9G?=
 =?utf-8?B?SXFRdlAxYjh6NWxKcXBwM1RJMXNTTVhnVysxZ3FmN0hNenE1TDlvazhZeFVV?=
 =?utf-8?B?U2JHZGdoNmpFT3FBZGFlTnE2TlNYVmZOaC92aUdqRktuTHV6dC9IbzRIN0d3?=
 =?utf-8?B?bTVadHFGdkpvTGxFSjhZZDNwZERwbVp2SC9Kd0ZSc0RtVnJxVm9nTlEzYy8z?=
 =?utf-8?B?YjN2MDUyb1pCZktBakhvdXJZbHFoSVlWbFVwZU0zYTlESGJtNHIzSXVjUFIz?=
 =?utf-8?B?cW9xRVRpTFJqMVZhZk1Dc3NFL3RZL01hanVadjgyKzF6enUxRTVKeVRGUTBu?=
 =?utf-8?B?dHlhRFJZdHBja0laQnhlblFHVWJoSUFtNHNodHdhVGZmTXdOZHRGYS9YKzBC?=
 =?utf-8?B?VHhOVG51dktpNDdKMTZxN2Z5dTUrc0ozUHZPN2tlVWZuUXptSFp5V0JOcFNJ?=
 =?utf-8?B?MTQ3TGVPbytzNHdoMVc5and6WUY0Yy90UTM2amhUK3VKWTBpY2Z3dkc1TEIr?=
 =?utf-8?B?Zm43ZnRGNE1CS1BVM0FTUE1Jb3EwOXh1dWRsQkh3bTM0Uy8rYms3amN6bjE1?=
 =?utf-8?B?QkFMVllsWms0a3JNdERSZ2QzcUZqV3pvc094R2M0Rk8vZFBJajBKZGdGdHNn?=
 =?utf-8?B?R1ZnSTN6cEV3SG5sa0hwMi93TUs0TUxLcVJKYVVwNFUwa3Q3UW4vQmY3SnhW?=
 =?utf-8?B?R1FtMGJEbzVYcWp5eVZ4WDBtcncyVnJENVN6d21rbEl2K1psRTdRSldXRXM2?=
 =?utf-8?B?Ni9mRy9RUW00RG5WV0hES3A3djVxRUFmTXBCcXZnSm4vM0ZZVTlvbVRHd0xN?=
 =?utf-8?B?WUU2a0dHb1RoSzlWVld1U1N0OTVIaFZCc0tISFlHMHZEQ3hEd2Y5TkU5NFJ3?=
 =?utf-8?Q?owYZlswqc3mFYVAgYqV0bYpOP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A70EDA961C0AD440B5EED15AF1DC1723@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f349524-82f9-48c6-22b0-08da6b2be825
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 15:15:54.8547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZz4wyrqRIp14AU9k88QkAXZS22rpGj67Sahb8JmKYG7QwgDJw58arSKqkLWCPGGMEKUbc/vAel5XH0nbeq3xHxMNblOPL3neE6tmRcpWGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5113

T24gMjEvMDcvMjAyMiAxNTo0MiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBDdXJyZW50bHkg
dGhlIHZQTVUgc3RhdGUgZnJvbSBhIHBhcmVudCBpc24ndCBjb3BpZWQgdG8gVk0gZm9ya3MuIFRv
IGVuYWJsZSB0aGUNCj4gdlBNVSBzdGF0ZSB0byBiZSBjb3BpZWQgdG8gYSBmb3JrIFZNIHdlIGV4
cG9ydCBjZXJ0YWluIHZQTVUgZnVuY3Rpb25zLiBGaXJzdCwNCj4gdGhlIHZQTVUgY29udGV4dCBu
ZWVkcyB0byBiZSBhbGxvY2F0ZWQgZm9yIHRoZSBmb3JrIGlmIHRoZSBwYXJlbnQgaGFzIG9uZS4g
Rm9yDQo+IHRoaXMgd2UgaW50cm9kdWNlIHZwbXUtPmFsbG9jYXRlX2NvbnRleHQsIHdoaWNoIGhh
cyBwcmV2aW91c2x5IG9ubHkgYmVlbiBjYWxsZWQNCj4gd2hlbiB0aGUgZ3Vlc3QgZW5hYmxlcyB0
aGUgUE1VIG9uIGl0c2VsZi4gRnVydGhlcm1vcmUsIHdlIGV4cG9ydA0KPiB2cG11X3NhdmVfZm9y
Y2Ugc28gdGhhdCB0aGUgUE1VIGNvbnRleHQgY2FuIGJlIHNhdmVkIG9uLWRlbWFuZCBldmVuIGlm
IG5vDQo+IGNvbnRleHQgc3dpdGNoIHRvb2sgcGxhY2Ugb24gdGhlIHBhcmVudCdzIENQVSB5ZXQu
IEFkZGl0aW9uYWxseSwgd2UgbWFrZSBzdXJlDQo+IGFsbCByZWxldmFudCBjb25maWd1cmF0aW9u
IE1TUnMgYXJlIHNhdmVkIGluIHRoZSB2UE1VIGNvbnRleHQgc28gdGhlIGNvcHkgaXMNCj4gY29t
cGxldGUgYW5kIHRoZSBmb3JrIHN0YXJ0cyB3aXRoIHRoZSBzYW1lIFBNVSBjb25maWcgYXMgdGhl
IHBhcmVudC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5n
eWVsQGludGVsLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo=

