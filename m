Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A4D4D8A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288458.489127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSL0d-0004SE-66; Thu, 10 Mar 2022 15:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288458.489127; Thu, 10 Mar 2022 15:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSL0d-0004Pq-1k; Thu, 10 Mar 2022 15:47:23 +0000
Received: by outflank-mailman (input) for mailman id 288458;
 Thu, 10 Mar 2022 15:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSL0b-0004KZ-OH
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:47:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 564e7f90-a089-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 16:47:07 +0100 (CET)
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
X-Inumbo-ID: 564e7f90-a089-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646927240;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iBwU9jkM2WhV4ydOiXDhddy6NJ1tHtzhyHB9c8AeB2Y=;
  b=BJv1U9eInIwauYIjwKgPjwPsiTo6mJfDK139hmVHVoiHVdXV01Cilruk
   JfD44PNlFkMX0L7eDkADmRE4989eXFvEv92FjVTx4susG0yZ0jIP3j2+Q
   nlKsB2IYFrN//xxgdmYWmvYk8gruh7w2IW3G1dukctbUFdN6IBw8nx8dQ
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65936380
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5pDsE6gdmWfTaA4uRgtiRnRiX161uBAKZh0ujC45NGQN5FlHY01je
 htvDGvVO/qCMDHzfd13bdy+o0tTusWHzYI3HQQ//30xRCwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVw2GJ2Wg7tFaRVZHQp8bYpe5Jb7L1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDN
 pFHMmo3BPjGSzpDYUs8WJ0Pp/mlv13YSWAE8kzNt4NitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBByFrsbCTYWKQ8PGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OPWqqO2vAm6o+
 TyLogM815ILkec32YzuqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTQGL1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5ucc70JiCN/Yfj2eN5yICl/aI+TPNDKy8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo7kmrrHrxGieF7mEjSIF8/o7ihn3xLNpLEOBaopUotagPSPojVEovYyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXvjLRzhsXrfbeGJOQTh5Y9eImO9JU9E1zsx9y7aTl
 lngCxAw9bYKrSCeQel8Qis4M+2HsFcWhS9TABHAyn7zgil9O9nztPlDH3b1FJF+nNFeITdPZ
 6BtU+2LA+hVSySB/DIYbJLnq5dlegjtjgWLVxdJqhBlJPaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:w2xcAak/Ok3fhCUBbgcAMQen55fpDfPIimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsNdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmJm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZrA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKffZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WyDk0nrsALciYsV9MOOA4we7rFNoXze2O4DIuzGyWvKEhVAQOEl3bIiI9FkN1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65936380"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmfgrI3zAIr6nZTbJrw4lvyuUi2O0fvLeH5OtgvnNS1ltRAdvRTD6WH2wiwCYF+Btr7e9jmeiwhxuUcdjDw1uRWqeurTHMJVaQj3N16cAy8ZM22iX3mQvr5t/03x+Cun2u7FOhsNSPWFRKKQg7rD5XPboavep6FddPUxUpCtdrznme66nx/N2Ii+uurdsoIocs9/fFV+15HP1MEo4M/jEXxWNglyE4kWQEK2/EQI/fXC0lqHEuXJ2VKbP0Hyda+ZND9x1b781WpobMftFTlOk+xbGwdbD9O8aUibv00UMgItp3ght9QTA693Q5yBC3Py5MYK8WxOv/3upKlpP2Vpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s5gVJxNwTvaCF1xn5jjrcbwlk1xb0M8vClxfrriSzc=;
 b=kRDZTFUoNxAmmax/7swcQYdHe+VVQyJ0aorvnf4wtsCmYUtlBzMihjfI1ErIixUkzOegoOetrR+DXtnpFnkHewwdMgYQlPdJ6qWm6B0dM2cQvRyHzxDLqjc8UX2sm2qJHF1vzij6wOpQaTnirOia7VoZhQ/LxUPEWLVHrs9hZSx/E5NPtPa5Uf8pSdh6M/sxWRqlf8f9j24ve12RstsgulCvUMTovhNlyMxSfpFhvSdzaCEmwG5QX56byKQ3CsbohJK360D6WfEDsOHJfPWJo0qg8RAcDd7niyJ7HnYsLliMjDB/ZwebSYHDkiuRmAwVFlUnmZRPKX/OuWqmrXDKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s5gVJxNwTvaCF1xn5jjrcbwlk1xb0M8vClxfrriSzc=;
 b=pwLxSS/swTPjQjuIuZ4aJfd2odq9tWG5r5t3QDVr3xPgKhAX8uZY2y09tVD8OnIpr/JdKludGQs1jQzqcoRAqQiaZXB8kpMUc148WVeXHVgCapZ3/g1SmmkL2vjUlwtrSB/AUdb/xAOftMk7aWk/2QXNEwnp+98knG5vOSLLMPw=
