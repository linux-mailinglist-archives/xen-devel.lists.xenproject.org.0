Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F16283F7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 16:32:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443407.697953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubRA-00028W-BT; Mon, 14 Nov 2022 15:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443407.697953; Mon, 14 Nov 2022 15:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubRA-00025v-8b; Mon, 14 Nov 2022 15:31:52 +0000
Received: by outflank-mailman (input) for mailman id 443407;
 Mon, 14 Nov 2022 15:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ip0=3O=citrix.com=prvs=31080188b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oubR9-00025p-0r
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 15:31:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72b84899-6431-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 16:31:48 +0100 (CET)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 10:31:43 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6665.namprd03.prod.outlook.com (2603:10b6:303:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 15:31:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 15:31:40 +0000
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
X-Inumbo-ID: 72b84899-6431-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668439908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=O7notWDT+KDnhlrQycg4nUgTl2NXmKwGHx4KmYADghc=;
  b=DXkG1rmnpXHMjGvK0N8ZntfYjVF6Z1MAXqjGRllbA5sCzcU45hJa36aQ
   B2uD+y1uEsEOuRcHUOgPXUXshHJH0hNgZ/kaf2dYBwZLq3QvDXVCQGckD
   4T2RC7yabUeXcsCAK2nGfnY8xx/MHsgqaz6T/YlAl3iGPdbGsIEzDL7Yz
   E=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 84368668
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o6KtQ6pmANy3ZFfEYAmS2F1rVA5eBmLrZBIvgKrLsJaIsI4StFCzt
 garIBmFb6nZYDbwLdEjPty+8BlQuZSHz9RjTQBoqC49QiIQpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAD8vQCvagf+c+rGAEsVSlOYABcLCAYxK7xmMzRmBZRonabbqZv2QoPN9h3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearbIO9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3kraA63gPDroAVIBtKW36a/9KLsEyjAu4BB
 x1L0woLkZFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLkgJSCRQLuMvssAeTCYvk
 FSOmrvBHTVytJWFRHTb8a2bxRutPQAFIGlEYjULJSMH/t+lpogwhxDOS99LEaipg9mzEjb1q
 xiJoTY/gfMPjMcN/6S94V3DxTmro/DhXgMzownaQG+hxgd4f5K+IZyl70DB6vRNJ5rfSUOO1
 EXogOCb5eEKSJ2IzyqERb1XGKnzv6rcdjrBnVRoAp8tsSy3/GKudpxR5zc4I1p1NsEDenniZ
 0q7VR5t2aK/9UCCNcdfC79dwex3pUQ8PbwJjszpU+c=
IronPort-HdrOrdr: A9a23:biJdp6/4DrfTiziJjjBuk+H2dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qt5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 B29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQZo+dY7bWbHAbIcYa
 9T5fLnla9rmJShHijkV1xUsZuRt7IIb0y7qwY5y5aoOnNt7Q1EJgMjtbAidzE7hdEAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke++3Fyb3pDZRHUk9upFpH
 36aiIQiUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrrn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeZGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPiq6Y0JKqi9T75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4mllUBg==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="84368668"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPlVpyr4E/8Hmgy+ZGNUAsrMtCNoyW1V8hvM3rFaeW3FrTdHORIN+LRFr4PMqmS8VhMYH2+CS6RLmqkiJBX8/7L5dxok2OtTuAagYEdSD2PpUpwkt3QZnLAkFc6/jerQ1fg80fjgQrCvHgrO/EaJFjOgoc0FNiacAhkkcCvaqvCU2FonsZuSTg8JeqdnAp3zmYJHAlTNOXi+JoSARYwqn/0zTqfB+656Nxhmu771bZDkiIHAEgXc90t9FDfpePapnx1lZ45wgoornHfbuVwNbjm+W2TowglZpdt1xAnGkxcAJ1bkL6sKyeN06OKHJEuFAjbWhV1aBAIvJZXRv+LZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7notWDT+KDnhlrQycg4nUgTl2NXmKwGHx4KmYADghc=;
 b=LK3mcmGyrV9UR/6wrZo1Vt3oaMYtdHIV0S4N+YJFlQPKHaScEtbO4n7pmo+diPXVBpgnWSIqx00Rv2UwgAA40WV1kq0narg9Pf0MdEoC2esHaLSVqF0XaAxYx9aoVP1gd6FUweey0tz3kHHaGgNvS9sMymNdhhfGNq4Jd91lWzU6BCDUrWliP/S/JtE5nBDvlJyW1yhi6GS78xYzHAUE9zsRaOmklQR0jVV4ob7CC5RnoAnSuo5X51Jn+f++FnUVfua9mhrnrmxOlSRcdafs3fJsrWj+2BXiPlPlIQ+MH/bS4AYkoAMylOnG16F3DCRSfbkCYLjm8sPxyH/650fBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7notWDT+KDnhlrQycg4nUgTl2NXmKwGHx4KmYADghc=;
 b=AAlInikRYdHsqhzFMjCViwAcOb9zl/QmBJF02IcI7TlKaj9XdmSLRqioIGnht7Ie0Ix6rveNu7+OEM+la11dI2rlBnmNsyBlT3I3ZMyyPjE4dMZCJ63gTfwEaojrvySQRg3wBxU1c+LGQkxrOhcIIe2EdBKL5ZdZfZ6y502pLps=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Henry.Wang@arm.com"
	<Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Thread-Topic: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Thread-Index:
 AQHY8GkXjZEVf2M/t0iebvsck9V8qq44y+aAgACWeYCAAKSxAIAAA1KAgARrNQCAACX3gA==
Date: Mon, 14 Nov 2022 15:31:39 +0000
Message-ID: <c9ebcfbb-efef-8013-ef3b-034c5134e83a@citrix.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
 <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
 <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
 <1051eec8-8074-39e8-299d-a540d12bc997@citrix.com>
 <Y3I/gpTiHeEupOJC@Air-de-Roger>
In-Reply-To: <Y3I/gpTiHeEupOJC@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6665:EE_
x-ms-office365-filtering-correlation-id: 04839542-55ab-42fe-a4b7-08dac6555369
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ABi4t3cazHO0oeFfKaFzjTUyM0BnqLlpujgUFVEjtIBwLsKcu+1wO8aVehQy1qdN3cM6azkh7JuLzvGKNYaEk4q7GRKdv/zdu3CrKkcFWl1vVbgbVLVOTEzv9Gg0DZDr2gY6nSweomKzShwVSLXCp4Vn1oGBxAq6K9hPy7r0MD5gGlox/q6K8v9AeGn95RF6TH+aM1kL5dvfA57qF5yW/FqUB8NF44SbrXULSnQylNxaM2IFsFSH+BXeBgHnX2kLq9M7P5kSOcfOFZJqKVwex2mMwMVgraTXKiTa08u8D19fqxYMSNf/1VzlQBQp6SAIf3No25cFeEG52n7qegnAk5z45KdGAd6yASwKS6/maKYxVBweMcbQuvJrQOlKKSvZ2byGoXIoPQLix+X59LTE5ySk73uVhwGVkhsVuKsCDRtm68m38GvNojr3ic/tY3blkqVTs2m+QFM6wqpodhLee7Ik/m3BQDgwdXJuvyiIEXJXkCoOor0ysgF3OpMPtaCj0Odk7C8mq2TXDuktek1gj9YBY48ACS44MGkgt93VGmYkWB2LfasdjUXgW4BNuQ0lvlw0qKsK1XwJjlVlpsP15SoWSyp1tL0JD2V2nyzKOiyb3D6nrfgBIbdAlelOyPfhl9NBK8tSdm3WtgzqllLsaJUPBwPwBzVsTZa5jP1ijGhDZaQxNZeCzvX1CjAMz7C/Qam1hbFDwin5zcArOPWvA3GOwN81PVJPR+YJ3RQ1+Us9n9BM3gNqAnYj+tMRgARjpa87kEJ7nEMAt+7GCHnXlLo1lFB8/k9OadsA4mA92SfFAbSsAx6qDh60gGyR9jSi2injLzcXK7peKs2pHfffng==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(71200400001)(478600001)(54906003)(37006003)(6636002)(6486002)(31686004)(5660300002)(186003)(8936002)(6862004)(36756003)(2616005)(6506007)(41300700001)(2906002)(26005)(91956017)(66476007)(53546011)(66446008)(316002)(66556008)(4326008)(76116006)(8676002)(64756008)(6512007)(66946007)(83380400001)(82960400001)(86362001)(38100700002)(31696002)(38070700005)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sks3NDRGVVRZNHZ6VmhPcXF2b3FTTGYxK3hRM1ZVYkxiUzVzNEFHcms5bDQ4?=
 =?utf-8?B?S25CZWNJcUYrV0s4WnRKYjVmdExVZThEVTdMdmpaeXZjU01GVlFxOW1OU1do?=
 =?utf-8?B?aG55TS9sTnA3VnVTU3ByM29rVWIyNEhyL1VLaHBLZXVYeXdpUDMvMUlabzR0?=
 =?utf-8?B?UUNtZHBoZndXeG9Gc2ViZUhyRXlOU2svK1lENXcvTGRCVjVEVGdBUjNtVyth?=
 =?utf-8?B?dFg5VEk0YU9lQ3Q5czU3VGVhY0NNRm5YWjVpUnJ6OUtTYldIMkE5RGNRa1py?=
 =?utf-8?B?UHhoWTVjSkpURCtnOWJCUlhPZTB2d09VTy9wbUFqaCtJVFd3SGJkYkgwYVNC?=
 =?utf-8?B?djZtQVdKdHZHY0pMeWoxQm5PQThtbjFFWXZHMnNqQTBKMURiNEZqdUFuV3Nu?=
 =?utf-8?B?cERDRmRobTB5cEFJNHNXdXI1cHJiQjB2bVpPY2JwWXFQRGE5QmE3Sk5mbTEw?=
 =?utf-8?B?TDc1aVRvMGJCRmIvVWt5RGdFL0wyRDJJcGhPS3g5dVhlL3dBaFo4Mzk2U2xv?=
 =?utf-8?B?Y3preHJGQWNFOFVGZVArTThHTG1CTitNQWdad0h2UTVTTWV0TzFVWENFdWlm?=
 =?utf-8?B?YkdBaXhlb0Y1TXEzNlhPT1JEUkdyWDFScHVOYWg5aS9EZjd1RThKYmg3Z1c5?=
 =?utf-8?B?ZkEzeXlNNXdMRUhXdlZ4QlNaOXBrbXZnLzdvOVFiaytnZXBzTDVha3AxbHhN?=
 =?utf-8?B?d1FmQ1RsSGdGQTZwanZDTlN1eWJMZUJRQVBTNkdlNWtqR1BwRWp6TzhHWVRY?=
 =?utf-8?B?WWx4Wkd0V2FnR0VDajhYK3hLSW8xMVlYZUdReUV3cnRpa2M1NGJnNlV2UmpO?=
 =?utf-8?B?Y3I1YnRtTXkySCttNnJ4bDVldG1GUCtRQkdaUDhxVWxqNEEyUHFESXduc0FZ?=
 =?utf-8?B?SWpSdzRWNEVic1UvV1hMY3M2bm5yK3BXOE1aR2Z6My9uRHJLS1F5RWpMZFpz?=
 =?utf-8?B?UC9ZTnk4TisxQUgzRGowbG5EMFhlOEgyazgvVGE4VUQ4Tk9uekx0YkUzU0RJ?=
 =?utf-8?B?K1J2ZXhEYTY0dnp2ZUpDekx6NFZlUzFIY0dDZHd2VFFaYWJ5RzdaRzZyM21u?=
 =?utf-8?B?MWwycWVJTjIwRGxVUlVOYWVJa0o2S0VOcnZxdmZNY1ExVGV1ZHd2VkRTck1X?=
 =?utf-8?B?U21ydnJac3FmbjUxN3RiRzVWWGd0NHZhblNPNXlrZ3RWRktvbmVtaXl3Y1dC?=
 =?utf-8?B?YXlPS25RL1Qvb2pCZkhiRE04em91ZHhBaWh3ZnhDSFc0WTh0cmt1eXMyUWRR?=
 =?utf-8?B?YmI3UHdhZ3JxY09acmR5bXJMSEY2ek1Ibys1UVozd21GZWdjM2psaHpNcDJu?=
 =?utf-8?B?WitxL3JaUWEveFFwUCtxNkVqaThxb2FFQmc1cXJJWEJoVFFONzdBZGR5NFJW?=
 =?utf-8?B?L1JzSVNOaGlUYjNvY3MveXJkOXJqSTUra3g5SDhLTktnSnpnbUJkdUJvY0Fk?=
 =?utf-8?B?b09SY2JSR1VHOXJEMnJkRXMxV3BjOUlDQWF4aWRWY0JUZUViazRobWh0amJM?=
 =?utf-8?B?bjFFblVLejZzaWZDcTNDdGVWNDFzQllXZlB0dFI1TUlKajN3ZnQ0YjZhT2dj?=
 =?utf-8?B?OGZMTUNOZ0UyVkoxZDJNS3NONEordzlRWGprakY5aURRa1RHVjd3dGQ5Q1Y3?=
 =?utf-8?B?Z245dHR0bXhSUDZsTk1wcmdaL3FKaGhlY0tsL0puR3RheVdjWHQ1UWpBRmxo?=
 =?utf-8?B?bXVyakVJV0ZwU3V6ek9HUVVDMjBGcDRPOUFrTnJ5OU1QTFREWklUOVJPVlgy?=
 =?utf-8?B?eVp0RC9JdytEVUlYSDZqN0k1UHY1TVlwZ0VHV2p6dUZCQmpaeUhQRGZrNnRv?=
 =?utf-8?B?RFVCUjNhZUZmVmxaS3h2LytIejVVa3BwMVM2YjFKY1BmcGppYXlHZFBZMDI1?=
 =?utf-8?B?N3NlODhyWWpmdHRqQUZRditra3YyM2lETUZRZ0dlNHFFM3k4VUhsRG9Cdkdh?=
 =?utf-8?B?WmdOdE55b1J5RmJld2ZxeFpqQ3pMQTFsb3dwVytqNGdoQytSY1c5M2orR2hx?=
 =?utf-8?B?YlQvUlc3S2kxTXVrYlV6cm1jalY5QnY5bTFBcXMza0U1YlkrS2RMUlJOZDAw?=
 =?utf-8?B?azJzM2NacC9zWVhOVGdNWitJKy9NN0xhbkY1VlV5MjFlRjkvUk9GOG1YM0lO?=
 =?utf-8?Q?ppF6uQ5wMPZV+kdbYr4hkRJJ2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40198E1F7F8A9441A7068918DBA64C7B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1dcYkDJZAXIcN71EoGUT3hiwWIRk4sfyHmwdC1PH7C7FxD586XgJNQ1924vjr5NxqbJ0cYURswCrpG07FnNhxYzuNdUvsccu87C/Z1jw9mXNgf1dGXaYx7tVAUWOeZFEIgKff82VE1AddxLN7569si76me0TzmQJgNH6fXtReKdgpGZI36dBFMKfavz/tEi3os3IH2gjamhHyGTc4YUcxEAL2qN7uRYe86uh3vHrun/vwqDZDFm1V99XR82JwODp8J6CVncVbnvzaGI6K+KfdmWst9wys5MUBKYKjvJmLPEuYKamZo6Zn3I0aoA7LsNeGwVjPklICgdFEKgjJaQ43HzGRTQY8+0iX5xM47YFtI2LQG9ErgSyrahlIQnlGCzlpDOReY6Gwr34nIdXslcPNqo9PChxpmdbe8ew4HvnYso3R2wlk0i9FfzWgOuKdTaRE9+/0WrkbqASRsCFedZflqIrjgDlOXBU5ptwsIYL85nfViJyEUvHZueVukDZ1cwtuypkbQL2ASuC+e3DutEC/y0XYK8pGNAD2+0eyo0fr5q7G2wytRvl267h3/WM84EKKgq4BUfzCOI8PZc5mHu8ToE7Kh4nXVSKPZyG8LHuAT9h0x7oQ5QHaGMstuoKCDxaIW9Husj3O4B9kKt8HbGJWAPwj+u2d8L/e3VRflqa17K3WzjMPt0H5uhi3y3kZ7bwcQQJFzorZWctWvQ8YT2lslCOGyb6FDTwnd6vrp4KDMBV3SxZoopYXNKAZ4IlAfMyNNSJjVDvcph6t3Gqy8NqJMneVBd8lqSRK4Katjg8E8Zx5Mi/6v1AcCGKmvZ06giN7w2f90ccSUMABNdvUWW+WbAMiCgf2TRFIioSo6iYbqd6td2yeSlcoFP1eID0eyMw30wKuE87i5QE0Zhjh4ewWuCDPajdTZVjsVQB0zdmPgc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04839542-55ab-42fe-a4b7-08dac6555369
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 15:31:39.9673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCwsiHIN1eVp0fNqzUCwCFeWMPV5QPei/uj1Lj16l5W5NGACyNrlsNY2I8S2oRyK8q2OJhd1q9DkQIG1YEr0shlVRqwctW1AOAxIPqIyUXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6665

T24gMTQvMTEvMjAyMiAxMzoxNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBGcmksIE5v
diAxMSwgMjAyMiBhdCAwNTo0NzowMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
T24gMTEvMTEvMjAyMiAxNzozNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxMS8xMS8y
MDIyIDA3OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMTAuMTEuMjAyMiAyMzo0Nywg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4+IE9uIDA0LzExLzIwMjIgMTY6MTgsIFJvZ2VyIFBh
dSBNb25uZSB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3Zp
cmlkaWFuLmMNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFu
LmMNCj4+Pj4+PiBAQCAtMTk3LDcgKzE5Nyw3IEBAIHZvaWQgY3B1aWRfdmlyaWRpYW5fbGVhdmVz
KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBsZWFmLA0KPj4+Pj4+ICAgICAgICAgIHJl
cy0+YSA9IENQVUlENEFfUkVMQVhfVElNRVJfSU5UOw0KPj4+Pj4+ICAgICAgICAgIGlmICggdmly
aWRpYW5fZmVhdHVyZV9tYXNrKGQpICYgSFZNUFZfaGNhbGxfcmVtb3RlX3RsYl9mbHVzaCApDQo+
Pj4+Pj4gICAgICAgICAgICAgIHJlcy0+YSB8PSBDUFVJRDRBX0hDQUxMX1JFTU9URV9UTEJfRkxV
U0g7DQo+Pj4+Pj4gLSAgICAgICAgaWYgKCAhY3B1X2hhc192bXhfYXBpY19yZWdfdmlydCApDQo+
Pj4+Pj4gKyAgICAgICAgaWYgKCAhaGFzX2Fzc2lzdGVkX3hhcGljKGQpICkNCj4+Pj4+PiAgICAg
ICAgICAgICAgcmVzLT5hIHw9IENQVUlENEFfTVNSX0JBU0VEX0FQSUM7DQo+Pj4+PiBUaGlzIGNo
ZWNrIGlzIGJyb2tlbiBiZWZvcmUgYW5kIGFmdGVyLsKgIEl0IG5lZWRzIHRvIGJlIGtleWVkIG9u
DQo+Pj4+PiB2aXJ0dWFsaXNlZCBpbnRlcnJ1cHQgZGVsaXZlcnksIG5vdCByZWdpc3RlciBhY2Nl
bGVyYXRpb24uDQo+Pj4+IFRvIG1lIHRoaXMgY29ubmVjdGlvbiB5b3Ugc3VnZ2VzdCBsb29rcyBl
bnRpcmVseSB1bm9idmlvdXMsIHNvIHdvdWxkDQo+Pj4+IHlvdSBtaW5kIGV4cGFuZGluZyBhcyB0
byB3aHkgeW91J3JlIHRoaW5raW5nIHNvPyBUaGUgaGludCB0byB0aGUgZ3Vlc3QNCj4+Pj4gaGVy
ZSBpcyByZWxhdGVkIHRvIGhvdyBpdCB3b3VsZCBiZXN0IGFjY2VzcyBjZXJ0YWluIHJlZ2lzdGVy
cyAoYWl1aSksDQo+Pj4+IHdoaWNoIHRvIG1lIGxvb2tzIG9ydGhvZ29uYWwgdG8gaG93IGludGVy
cnVwdCBkZWxpdmVyeSB3b3Jrcy4NCj4+PiBJIHJlZmVyIHlvdSBhZ2FpbiB0byB0aGUgZGlhZ3Jh
bS7CoCAoRm9yIGV2ZXJ5b25lIGVsc2Ugb24geGVuLWRldmVsLCBJDQo+Pj4gcHV0IHRoaXMgdG9n
ZXRoZXIgd2hlbiBmaXhpbmcgWFNBLTQxMiBiZWNhdXNlIEludGVsJ3MgQVBJQyBhY2NlbGVyYXRp
b24NCj4+PiBjb250cm9scyBhcmUgZW50aXJlbHkgdW5pbnR1aXRpdmUuKQ0KPj4+DQo+Pj4gSXQg
aXMgInZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5IiB3aGljaCBjb250cm9scyBFT0kvSUNSIGFj
Y2VsZXJhdGlvbiwNCj4+PiBhbmQgbm90ICJhcGljIHJlZ2lzdGVyIHZpcnR1YWxpc2F0aW9uIi7C
oCBUaGVyZSdzIGEgZGVjYWRlIHdvcnRoIG9mDQo+Pj4gaGFyZHdhcmUgd2hlcmUgdGhpcyBsb2dp
YyBpcyBhbiBhbnRpLW9wdGltc2lhdGlvbiwgYnkgdGVsbGluZyB3aW5kb3dzIHRvDQo+Pj4gdXNl
IGEgVk1FeGl0LWluZyBtZWNoYW5pc20gZXZlbiB3aGVuIG1pY3JvY29kZSB3b3VsZCBoYXZlIGF2
b2lkZWQgdGhlDQo+Pj4gVk1FeGl0Lg0KPj4+DQo+Pj4gSXQgaXMgbm90IGJ5IGFjY2lkZW50IHRo
YXQgInZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5IiwgaW50cm9kdWNlZCBpbg0KPj4+IEl2eUJy
aWRnZSwgaXMgZXhhY3RseSB0aGUgbWlzc2luZyByZWdpc3RlcnMgKG9uIHRvcCBvZiAidXNlIFRQ
UiBTaGFkb3ciDQo+Pj4gd2hpY2ggaXMgZXZlbiBvbGRlcikgdG8gbWFrZSB3aW5kb3dzIHBlcmZv
cm1hbmNlIGxlc3MgYmFkLg0KPj4gU29ycnksIHNlbnQgdG9vIGVhcmx5Lg0KPj4NCj4+IFRoaXMg
YWxzbyBmaXJtbHkgaGlnaGxpZ2h0cyB3aHkgdGhlIEFQSS9BQkkgaXMgYnJva2VuLsKgDQo+IEkn
bSBub3Qgc2VlaW5nIGhvdyB5b3UgYXJlIG1ha2luZyB0aGlzIGNvbm5lY3Rpb246IHRoZSBjb250
ZXh0IGhlcmUgaXMNCj4gc3RyaWN0bHkgYWJvdXQgYSBWaXJpZGlhbiBoaW50IHdoaWNoIFhlbiBo
YXMgYmVlbiB3cm9uZ2x5IHJlcG9ydGluZywNCj4gYnV0IGhhcyBub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIEFQSUMgYXNzaXN0IEFQSS9BQkkgc3R1ZmYuICBJdCB3YXMNCj4gd3JvbmcgYmVmb3JlIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgQVBJQyBhc3Npc3QsIGFuZCBpdCdzIGFsc28gd3JvbmcNCj4gYWZ0
ZXIuDQoNCkFuZCBub3cgaXQgaGFzIGEgbGF5ZXIgb2Ygb2JmdXNjYXRpb24gd2hpY2ggbWFrZXMg
dGhlIGJ1ZyBsZXNzIG9idmlvdXMuDQoNCj4gQWxzbyBzZWUgbXkgb3RoZXIgcmVwbHkgLSBJJ20g
ZHViaW91cyB3aGV0aGVyIHRoaXMgaGludCBpcyB1c2VmdWwgZm9yDQo+IGFueSBXaW5kb3dzIHZl
cnNpb24gdGhhdCBzdXBwb3J0cyB4MkFQSUMgKHdoaWNoIHNlZW1zIHRvIGJlID49IFdpbmRvd3MN
Cj4gU2VydmVyIDIwMDgpLCBiZWNhdXNlIHdlIGV4cG9zZSB4MkFQSUMgdG8gZ3Vlc3RzIHJlZ2Fy
ZGxlc3Mgb2Ygd2hldGhlcg0KPiB0aGUgdW5kZXJseWluZyBwbGF0Zm9ybSBBUElDIHN1cHBvcnRz
IHN1Y2ggbW9kZS4NCg0KSXQncyBub3QgYWJvdXQgd2hldGhlciBhIHZlcnNpb24gb2YgV2luZG93
cyBzdXBwb3J0cyB4MkFQSUMuwqAgSXRzDQp3aGV0aGVyIHdpbmRvd3MgdHVybnMgeDJBUElDIG9u
Lg0KDQpTaG9ydCBvZiBoYXZpbmcgYW4gZW11bGF0ZWQgSU9NTVUsIG9yIGFuIGFic2VuY2Ugb2Yg
YW4gSU8tQVBJQyAobmVpdGhlcg0Kb2Ygd2hpY2ggd2UgZG8pLCBndWVzdHMgd29udCB0dXJuIHgy
QVBJQyBvbi4NCg0KSSBrbm93IHdlIGhhdmUgdGhlIG1hZ2ljIGhhY2sgZm9yIElPLUFQSUMgd2l0
aCA+OCBiaXQgZGVzdGluYXRpb25zLCBidXQNCnRoYXQgb25seSBnb3QgZW51bWVyYXRlZCBpbiB0
aGUgWGVuIGxlYXZlcyAoSUlSQz8pLCBzbyBvbmx5IExpbnV4IGNhbg0KcGljayBpdCB1cC4NCg0K
VGhlIGhpbnQgaXMgc3RpbGwgdmVyeSByZWxldmFudCBmb3IgYW55IHZlcnNpb24gb2Ygd2luZG93
cyBydW5uaW5nIGluDQp4QVBJQyBtb2RlIHdoaWNoLCBhdCBhIGd1ZXNzLCBpcyBhbGwgb2YgdGhl
bSB1bmRlciBYZW4uDQoNCn5BbmRyZXcNCg==

