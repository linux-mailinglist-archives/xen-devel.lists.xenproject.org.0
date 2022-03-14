Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE14D7DF4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 09:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290057.491912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgXJ-00021k-TK; Mon, 14 Mar 2022 08:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290057.491912; Mon, 14 Mar 2022 08:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTgXJ-0001yr-Ox; Mon, 14 Mar 2022 08:58:41 +0000
Received: by outflank-mailman (input) for mailman id 290057;
 Mon, 14 Mar 2022 08:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTgXI-0001yl-8G
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 08:58:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7e20db-a374-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 09:58:38 +0100 (CET)
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
X-Inumbo-ID: ef7e20db-a374-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647248318;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZFFM/itOkTN/0Y50A1TbqHa3ajb9EbVM4EBoxW40c/8=;
  b=Elg1V8QgeeqZHPBEvujpJXA7iJjrrJgozextcq6a9f7EOdtcNjzY+0li
   OTGLfmfkWapcUF+O8vycyRAf6+rDCrFWis2owbjuubCcxXAUbCNyrcyQq
   P64e3Bu45QV+aoH5gwALmLKFVvvGHRB1yL0EygNG+pXjAPCM2aJIy73l5
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66079555
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:diPaSK6Q8z2SdqeeUDVYRQxRtDvHchMFZxGqfqrLsTDasY5as4F+v
 jMbCGuPO/iLYWL1e9l0Po3j8U8CsJCAmtBrSQJvqyBhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSVGToJN7+UpN8cWjsCSjw5JbFoxLLudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ66BN
 pdENFKDajzgUjlwO01LD6gBp+COqiDATGMb93uK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/8ALs0z+lmx8avdwVzAGy8cUhB9ZfVz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb4
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL8JNEPumkhex4xWirhRdMOS
 BWP0T69GbcJZCf6BUOJS9/Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF6Mo
 ogFaJfSlUk3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvr6gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:1E+o4qGCP0gV2QShpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66079555"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBlLRDiESJxKY9aaDkzSqojQ/K9eD4OYx4lgvJch4AosN9zPfmPc+bacT1B7f0tdXWSJwtU9qD4Mqitu2nErY9Deqba1DY8pTPX0Y3aKTVN6pyH4GuSy53PbUe5nP2mwufr6EqYHb5zCXVAy2+rSJeCMRK0urCcaXF+fuNlVL4ygZUl4MMiAHEUtfjhmPUiznO0Zib5ljemKuNlOJglLv6Y3qpx4Bcjselo5FkUsse0TmTuoEGNykfrYjdmyYVIMIwcVsvbTOPaSiwbzHdJojO3dHUc7pXUzHIzNZasui130jgEGvzdwvuCgSLb8+BS5K24bNK8tMGjqYTsWt+6cVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S3Ekb9PqgBkjODl0iEcXIH39Gu1GjWx+vf/VFmcyFA=;
 b=GxSg+rdCC+SlpX+gp76hussg6aynHwXbh37YJOA+Wpro4XqCfUvR19MOp6Up1MsINrK7msm0uRU3Pkpo0vTxi5zTDR/mwNNU2lg23cWRpZEjY2MDhBxfSa1GDFWnnM8RXxs7DtE0ExPzkh8zVN/cbDGz3dh4tBlwMKTfWJMAfF/u+ThGG0dQZOpls/0dCi3DGVAoGa9YktQRwnv3hFvWdCrA7TFNDJrKoKg3ZJ6pwCAqAPQQ13H2FD2X2e/HH6ZhvQlyHmiSx5lYPkPRGFQygrgU1evVhH9WWX5AI5WCHCEwbZNKxbaEnoo88WFCH2mvy++jg67Lke1fYf5wyq8BjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S3Ekb9PqgBkjODl0iEcXIH39Gu1GjWx+vf/VFmcyFA=;
 b=hHyTMIkEh5OojykHehyzwwBVeZtTW8NjpcfGhnNGtxlSfZE1qAQGJfjAisaf+enHKvVWin4v6VI7FJWHtEaCYV+MeQvrVlpMAKU06lCXs+xllSe7hr/hHpyFzPB6z/R9P9BlNh3X18jNJbqeGj15u/XUvbvcBsv/nV+3GRWD5PA=
