Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656866482C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 19:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474932.736386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFJ2P-0004xV-As; Tue, 10 Jan 2023 18:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474932.736386; Tue, 10 Jan 2023 18:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFJ2P-0004uR-6r; Tue, 10 Jan 2023 18:07:53 +0000
Received: by outflank-mailman (input) for mailman id 474932;
 Tue, 10 Jan 2023 18:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFJ2N-0004uL-M8
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 18:07:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0133454-9111-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 19:07:49 +0100 (CET)
Received: from mail-bn1nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jan 2023 13:07:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5132.namprd03.prod.outlook.com (2603:10b6:5:1e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 18:07:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 18:07:39 +0000
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
X-Inumbo-ID: b0133454-9111-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673374069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MdqVEpphdJImzJSpUifrpqkuvfmbJ6VAe+5o7miVXh4=;
  b=V0itUQyhzoOSmOkLCuNHT80dFQr0VjOcEk/q83Ysrn9B2XyA14M9wdGq
   eGinUEj9EcGt2FNdPBCg6YupcrNm3+xoAmXVjdQxGy16CScnhs82MsC36
   P6VwcmH+1RXF37AyInc4fvV5La7ShRcvZxzndZF2XDtPgibJ3H+eFrcSf
   s=;
X-IronPort-RemoteIP: 104.47.51.49
X-IronPort-MID: 94445988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6Aifuq668Slxi4rXLDSqowxRtAHGchMFZxGqfqrLsTDasY5as4F+v
 mYfWDyCbP2JZWOgeN10bN+0pxtT65/VmII1TQY5/300Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakS5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 /wFAjctYim/qM2v2pGKG+BHos0vFZy+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCd5OSODppq4CbFu712kBKiwIWGmH+9aemEOcBe5He
 xMG0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcBaDEFS00Z4tDliIA1kh/LCN1kFcaIYsbdHDjxx
 3WAqnE4jrBL18oTjf3nrBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:aRqv2q+kGb5QVFJ/S51uk+H2dr1zdoMgy1knxilNoENuH/Bwxv
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
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="94445988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXBj/6Jbjdkl1GrEhBfUc7QJYFH6Gft0Mp72o2p1JIzWTIKZZ3SGZzOF4HrhCriTkdt8pU9kYC8637Q+whhWLXuUe2iGUmDV7abMLiVR80cKQSMaV/ERcAv4Pq0kOGK6Zilgx7LE4DX0thrwywVaKaVCdynEvMcaTbwTcUCEskjbj9tM/AcpvFXbQP/KC3dm2+pVXu57OqKV5MtETWoZUz3n4iYjmd340CgFz/RU3VqR+l3rwtqNEuiJm6U4YgzeS78TGgZ4uG9Izd5du7wyqTOHLkud0P3L4QlVfsQmkc/PNAqrMi7EJ76P+2O1FAj3oSWg2e0dmF9bSqldxqXjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdqVEpphdJImzJSpUifrpqkuvfmbJ6VAe+5o7miVXh4=;
 b=YgIY07I2xALE9rqhYEBzb7o9jSmlISrIIKRMunRvUlxMzOpx+gNSW/DqLwldt8ZqQTvgavM4c0pXyDAzcHUv2+xJtyL6EHDoIVH5JK6OupPvow4C5iLvxoiUJbuSIu21KQn7urOoR97pEXH/wr+ZiGAZ+oGnjpuh2h8dVMMvfKmvFxHkR30ANkkNWmFe1RE4gWeIfiqUNGbuAbyOQrhLn0k6EQqq+zPKcLpeYcOAXf7eaaY/E+iAOwBQLH77EbNQeVjhQGz0FsQvFkiHLOd8fMbDS6YwfW+Hxk3yGWDFU6NHOrppf7EdCrWgVrrRxpCLdVrnN6Oaad3UbL5spRC63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdqVEpphdJImzJSpUifrpqkuvfmbJ6VAe+5o7miVXh4=;
 b=gkmNLeC1xBU48YLCErIwZT0o/AkVXDKRJ+XFA8fJYOoC/e6DsgVE5aUeOrJGgH/+59ovhrVcu5qie1An8tIdS5KZgqo5pXA+wRxiaaMZhQ3EcD8/x4S9EpMYq7zGLhoQTE+cwUPXA96hEL8LFqNm8vAKvQ1sdJ8LM+Y360SCPSA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Thread-Topic: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Thread-Index: AQHZJReeV/6Z/BfYW0W8YgpP3+cAB66X8qqA
Date: Tue, 10 Jan 2023 18:07:39 +0000
Message-ID: <798bf587-06c2-bdf3-646d-bc3da2a9a566@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-7-andrew.cooper3@citrix.com>
In-Reply-To: <20230110171845.20542-7-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5132:EE_
x-ms-office365-filtering-correlation-id: a2ce736f-a0a7-436c-859d-08daf3358fc8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 J+duAl60zo5hWAQafLCYvrIiVv/ysllt1P+QNsxZlH8FGyiI8TcCYIMsu+MPSzvjR39wPNVCr1LNAGYDerHsMs6Q5tlnFDpCIqMVXJ1RtL0zPJfTwQxPfqK7WQXx4+ImuDqqeRHO0Z1Ss6ob6aZVS4qSCHyixEpMjyySuJdRwGzUCgOKxyNkLqmLWdCqM2YvctsHQoRh/4ISRkk0xuWHXN/4PWYa7akDR9oESlDZ1PLDJnCNemMqmmRxKr+rwLo0OKmZSNSyNMB5h5D7KGl4JVSdXcX2U4i1J5IHLWcXDyJsJ0rXEVY/ylV19axrRmTjCw3qLLgMY7IB14cn94kU1rkYbdL7vnZxGxV7vMq3iVTHxZ2WHsG5cgg3zrApnLTuF6IqZYDkAXxWwQC40cgH8MeL5+dHD9hwGMk35qeuwekpkRB+n98LkHkZ+h9eBAHO3T3ulW6zaCiP9MSHVzVnHNJ1wjB5n/QlQjRh2gJOc/YOg1WUX9ojja8EM2tquYulWdYzcgOWuqzh++dw24mfNqPPiPPENE0535TjqkFq+1mo+S+drbkywHaYz6lpTvd4x8DjAOatwjsUyz8UY0ylnTuYqh5JR0uwnj5WJxYQhM+/+7VjuJYJcZvma0YgLkhzwzYg4cWnB4pue9tkTs8m4l/oFqAFlAytDvbVIBI+vOQO3EBkVSSll9oDkLppGhvVsYm8zayLuXWHjiOEPieznki6bi65pdQc5yxRHYh/USipUOQD2B070sdbN8ETe9AFh+/yPKKdUBQBFcFdXuGN/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(36756003)(186003)(26005)(53546011)(122000001)(8936002)(31686004)(6512007)(6506007)(2616005)(66946007)(5660300002)(66446008)(66556008)(66476007)(64756008)(316002)(91956017)(4326008)(38070700005)(86362001)(71200400001)(31696002)(76116006)(38100700002)(82960400001)(478600001)(6486002)(54906003)(41300700001)(8676002)(110136005)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajZVZk5JMmExWklCelpOSjdqZjNYUThFV2hwdXVHU2s0czl4OFR4NHZpRmJM?=
 =?utf-8?B?RUJ3QjRPMFlHaXQ2SzZQOVNyeWdEVGVDeGxmc0U1RnVtb2tpSnUxcUFsZUtM?=
 =?utf-8?B?K1RHWGFSNVpKM2wxeXVuREdpaUJKU1hoaWtTVWFWSFhJZHdwS1lUL2QzRGpr?=
 =?utf-8?B?d25LZHFGWEVZNUtUNFNVZTNxZEJDRUJlZ3ZNVlRiYVd4L2ZJaXhVYjVjQlNT?=
 =?utf-8?B?MTRFMEpQc1lhUDBwcTBqeFdSRU13M0tuQmtjV25QREcyM1lkaGRmbkllcFR6?=
 =?utf-8?B?dUdlWStwVVpKc2h0ejBoT1NVZUI1OGRadE5QN0JNL3Y2UUpPVnBsMkFNYUZP?=
 =?utf-8?B?dnFzOFBVTzMrdWNneENMWnpIQ2FRQmRXNDRqUUtxRzdvTW1WR0dFQ1c2WG45?=
 =?utf-8?B?N0Z5Zm05Y01xNzVUeVRYUmZuN1NQWEptS3FIc2dVU2dON0ZaTXNlUnk2OTU0?=
 =?utf-8?B?ejFEd08yLzZBK2NVbnhDMm05VkhBd1R2SjJFMDZzYzRrMnBWOE5XRGlNUUlO?=
 =?utf-8?B?RzZmV2FzOWdNVmp5a2NZV05pOVd6R3NwRnE2bFNMR0t3S28xV2pmbS9DdEt2?=
 =?utf-8?B?Qkxra1laSCtjNjBtTHp2SGlBTll2OTZiUk9sMTBlcktKNmJ0T1R5TE5wSU8x?=
 =?utf-8?B?Y2xxMWVxelh4dWZKemNESElUWGE3OVFTSkozNVlaRHZIamxtTGwyM2pWQU9C?=
 =?utf-8?B?R0hscXBuUE40eTg3ZkYzRjkwN0FsRXh1UUlqRlR5ZXZ3OWM4R09STFEvM0pE?=
 =?utf-8?B?c1ZJZDdUU0cyNUtHMkR3QzlBbXViU29SOGluelI5M0RVeE04NFFrODRIeGZt?=
 =?utf-8?B?NmRFS2p4WVNWN2R3MEpoTnhsSFNmcTl1MC9TZlh0L3lyRC9URGpJcVlyUEtp?=
 =?utf-8?B?MlI4bEZ2eWFkL2t4SWNQY2hHa0pSK3J5RVNycXFZWjd3RXNSZDRDY1JTQ3Bt?=
 =?utf-8?B?dmxaeGZoWThhMi9pNFYzRlJobkVHTGFQV1ZYZ3g5VFNmdVgyQzFvVCtSYjZo?=
 =?utf-8?B?R1pyMitDaTVHZk01VE1SblRWUVpHS3dLUXBwOTN1aDNXaitGSkJoZ2FTcFhq?=
 =?utf-8?B?SFZrZndOU05RNVhiYUFPRHdiekdjOTQvN2V5VGd3VkF1emp0V0tiajFsNzN5?=
 =?utf-8?B?cmhlRGhrTUo1RStZeFBvS3BTRFJoSEttQlVPcDJSYnkrd2F5ZDBZU3hhbFBx?=
 =?utf-8?B?T245dEMrcDEyVUUyV3J1NWE2djJZQXpYR1hEcWtxQ1Awc1EwSkx3Mmlvci9F?=
 =?utf-8?B?NVFvRjVwaDY3UFh0SkZHdVBaUEU0cE5pTkVZaEZZd2JQSTZMZGpSSTdaT3Z3?=
 =?utf-8?B?M08xeFJiei84WFJMWS9PN0huZ3ZhQU1oY3VHWFRBZ0hTdnh5Y0E1cEc4UlFH?=
 =?utf-8?B?c0JQN25xNXhLSTFzbVl1V1ZlNll5Qk9FSkREWXR2UCtna2JoRzBnajNDbFJy?=
 =?utf-8?B?VEdCblFYeGFwRFFxZG9oaWtLQzZETXVseUxsTVd6WHNMQ0xUVGtMbk5PM00x?=
 =?utf-8?B?WlhLUXVZaGtCZVI0QnVOUFNBVDUwL2VISmhZTHMwbDFWS2RmczI2a05ReEpX?=
 =?utf-8?B?bTFKSFNKYklRWDdQVE90REVJUUp4MFRncmtZY3RGL1JQREYxRk55c1FUQ09Z?=
 =?utf-8?B?OUxVY29NUDRKdStXY2RLc0FmRTZxVy9IKzV5a2dPdy9OODZicWRVbU0xY1dq?=
 =?utf-8?B?MHlKSzVZcVI1VWtjWlcrd001QkVrUG5ZVUowbTZFRW9WSVduSjBMaFFOdXV4?=
 =?utf-8?B?bGk5OGJnZGVxOERJQlhkcEVJVFI3TFFFVGV6eG41T0ZvaFptQWJSa3llQ2hO?=
 =?utf-8?B?UHl0RmJLckdtekpWaXRnd1A4SkwrMkJqaUxQbnQ4STkwR3ZvazlORGhUckJE?=
 =?utf-8?B?Ly8xVHBwMkp0OG5sTSt3RU1UQzJ6ZjlISWU4Z202TXJGMEgvTFRKR3hxcnBC?=
 =?utf-8?B?ZmhiU3I1blBPOVlmOGEvUGlHM3hZMVFCM1p1SnNhL1lQSDlIYXU0ak4rb3Iv?=
 =?utf-8?B?blN4SzlMdXpGT2d0Q3dDWmwrdDNBeG92RjcwTjZLZHJoTHVNQ01Ed21MKzBy?=
 =?utf-8?B?cGpjQXYzVTJMYkZNWC9uVFZFOTRCVlIra2tUVXZlVkxtbHluY25zaDhSZkl0?=
 =?utf-8?Q?8YPR/XB8gEv4YVuCPDgmi1Lg+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A177FF677FDDD42BEBD0973D4FB9674@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PGKj8lhuTeQzvwXVYTXfEK2lvu8WuqP8CVCdrdLcnfhwTxwI8HqdJCTZFMAlAdZjNr/St92xS9NWZCaBxYnpAfKhlFrxnsiPLX0CgnmSYS2zSIaomTqG3WeuZBGcdm1p0ySnud71BA4FtqdE0GLbmj++zgmyswnxxsUhFW6YCQbonch8kdxvExXieu/JqOj8beNg/R6jm9t+rZLG0CvLf1UhGfft2TUgN5Hu7wd0JPgfrXSi76S/zW0DAanvLJwnDxXDzsiGdx27lCiWgYBIHPCvkecPZT/Kl8Hw/nv6siDfDBqpt2ffhAwAznEIfbDtOKeLdGpT8d+HNWVXPzBu3AVP1TZcexmPN/l3TCRzkI7VcQWKsHCVkiV4+lQXLJkPHVYYxRJ/xMKmAz9HFFZExFpGxWRyFM5iaAGD7HuObArJFCrtFqDLlBymgtvX6K9WG0DAYXqJF8x7TtZg7I/Gbfps8KG7ADW5R7rQWY2/GlMnzIIMYouZGJeafNO+zveTUsmgqoGZMrcuGmHFc3zMfN1pOay4eFuwDSDYGXanMg4nCkwyY9oJMtzgQYtVx1mJZGGNT8/o5i2ttEgQuskHjJP2O9ush8aaEArnVIp6qz9qtEV1RGMCNCN6+q4YG4cTdfSxTrIIKW7EQ06En3cNtrrcR0IyDkAuZdbegS6SUyPzADE2wkjvjPMQO3gsWL2FFBoKEZfz2UBrJGacHFbPkmgv3KSCJrTP1GAdGk8ucyK2X/1iMU6kxjIezD2FePi0FLCo7MghMi9t4zwkPZpVKCsjD2E2IbCeVMpsT4cDgOz+nZsRXJ8wC5LYs+pE6o6npnf+prsmJP9aGkFUAZ0hhesd8KSvlKCJNiozGmpk9HI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ce736f-a0a7-436c-859d-08daf3358fc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 18:07:39.6821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QhVEsWY6oawseMrLl4RRFT/MgzKboZT8AwlAa4mDBh7noxRSwz5WiIWEK9V0ViMRP/1iH3zBd9u/hNL0XlQT4vGeDX0C+h4HuiVpbE6u+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5132

T24gMTAvMDEvMjAyMyA1OjE4IHBtLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBIYXZlIGd1ZXN0
X3tyZCx3cn1tc3IoKSwgdmlhIGh2bV97Z2V0LHNldH1fcmVnKCksIGFjY2VzcyBlaXRoZXIgdGhl
IGxpdmUNCj4gcmVnaXN0ZXIsIG9yIHN0YXNoZWQgc3RhdGUsIGRlcGVuZGluZyBvbiBjb250ZXh0
LiAgSW5jbHVkZSBNU1JfUEtSUyBmb3INCj4gbWlncmF0aW9uLCBhbmQgbGV0IHRoZSBndWVzdCBo
YXZlIGZ1bGwgYWNjZXNzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0KPg0KPiB2MjoNCj4gICogUmViYXNlIG92ZXIgdGhlIGdldC9zZXRfcmVnKCkgaW5mcmFz
dHJ1Y3R1cmUuDQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgfCAgMSArDQo+
ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ICB4
ZW4vYXJjaC94ODYvbXNyLmMgICAgICAgICB8IDEwICsrKysrKysrKysNCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gaW5kZXggOTI3YTIyMTY2MGU4Li5j
NmMxZWVhMTgwMDMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPiBAQCAtMTMzMyw2ICsxMzMzLDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBodm1fbG9hZF9jcHVfeHNhdmVfc3RhdGVzKA0KPiAgc3RhdGljIGNvbnN0
IHVpbnQzMl90IG1zcnNfdG9fc2VuZFtdID0gew0KPiAgICAgIE1TUl9TUEVDX0NUUkwsDQo+ICAg
ICAgTVNSX0lOVEVMX01JU0NfRkVBVFVSRVNfRU5BQkxFUywNCj4gKyAgICBNU1JfUEtSUywNCj4g
ICAgICBNU1JfSUEzMl9CTkRDRkdTLA0KPiAgICAgIE1TUl9JQTMyX1hTUywNCj4gICAgICBNU1Jf
VklSVF9TUEVDX0NUUkwsDQoNCk5lZWRzIHRoZSBmb2xsb3dpbmcgaHVuayB0b286DQoNCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0K
aW5kZXggYzZjMWVlYTE4MDAzLi44NmNhYjdhYTI2MjcgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2h2bS5jDQorKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQpAQCAtMTQ4Nyw2ICsx
NDg3LDcgQEAgc3RhdGljIGludCBjZl9jaGVjayBodm1fbG9hZF9jcHVfbXNycyhzdHJ1Y3QNCmRv
bWFpbiAqZCwgaHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpDQrCoA0KwqDCoMKgwqDCoMKgwqDCoCBj
YXNlIE1TUl9TUEVDX0NUUkw6DQrCoMKgwqDCoMKgwqDCoMKgIGNhc2UgTVNSX0lOVEVMX01JU0Nf
RkVBVFVSRVNfRU5BQkxFUzoNCivCoMKgwqDCoMKgwqDCoCBjYXNlIE1TUl9QS1JTOg0KwqDCoMKg
wqDCoMKgwqDCoCBjYXNlIE1TUl9JQTMyX0JORENGR1M6DQrCoMKgwqDCoMKgwqDCoMKgIGNhc2Ug
TVNSX0lBMzJfWFNTOg0KwqDCoMKgwqDCoMKgwqDCoCBjYXNlIE1TUl9WSVJUX1NQRUNfQ1RSTDoN
Cg0KZm9yIHRoZSByZWNlaXZlIHNpZGUgb2YgbWlncmF0aW9uIHRvIHdvcmsuDQoNCn5BbmRyZXcN
Cg==