Date: Thu, 10 Mar 2022 16:47:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <YioddbNor6w/U9ed@Air-de-Roger>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
X-ClientProxiedBy: LO2P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d3d2a82-8b66-4c8f-3be3-08da02ad3aac
X-MS-TrafficTypeDiagnostic: DM5PR03MB2795:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB27952C531906AC77AC87F9148F0B9@DM5PR03MB2795.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlMP5hOFtOodpwoAFxzdw4m831nKjXQfUpxj6HkrvMi1uvcy3LlsqrgFX4nBt2SVUR/3xIV7aJvhJflzJxTf2KL3VukU7rJDyy2jF5iipm+7gfP7dXKjb/LTKhfHr/tzFKqrmIGgrfAy8NEcAZqLT/eUV6hXsXS4gU3YxlZdWxJ+iBXmwkIiVgrpAIoCRQL9nnm/ptdm2HYmvw15pjwDU2FKnF+viU+SyCIuGuHjg6t91MQ4KWuJM/rYZdkwBw08yK1K3GAiQLydu+CcmKdyr9f8fbJFwNTZRa94icOlGD5U89Fo1iE9OSpo3LYFw55EPw5F0IYaq6lOL1MjTUmM5zf7XDDHIhvttnFUg4meANuuNNHsxv4RhpQIuOAyPMkcYiCjySx+ZumSjDD7HJcVmE0Zd4YA/Q2np9Jp2VsMmh2okN9N2HrDR1XygCBZXGcMKipYqwym/QfSH3WHkqPMKHnlJKcbTrgBr2kXZNS2uCk1Iqok4eslO2ELI7nXzj+m0guC/zLE+4goONDrT25GUgiiZBeFx5AVM1KMW59JVwV1F4/YbRq6zKS7KiFnS2OHjco8LDQuzuarKJvbh8PwbddT65DX/dyTaOhiDqxUFIVAvMk2rIV5kepVuQVX8JqaQ7/OaB5UeEM6XNUZ386lWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(85182001)(83380400001)(38100700002)(186003)(26005)(2906002)(4744005)(54906003)(316002)(5660300002)(82960400001)(6486002)(6916009)(6512007)(9686003)(508600001)(8936002)(53546011)(66946007)(86362001)(66556008)(6506007)(4326008)(66476007)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTVzVWdQZnJ2aVIzZERIM2lJaS80Z1dYb3ROY1NjdTZuUEJUM1lDNFRyV0NJ?=
 =?utf-8?B?N2dEVXJoeVQzcWtGRXFrUjBJR3EyQ1ZzTFdWbTRvOXA2ZGg5NExTOGExZmhD?=
 =?utf-8?B?Rmk3d0JRTVBiSThYaVJLUjVwbGFWazczQ0FxZ2taS21jYWpidmVxSEtjZnNM?=
 =?utf-8?B?MUI0TTBUR2V2UkswZlkrdURoWW1mUXAxbjdodjNYdmsrTjNlaFdFSzVuaXdT?=
 =?utf-8?B?KzFnQmg2OXZmd0l2M1B2d20rMGFlaWFwVUNZUklZK1dRakFJMEZJMDlhalhY?=
 =?utf-8?B?d29ET2JoNGg2OGZMYnJlckQ1SzlYeUNMZU9QQUhMY3BFQ2JnQkxuTEcweDRt?=
 =?utf-8?B?ZzFOOGhCOXdVV3ZJVjFZVFhxM1Fvenlwc2I4UmdLdERkN2E1SXRrbU5sN1Fa?=
 =?utf-8?B?OU51SG5OM0haUk1RRW5qUXB0VEhNRmlFRWJ3Q2ZEaWlGL3dzRGQ4MmVFN0ty?=
 =?utf-8?B?QjF0T29FNXVsYWNqQVZvRkNDNlpXcHQyTk1aOGY1OGpJZHN6ZWFsNWwrTFMz?=
 =?utf-8?B?STVFcm1ZUUNFbXRmQk84Q3BkZTRGa2NrUUUvdWp0d005YnRrN3J0NDlRYzcy?=
 =?utf-8?B?NldQck1xWEU4Y2thTlJRbkVmTjd4cFp4NUJDU3RKd0NOZDBYV2lxTWM1Uml1?=
 =?utf-8?B?VStBZnlMNVFubXliNU5NSEw5NmUyQ1hsMnY0NytMRkRGTUwxNEpRUTBzZjVT?=
 =?utf-8?B?YWVIdE1TRFl5S0I1TjlNbUNVNlhkUTJXcHFBS0RQZm5Id1c2NzR3WlJrWFVI?=
 =?utf-8?B?OGg0eVF6U0pjRXNBcmhlNng0RHRFb2lPUWFLaUdWaDVYTlZtOWIrenAyVnVR?=
 =?utf-8?B?NHV6bldiNG1IQy9vMmFXelpTUnUxb0Y5M01QcWZRRy9JTjZvVjlXYkxoNUFR?=
 =?utf-8?B?WVd3MkdMaE83eitDSXZUQUU3cWZLS0pYOWhVMnlWemtyZ3Rvb2dyeVhDeisr?=
 =?utf-8?B?VWljQUgrRzFXZmlyeEplNjRRUVJuMWl2cXN4K3RYQ3ZQbmhVdnpIbDY1ZHd6?=
 =?utf-8?B?N2dJUUo1Vjl1bXpXc0RYMlR0cEJPekJyZTNyN0Zva2Q5MEY5bi9WbmF5U0ZD?=
 =?utf-8?B?TXBNYXVMU1gvN2FkcnFFWUlPYllNRlo0MGxLTHNHOGJobVlIU2FYL3ZnNU1O?=
 =?utf-8?B?NjRCRVRKWkZ3bTVaaXYzZDJ4aWE2R0hJY0VGM28vKzVSM3psL2k2ODdCY0dk?=
 =?utf-8?B?YWJVckFZYmtUdkNQbm1zWHBXTWFrK2ZVUDRkeXJkYzVrNE9URzB6b3E0YkRt?=
 =?utf-8?B?T3RzMTVNZWFVeE1nU2tQamtWVW5JU0RjbVBuVXQ2b2JDbFdPQ1E2TFJHNHpk?=
 =?utf-8?B?ODdOUG5kV21pMHFVZitqeEx5ZE0vSDFSZ2tnbG0vbnV0cThSaHhDOHdvbXFZ?=
 =?utf-8?B?cEtOZnJ0UnU3SldOUk91cGlxTVlzNTNDTUgrbDE2VnhNZGV1akl0MVkzd0JO?=
 =?utf-8?B?MWZSNnBkUmUrZnJjbEJqVkVBNVFSNFdwOE4xRUt4L01DRm0rNWdzSmNyaUFm?=
 =?utf-8?B?Tlpla2M3Sm5BOXVkdVQreDBSbFJxV2tnVnVxbjkzQzlxa2pqNEp1OXhESHJS?=
 =?utf-8?B?NGJZMUQ4ajR0QksvQjBMNTBzWmlkV0tBOEJIejhyWjV6U3NoUkVkUDgwRzVI?=
 =?utf-8?B?ZGtNWnlTNFBGL0U5VGExdEdGUjdXWVFmMGFmdFRIam1walQvQkVIa3liTGxP?=
 =?utf-8?B?T1dyYTd0RjZIQ3RKd3d5YWdPdm5KWFZqa01PRllkYllMbE85TWFqQmpJR04x?=
 =?utf-8?B?TE95OWt6V0JXL3J3NFd6VDJWT0JKQnhpWUZlc0w5eEV6Vmh3WlkzTS9rbG92?=
 =?utf-8?B?ZEtOTlNmcXRQb3JBaE1EbHFoK2VRODFFUzA2TzVrSmZuMTBkSzA3SFpJR24z?=
 =?utf-8?B?QVg4b3FqZm5Pb2p3dSszb1lLa3V3MGkxazgyUE05WDJTbE40V2FPNVRPdWN5?=
 =?utf-8?B?ZGhmektValhqOVdSMXJsUG9PSHlMRkc3TndaQjVtVTdqOWFsQmQ3ZUZRbEtB?=
 =?utf-8?B?N3NlTDU3dFMrNWxmQlNKUXhyZ2RCMVNEQWNHUzB1Q0JBU1czaWFlbFdrRmNm?=
 =?utf-8?B?bkEvUmdleGdXdmFEQmwvUHNZWnE5dWlnZjBpVGI0WUdwTjRiZjdYZ2M0UldP?=
 =?utf-8?B?NFAraTc5OFJ3Wmp0dDVPZnNkdUxHWFdlckpQT1pQV0FoN3hJemp3UlArU2Q3?=
 =?utf-8?Q?rhdDiQFtRuy4gvZD4dLFVrA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3d2a82-8b66-4c8f-3be3-08da02ad3aac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:47:06.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu32C4aWaxyN63cBgLvXN8/WnwFIKCcgHeMx99s5DmM3Kao7IRAXZ5HtZHUP7VRoWoLqrKImV/hhipGDQkexIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2795
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> On 10.03.2022 15:34, Marek Marczykowski-Górecki wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> >                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >                                             PCI_INTERRUPT_LINE) : 0;
> >  
> > +                if (uart->irq >= nr_irqs)
> > +                    uart->irq = 0;
> 
> Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
> immediately inside the parentheses.

If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.

Thanks, Roger.