Date: Mon, 14 Mar 2022 09:58:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/4] x86/APIC: skip unnecessary parts of
 __setup_APIC_LVTT()
Message-ID: <Yi8DtXURk3vejz43@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <c679a11a-d2b5-403a-5341-3e00ac91ff45@suse.com>
 <YitXHaekQk1aK1i2@Air-de-Roger>
 <b6769525-0bbf-c735-70cd-d5c13ab232c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6769525-0bbf-c735-70cd-d5c13ab232c8@suse.com>
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0260528f-c33e-4c9d-0791-08da0598d15f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4135:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4135B9AFBBCFA179C7637F788F0F9@BYAPR03MB4135.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9TTzBKIs/ETIDH9KQg/CnjbN4Nl6GR4M3G18i5+8IDrseKbiMhKz6k/q7A/TJXxXIJoEmuYUqn0DJNmfjHOJwGwfEdIME3qbjdzxWyME0BTKV8An1a0OeVmChcYPO+LVuc4pwLWIBD7fyDAkhfQ/aG6YO1QJ+vPP5c0SiXvt8nHGLOcIccYD/aTNE3HVZCCM041TsfzJjHYF8iC6ETxDGG48Cu/MuKt/PSVJm/uE73+vAYX1wrcQQ9e/MG0jrjKh5HvyJwFoAykEsZhomlu6tabXvqb0NTjbRAzs+ZMgX6rWPgeOWwE0KiaxPJR3Mf3ps0lGbQ6JUGfpll2b8Uu2qq7mw3ho7Msv5lETORgKkVx3RI5lYyzkI73Q1nrgMrQ43GISM2yC/Y+h7FKP7vRvVZY3BSXSImlNh1kU5cw3tW3Vf6oCY8Ht+y/KQiefxMDVekvJRnbwLd4sIVpnBrSwAvwQ46j5A4xWybqP+bp/BFTG7UmQYb6bPSXNDxkg9jnKI/IO9CGdE0Up5IUwH6MhBHZWmvCjGoXdKF4I0UmMocaTCb4NDAafGSmx0Q6zlRKxDf4a77fN/yx6Lk0xD/NYwPfWhF21t3LrvxmTkoj10FyOXzrhOMt6l5XTxk7/Y1dHDUvTUzcCkrISjXOImUbDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(85182001)(5660300002)(82960400001)(186003)(2906002)(26005)(33716001)(4326008)(38100700002)(6916009)(54906003)(6666004)(9686003)(316002)(6512007)(53546011)(6506007)(86362001)(508600001)(6486002)(8676002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1UxZDFpelFsTHQxTlZaSkl4RmhBcXhvVEFUYjEzOFM4NzhJQUxHQkpXKzNZ?=
 =?utf-8?B?QWFXZUg2Q2JmNzRFc2dtZjNIRkprUGg5bHVEYWdxVEFKQnVQUzZqU0l2dGhx?=
 =?utf-8?B?S0gzRUx4Mk5xS2lPSDZaNTVTc01NK0k0bGhldW1PL3RaQXFYZXN3WFdwUzhw?=
 =?utf-8?B?ZUlVaFpGMVk4cG1wT1JzeGV6aFBFY2tkRVlyLzJqemZmL3lhS1B2ZEdqMkk5?=
 =?utf-8?B?ODBsaTUyRldrS0d0TkVXTzd3VnNENUY4Nlh2ai9VRk83a2dHMUVjS2RWdFdN?=
 =?utf-8?B?Ky9uUjAwTzR0WWtidGNnVU8yM1VLZXVNckNsclY3QW5EcXdhL21YV0wra0Vt?=
 =?utf-8?B?VWZhSHJubjdxeEREb3NqeHJ1Tzdrd0l3UnNMVUorK1pGb3dTYnNnTUVqQTVr?=
 =?utf-8?B?bVk5eWs5ZGN6TnA5SjhrdUFqSEdHckl4MU5ISXBYRDJ0UFZHRU5lMlN5WEx6?=
 =?utf-8?B?YU83NWlqa0tNM3NkdGJSOWZ1Vmg3NGhXazNtR1RsRUtaYU1EemZ3RGs0Ym54?=
 =?utf-8?B?SmN4TWJYeFlQLzVvaXVHM2RseDYrME5mc3ViUmlxcDQyclYzV0tGM3JLdW5p?=
 =?utf-8?B?Z0RmS0dxK0hud1NVaWh3MVdOOVp0a0xXendQT0tKZStWS0VDNEc5eEVYbXhE?=
 =?utf-8?B?N2tyT010ZzY4YVZGdWhtRy8vSlpUVHkrS0JZd0dqZWVOR2NBYzdmTEoybTgx?=
 =?utf-8?B?aHZqTHUwT1ZGWEVTaDI1OTJCYXdNZDFoYVhZU2JTVGJVQTY0UjFTcUdDQXBL?=
 =?utf-8?B?aWVkWG9CYXE5b291cTRjakNKYUVmSU5uQ05oS2VNVmF5a01TV00rT1VUcHhs?=
 =?utf-8?B?eUJUSFhMQ2J1MzFnN0w5RHdjSERicHVSRjJTTFFKQ3pZY2pSQVRvNlJJSlE2?=
 =?utf-8?B?ck1MSlUwSUJ5cU8xYUwrK092NDIrWHJMZWYrUkdiR1YvejJBMzBoN3Z4M1J6?=
 =?utf-8?B?N0QybHJsY20yUEszbWVCWmFjV1IwVm9CbzQ5Nmhyc0hZSUg4bmpFTzJ4czlj?=
 =?utf-8?B?a24rdDg5c0RLbkF3WkNnVWV0ZW9XclNQYWZMLzdYd2ZCM2t4czErTlZQakli?=
 =?utf-8?B?R3hXdG5DdGxUWlZFbytON2dMNUk3eGRjQXJzeS91NThUS1p2eE5YU2owNkZa?=
 =?utf-8?B?d1RFMkVLeDBNZ0RSMTJvRDE4NkFpZ3BnVUxWWUN1d2FRZFJvRW1rcjJqc2Jp?=
 =?utf-8?B?ckRrM0I4UFkvSGtlelJNUVFnSWxkZ3FvcjVGK1FTQTB0eDRqQmtBaE1WUXZz?=
 =?utf-8?B?Uk1jclBwWnJlYkZoTkx5WXYvY2FkMThHWTBwb3pRK3phYkozMHNhVU1RZXZu?=
 =?utf-8?B?Y3RBVFdnOEtTOTVuYTB4U2NuaDcyMmF5MFk2L3Zua0FLVUFHKzN2NUkyd2h1?=
 =?utf-8?B?ekIvcHdUQUlwMnVXaVkvNFdvT3liL0VBSWpIRXVqR2cwR0dQbk5TMTZLWm1O?=
 =?utf-8?B?U0xSR1JLemJoaVBNazIzVTEySjBSeCtxam5oVUYraXk5U3ZJL1ozZnJNMU5S?=
 =?utf-8?B?SHZBWVRmTUNPdHhkdHQrNWxmZVYvVEgyMm1nMTNlSXduRTRWVi9pem51Zlhz?=
 =?utf-8?B?Y1ViM0RiWGZMMGM1L0QyS3kzbFpSVzl3TkI1R0I3dzlqemFHb3c3N09oVjd5?=
 =?utf-8?B?RU8wWTBkTDdVSXlRdUtnYW13LytOYUFXQ1dLeGNWcjgwdmdpU1RSU0J1RjlJ?=
 =?utf-8?B?SFJCbUVGbVc0eWlmYlZqMllxWTRUeEtQMWVER1EwYnVKRDlxOWV2ZXYxZ21k?=
 =?utf-8?B?RHUzSldJVkp4dWk0Mk9LcExES0VPQzJkU1QvU3Uxc1JHRDlyRHlyV3ZGTVFC?=
 =?utf-8?B?dHNoT0loYVRVTjMzYUdBVVB3bzBlKzJVVHVlcjA3bGtuYmNIZ01LZkh0ZFE0?=
 =?utf-8?B?SjBhcDA5NDRsSnR0bFZ5c0dQclkvMEVuaUZsZndCc2llK3ZWNWhjcEU3c2c2?=
 =?utf-8?B?YjdHamgvZWlzT3ZSV1RpL2VnbS8yUTU3cmIyWmVSTzBhcUtyaTdvV3pXd3NZ?=
 =?utf-8?B?d3dWZWx0bDd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0260528f-c33e-4c9d-0791-08da0598d15f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 08:58:33.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ccz3lly4o4Bqvcj2OyPFCZd13VYzIQbXKtL99VJTpBiXaXt83fc0+76ARb3KMEQnHk3dEFIpO3uT7wo4dZT9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4135
X-OriginatorOrg: citrix.com

On Mon, Mar 14, 2022 at 09:25:07AM +0100, Jan Beulich wrote:
> On 11.03.2022 15:05, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 10:25:31AM +0100, Jan Beulich wrote:
> >> In TDT mode there's no point writing TDCR or TMICT, while outside of
> >> that mode there's no need for the MFENCE.
> >>
> >> No change intended to overall functioning.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I've got some comments below, now that the current proposal is bad,
> > but I think we could simplify a bit more.
> 
> I'm struggling with the sentence; perhaps s/now/not/ was meant?

Indeed, s/now/not/ is what I meant.

> >> --- a/xen/arch/x86/apic.c
> >> +++ b/xen/arch/x86/apic.c
> >> @@ -1059,24 +1059,25 @@ static void __setup_APIC_LVTT(unsigned i
> >>  {
> >>      unsigned int lvtt_value, tmp_value;
> >>  
> >> -    /* NB. Xen uses local APIC timer in one-shot mode. */
> >> -    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
> >> -
> >>      if ( tdt_enabled )
> >>      {
> >> -        lvtt_value &= (~APIC_TIMER_MODE_MASK);
> >> -        lvtt_value |= APIC_TIMER_MODE_TSC_DEADLINE;
> >> +        lvtt_value = APIC_TIMER_MODE_TSC_DEADLINE | LOCAL_TIMER_VECTOR;
> >> +        apic_write(APIC_LVTT, lvtt_value);
> >> +
> >> +        /*
> >> +         * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
> >> +         * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
> >> +         * According to Intel, MFENCE can do the serialization here.
> >> +         */
> >> +        asm volatile( "mfence" : : : "memory" );
> >> +
> >> +        return;
> >>      }
> >>  
> >> +    /* NB. Xen uses local APIC timer in one-shot mode. */
> >> +    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
> > 
> > While here I wouldn't mind if you replaced the comment(s) here with
> > APIC_TIMER_MODE_ONESHOT. I think that's clearer.
> > 
> > I wouldn't mind if you did something like:
> > 
> > unsigned int lvtt_value = (tdt_enabled ? APIC_TIMER_MODE_TSC_DEADLINE
> >                                        : APIC_TIMER_MODE_ONESHOT) |
> >                           LOCAL_TIMER_VECTOR;
> 
> I'm happy to switch to using APIC_TIMER_MODE_ONESHOT, but ...
> 
> > apic_write(APIC_LVTT, lvtt_value);
> > 
> > if ( tdt_enabled )
> > {
> >     MFENCE;
> >     return;
> > }
> 
> ... I'd prefer to stick to just a single tdt_enabled conditional.
> But then I'm also unclear about your use of "comment(s)" - what is
> the (optional?) plural referring to?

I considered the switch to use APIC_TIMER_MODE_ONESHOT one comment,
while the switch to set lvtt_value only once another one.

I'm fine if you want to leave the layout as-is while using
APIC_TIMER_MODE_ONESHOT.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

