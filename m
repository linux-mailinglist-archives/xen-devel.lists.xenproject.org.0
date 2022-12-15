Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD064DF22
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 17:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463611.721831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rYs-0004Gv-0I; Thu, 15 Dec 2022 16:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463611.721831; Thu, 15 Dec 2022 16:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rYr-0004Ei-SR; Thu, 15 Dec 2022 16:58:21 +0000
Received: by outflank-mailman (input) for mailman id 463611;
 Thu, 15 Dec 2022 16:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cY1j=4N=citrix.com=prvs=3418b2cde=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p5rYq-0004Ec-BK
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 16:58:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae7c995-7c99-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 17:58:18 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2022 11:58:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6365.namprd03.prod.outlook.com (2603:10b6:510:b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 16:58:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 16:58:03 +0000
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
X-Inumbo-ID: aae7c995-7c99-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671123498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pyhhzk8aj6uQ3VB68cCpZYeKbw5Rn4Mz23RFoIF7kuM=;
  b=A4eDJHbs29UrTd1YBlzJ6fa44XJrFwaVFTeUdInE+UGFv3fqzSB6kcPS
   9+k030Slx5UEyhv1SH4rNwSOlLP3MCOUPbJccgjxw62QgkLwXPwVQVhoD
   UDBS93nsq7k2XXdHcUwujrMMBNmMkde81WhvjlyI3iy00lCl6+7UmtuZu
   g=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 91076885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ISGCIq9WM1jFk7VpOXZYDrUDsH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zEXCz2BMqmINGP1fNl/bIqz8E0EvZfQz9dhSwVlrS08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kW5AK2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklq2
 /4mdSoUNiucnt6N25mJEMY02cMKeZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdtKS+PopqMCbFu7xjcTEEYoWWqCk6e8gWGlYOtkN
 h1N9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/QeDC3MECD1cbdU8nMs3QzUw0
 RmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYMzL6n8Evbxjugo5nPZh444B3NWWCo5R8/Y5SqD6S26F7Q4PBcaomET0Wdu
 2Qsn8mY5foJS5aXm0SlW/kXFa2u/LOJPSP0hkYqG5g66y/r/3+ldJpXpjZkKy9BO8IJaXnjb
 UnVtA554J5VNWGtK6htbOqZENgnw6HmEpL+SvneY95KY55wXB+G+CBodQib2GWFuE0ljaE+N
 IrdacGtF3cXE4xjzTy/XeBb2rgurgg7xGDeA5D8yxGqypKaZXicU7BDN0GBBsg+6K6HuxnE6
 NZ3OM6DyhEZW+r7CgHI9aYDIFZMKmI0ba0asORSf++HZwBgR2coDqaJxat7ItQ02aNIiu3P4
 3exHFdCz0byjmHGLgPMbW1/bLToXtB0qndT0TEQAGtEEkMLOe6HhJrzvbNnFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:ty1OxaNyK5uUysBcTxP155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztCWE7gr5PUtNpTnuAtjlfZqxz+8W3WBzB8bAYOCFghrQEGgK1+KLrFOBJ8SXzJ8k6U
 4KSdkYNDSfNykesS/P2njCLz9s+qj1zImYwcPli1t9RwBjbK9tqy9/FwagC0VzAC1LH4AwGp
 aw7tdO42PIQwVjUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXFxlP3bAh22
 7YlBGR3NTQj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbg7hjw65Db4RJYFr6FoOwd2H2RIPqp
 3hsh0gN8N85zf6ZWeuuybg3AHmzXIH92Li4UXwuwqoneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBL7mjjn7dSgbWAgqqONmwturQcvtQ0XbWJeUs4mkWUnxjIjLH7UJlOz1GgleN
 Mec/00qswmPW9yVEqpwlWH8ObcI0jbIS32OHTqmvblogS+z0oJv3fwgvZv6ks9yA==
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="91076885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AulIUiiV1OzS5ATBb+bJITFbrplPbbzM0ENQsZ7fTCM505HuSY6G3u+aJTimABysgMC5W9XRD4X/KqF2ZNI4ByTlBy3eOl/fcbm46Q15xak+2SPm4xjV8K2sxBY8A5ROs7gvK+gCU9ds9mThEL9Bm8gRJBIOAri9wmBTeeeq33YJRtmcA3NK6wdr5O/ecQPEYRzB/0RD6etWNcRS6emH0ynvq8/MEhx2ztRL6I8ppYl2DDXS32Kh6NR9Kgqu9i0jrCp6LaMIOGSwmhZ+JhAt372OA7UZtsxeWVFQannwSMuH+UsefMYdz2Ia8/fqtdKDiFrthafb4aQMtDWErpNnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyhhzk8aj6uQ3VB68cCpZYeKbw5Rn4Mz23RFoIF7kuM=;
 b=BN1WhyW4qR5K8y6dTucMxsSABU+g6uG6sqPCTSeKrJGCbvoKpcrqYk4yVT/d0qq2X7+ECBodEUxLvAkRZ8d56Rd212cam/ElSIPL1WYTCBxPUWT4fZxH9o4NvVmiZcTBxfIMFJRN+uXqOhEeetw9EylgqsFQESBp83rcNPNHVTrBjfI0QxtIHgFy1cAhopQHXAWqp2yUja517cKYgMWAHAOAw7yLRrGqMlQlUTrp9InmW5uPCFNG2rXllqzUXRe7KogU0tM+r9rUSJsDHt1szSfYyDrB4z+1iVvjzgijO2LbGP/QXDIP1dagsldrRwCHO3xKkd60XAr0EuxYW66BOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyhhzk8aj6uQ3VB68cCpZYeKbw5Rn4Mz23RFoIF7kuM=;
 b=AFlwwKRqcTySgKuhKzuBhLoC9aM+IFDROsezXTiqdPr+o4jfjJV4RXDTi8e039i6TwvNJz5yBkfOrQXDBn3nKG2Tu+qYMhLH9A/hUl/bSRwLN/POxZx5wA5+naKCdx+4mlUYxOjr09vsuq5VGdVvStrAwSye0tF6bORAHXrCKI0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>,
	"osstest-admin@xenproject.org" <osstest-admin@xenproject.org>, Vincent
 Guittot <vincent.guittot@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Topic: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Index: AQHZEIm2pBLpcrFxWUiesl94gtQKma5u9s6AgAAXKACAAB2/AA==
Date: Thu, 15 Dec 2022 16:58:02 +0000
Message-ID: <e8988370-f838-dd23-729f-892561f54b58@citrix.com>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
 <Y5slue6ujqmCscJd@perard.uk.xensource.com>
 <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
In-Reply-To: <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6365:EE_
x-ms-office365-filtering-correlation-id: 1d79545d-d9a5-41ea-4026-08dadebd877e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GC3ej8o6OFDU+2Nb8zhiWgk6JF9W2moWyAtg5kC1HJoK4lqBFt9NzRXV0Ltu0KK99xvBqZa4TEP16BTTxvmJucCD8yUxQj7djVNl8czUyD30VhUqA/oCEXQ4Su99TP6wmNjxL/qtHtD1p2sXjnB6HaH2O5pgp1Jgx0L04jI8tVtVvkwru8IJEJAdHdlbqv6c/nrqa5g+XwcPv6GID26ysY/AIi6SkH0iHJKYDMjDueLaIKf+PhaWVAK5FnjFpJQ16CZYeOueLwU8k1BgAsCCirKbuYxEEXjSNCunRp6mrNxYaaby448QGTi5o3MVwcdEs9Ny+Pfh3arZdE/yQh+ldTxfhSRwAx1TPHeVNccPNjBcDyheoqoJK3PPYgFhLU9zOJJs6qbnv1S/Ih8F+8ZeNlnCEPIeuJsu9L72eF+EtQNYT9OcWylARSSCeumMWLlYkWBOPPSCGLLbrsGdofsrDJjfh/mf9TKqHDlLK9XJcQLcCQ6p4/gbN7Ll31L9aDFQB0EXPigPNseUUr/zLG8HmYRhlokNUDKtTwocB1ACHDJUci5IUfioG6OSDoeGbdLpg7gCPIaF5By6TKsyHXgzs7TE5RjdMhU5E7MvY3WSt1hleFePcDINl3mRVWalT0yfSxKW2bM9uPI7xdDhsxQEUVNPVjWzaQ/3c2dIWrnmZfcD9kA8vw/+T8pGONqj1DoG5o2uL0XKC36iLQblx2RmctG3N0sO+oQhU9N/cd09rk3AOCnnE5Ny6esEsnI1J/vjOTw78gNgjfEghg+uABV3wA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199015)(2616005)(82960400001)(31696002)(38070700005)(83380400001)(38100700002)(122000001)(86362001)(5660300002)(2906002)(8936002)(7416002)(4326008)(41300700001)(26005)(6512007)(6486002)(76116006)(53546011)(478600001)(66476007)(66946007)(91956017)(71200400001)(8676002)(66556008)(64756008)(66446008)(6506007)(110136005)(54906003)(186003)(316002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R082NHl5K20ybTlIM3pKOFh5QlVMUThXWFo2a1cyMGJ4R3BVWlNNMVZacGln?=
 =?utf-8?B?SG4xT3pCRVo4b0daYmNKVmxtYWVzejAxa0VVelVxRTBWcEFXUjVYaUVqNWxS?=
 =?utf-8?B?d1J1dWFTUS9ueWVYbEoxOXhSTkZlMHMvQ3UxZVZWeU9pbG4rMThXQndod2tO?=
 =?utf-8?B?TVpUVS91Zy92YWtxZm1ZZGdkaXAyUDVQR0MyTHdiQ2NHL0o3c1gzVjNUd1Vk?=
 =?utf-8?B?a3VSMExIb29ZQWxmbU1iclNCNWVJZ1ZKTlRNZTdBL0VvY080ZU5nNWdRdDI4?=
 =?utf-8?B?Tnc1YjJYRmVnL29zRFdyVjhLTi9IaWJBeUxJVEZEUjFQQUhIaE5ibUxNQjky?=
 =?utf-8?B?MjM2VVNXcCtUNEVUb1B0WjU3NzhmdzY1NFpOcVEyYXBuV0VSc2NjSU1Cdm9l?=
 =?utf-8?B?VW1FWE5uNFAyUjF3MEtmNnVFVVBSM1VFYmtnRW5Ud3J4VzRocEY2Z1kzQWJz?=
 =?utf-8?B?cmllQ0owZjJqM1QySVlDNEo4Smh4WmpXVHZOcStyaVliUXJWYk51Y1gxUG1H?=
 =?utf-8?B?MWJEZExwTTd5bE91cW5SRGJzeTREK1Z3aG40RGJ4ZkZSY2lMSHlybVNOV1RZ?=
 =?utf-8?B?ZUhxWUVsOGJCZFRYYlNIMzM3REZzcW9ENkNsQmNxRkZ3YU56MGdvdlp1Q2xO?=
 =?utf-8?B?bWg3bUNDTFJFTFh6djNCY2xyWk1mMjNsUU05M2NOanJudnVpR3BnMDdBYnRK?=
 =?utf-8?B?azNaUjRzc2wzZHJyWC9oSmlmNGlxb2sxQVBPQnAzR1RhZFNRYnZWcDQwRU94?=
 =?utf-8?B?VFBFY1pJM3RKeUlQVnpyTGtEL3BzRERPME9CZDFKMnJkcjBVeWZBcEhuTnNt?=
 =?utf-8?B?c2MzRGhWQmQyUVBOYXpQZFJGejZ0UUFFYjl3dFNkY3h3K0E1eFNkYzBnQ1My?=
 =?utf-8?B?dld2ZjdMSUVqMUtEYXQvQ0tMNytpMmd2eW04NWdsbW5UbFRMbVNlamN6Q0dB?=
 =?utf-8?B?cGJsdFAxLzdrK3ZwQ1hMMSsrcDVvR0NLbG1UOVJraWxiWERJMTAzYzZxUlU3?=
 =?utf-8?B?ZXYxc2NqTDFPc3ZtejR0ckgrVWNjS3gydUNKUy9wYVFRcThFTWRsYzNrNTF2?=
 =?utf-8?B?UllFL2lqWWlNWnBzbWRhRW9DU05DZmlkRmxMNXFMR0RaemdpMVBLWXdWZEVs?=
 =?utf-8?B?N3N3QlRuTURFU1FycUZrVTJVRnNpWGY5SExlZExGMGFQcVkwbVhtWVE4QVdC?=
 =?utf-8?B?OHpTUmVmT05wZUp1TFFTVmJtUFFyb1RERUZGaDhiTG5EQmtOVU1PSHBTSGIy?=
 =?utf-8?B?SFQ0SEtuRXhPRFRaSUtpT1hpc3pBM0ErcUFkZHFwZTVQcjJQTlFPWC9VM0sy?=
 =?utf-8?B?Rjg0K2xXL05ucmRkOEU0cXN1OUMza0w5cEE4K0JERTUwZWdPa3BGeGp2a1V6?=
 =?utf-8?B?a3ZCbnVaUDFTNUZrbzQxa0NGN2FLOHBwV1lnT29JS0oybCtFNmx0YmVtOHR2?=
 =?utf-8?B?UkgzbEYxTkQ4cURlN1hwWXNxSWpVemlvamZtS1BOdm81cG5RaElndi93UGlO?=
 =?utf-8?B?UGNIQkRGYUMzUklyQStNZFRKQjFTL2huYlZNQStITkFVNEFxUHBvaFRyTmZx?=
 =?utf-8?B?OWFnOVo2a2JSQ0Q3RFpLT096MVV2ZTJrU3FtUUVibGRRa2hLcHcxVUJnSHBT?=
 =?utf-8?B?bitmV0tPU0lNZW5wcklBbDgralYzS1JNRUZtZHJ6d0ttOEdGLzh6YnpSVmdt?=
 =?utf-8?B?ZzNTM2VmSVNEcDRaQTZySTdLcTJyU0lpN0pwNjZGdzFMOG9HVVloZjJGMkZZ?=
 =?utf-8?B?QVJ5aVBwQ3pydnVGZ1JHVzd1VEVGcDhxbXFvRFNBdnpEQUk4dGh3eURSUllE?=
 =?utf-8?B?Y3hjNHZNN2o3OHdkYjJSdzFPb1hOSFNVZ2JIV1JOQWU3YXUwb1ljMTRiN1Iz?=
 =?utf-8?B?S2MwdW9QU0x2bVlSU2wvUFdvN2Z2YnJEMEhSVWswc3FWK1J1RGw5MWorZ1Za?=
 =?utf-8?B?T01mU09mTG8yTXZCYWtqb0hnMEFwS1hkT2dtRDNEakxnM3lqdHRLR1U4aHJS?=
 =?utf-8?B?bTNJNzVhTnZRaDVMcmsyQ0VNaGRMUHdTLzdCMzN6R3czQ3djL05yK2xyd3JE?=
 =?utf-8?B?VGs1TFI3NnZ5eTkyOXVzaHJxeFMyeFpaWXZob3I3d0ZFVHlueFVOSlI1eEth?=
 =?utf-8?Q?4uvNaEiEwfG+hSQCmpUOd1/1u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79866F656A92A94EB269C4CA3B2A6E26@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d79545d-d9a5-41ea-4026-08dadebd877e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 16:58:02.9573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldw2p7OxrH+aCRWjfaV2rYZtAip91gLYdyrXf7cfIJS1JfsDLXRAUnIpWSLr93S9OycXCaEFU+HaeEeRhTS6wI16d+vSnlY+fhZpkwjHFl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6365

T24gMTUvMTIvMjAyMiAzOjExIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMTIuMjAy
MiAxNDo0OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+PiBPbiBUaHUsIERlYyAxNSwgMjAyMiBh
dCAwNzowMTo0MFBNICswNTMwLCBWaXJlc2ggS3VtYXIgd3JvdGU6DQo+Pj4gVGhlIGZpZWxkICdi
YXNlJyBpbiAnc3RydWN0IGxpYnhsX2RldmljZV92aXJ0aW8nIGlzIGRlZmluZWQgYXMgdWludDY0
LA0KPj4+IHdoaWxlIHdlIGFyZSBwcmludGluZyBpdCB3aXRoICclbHUnLCB3aGljaCBpcyAzMmJp
dCBvbmx5IDMyLWJpdA0KPj4+IHBsYXRmb3Jtcy4gQW5kIHNvIGdlbmVyYXRlcyBhIGVycm9yIGxp
a2U6DQo+Pj4NCj4+PiAgIGxpYnhsX2ludGVybmFsLmg6NDM4ODo1MTogZXJyb3I6IGZvcm1hdCAn
JWx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcNCj4+PiAgIHVuc2lnbmVkIGludCcs
IGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlICd1aW50NjRfdCcge2FrYSAnbG9uZyBsb25nIHVuc2ln
bmVkDQo+Pj4gICBpbnQnfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KPj4+DQo+Pj4gRml4IHRoZSBzYW1l
IGJ5IHVzaW5nIFBSSXg2NCBpbnN0ZWFkLg0KPj4+DQo+Pj4gTm93IHRoYXQgdGhlIGJhc2UgbmFt
ZSBpcyBhdmFpbGFibGUgaW4gaGV4YWRlY2ltYWwgZm9ybWF0LCBwcmVmaXggaXQNCj4+PiB3aXRo
ICcweCcgYXMgd2VsbCwgd2hpY2ggc3RydG91bCgpIGFsc28gZGVwZW5kcyB1cG9uIHNpbmNlIGJh
c2UgcGFzc2VkDQo+Pj4gaXMgMC4NCj4+Pg0KPj4+IEZpeGVzOiA0M2JhNTIwMmUyZWUgKCJsaWJ4
bDogYWRkIHN1cHBvcnQgZm9yIGdlbmVyaWMgdmlydGlvIGRldmljZSIpDQo+Pj4gU2lnbmVkLW9m
Zi1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+
PiBDb3VsZG4ndCB0ZXN0IG9uIDMyLWJpdCBwbGF0Zm9ybXMgeWV0LCBidXQgd29ya3MgZmluZSBm
b3IgNjQgYml0IG9uZS4NCj4+Pg0KPj4+ICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3ZpcnRpby5j
IHwgNCArKy0tDQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF92aXJ0
aW8uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfdmlydGlvLmMNCj4+PiBpbmRleCA2YTM4ZGVm
MmZhZjUuLjIyMTdiZGE4YTI1MyAxMDA2NDQNCj4+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xp
YnhsX3ZpcnRpby5jDQo+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF92aXJ0aW8uYw0K
Pj4+IEBAIC00NSwxMiArNDUsMTIgQEAgc3RhdGljIGludCBsaWJ4bF9fc2V0X3hlbnN0b3JlX3Zp
cnRpbyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwNCj4+PiAgICAgIGNvbnN0IGNoYXIg
KnRyYW5zcG9ydCA9IGxpYnhsX3ZpcnRpb190cmFuc3BvcnRfdG9fc3RyaW5nKHZpcnRpby0+dHJh
bnNwb3J0KTsNCj4+PiAgDQo+Pj4gICAgICBmbGV4YXJyYXlfYXBwZW5kX3BhaXIoYmFjaywgImly
cSIsIEdDU1BSSU5URigiJXUiLCB2aXJ0aW8tPmlycSkpOw0KPj4+IC0gICAgZmxleGFycmF5X2Fw
cGVuZF9wYWlyKGJhY2ssICJiYXNlIiwgR0NTUFJJTlRGKCIlbHUiLCB2aXJ0aW8tPmJhc2UpKTsN
Cj4+PiArICAgIGZsZXhhcnJheV9hcHBlbmRfcGFpcihiYWNrLCAiYmFzZSIsIEdDU1BSSU5URigi
MHglIlBSSXg2NCwgdmlydGlvLT5iYXNlKSk7DQo+PiBUaGVyZSBpcyBhbHNvIFBSSXU2NCB0aGF0
IGV4aXN0LCB3aGljaCB3b3VsZCBiZSBwZXJmZWN0IHRvIHJlcGxhY2UgJXUuDQo+PiBDb3VsZCB3
ZSB1c2UgdGhhdCBpbnN0ZWFkPw0KPj4NCj4+IEknZCByYXRoZXIgbm90IGhhdmUgdG8gdGhpbmsg
YWJvdXQgd2hpY2ggYmFzZSBpcyB1c2VkIGZvciBudW1iZXJzIGluDQo+PiB4ZW5zdG9yZS4gSSBj
YW4ndCBmaW5kIGFueSBoZXhhZGVjaW1hbCBudW1iZXJzIGluIHhlbnN0b3JlIGZvciBhIHNpbXBs
ZQ0KPj4gZ3Vlc3QgYXQgdGhlIG1vbWVudCwgc28gcHJvYmFibHkgYmVzdCB0byBhdm9pZCBhZGRp
bmcgb25lLiBBbmQgdXNpbmcNCj4+IGhleGFkZWNpbWFsIGlzbid0IG5lZWRlZCB0byBmaXggdGhl
IGJ1aWxkLg0KPiBPdG9oIGFuIGFkZHJlc3MgZm9ybWF0dGVkIGluIGRlY2ltYWwgaXMgcHJldHR5
IHVudXNhYmxlIHRvIGFueSBodW1hbg0KPiAod2hvIG1pZ2h0IGJlIGluc3BlY3RpbmcgeGVuc3Rv
cmUgZm9yIHdoYXRldmVyIHJlYXNvbnMpLg0KDQpBIGNvbnN1bWVyIG9mIHhlbnN0b3JlIGhhcyB0
byBjb3BlIHdpdGggYWxsIGJhc2VzIGFueXdheS7CoCBBbnl0aGluZyB0aGF0DQpkb2Vzbid0IGlz
IGJyb2tlbi4NCg0KS2V5cyBvdWdodCB0byBiZSBleHByZXNzZWQgaW4gdGhlIGxvZ2ljYWwgYmFz
ZSBmb3IgYSBodW1hbiB0byByZWFkLCBhbmQNCmhleCBmb3IgYmFzZSBpcyB0aGUgcmlnaHQgb25l
IGluIHRoaXMgY2FzZS4NCg0KfkFuZHJldw0K

