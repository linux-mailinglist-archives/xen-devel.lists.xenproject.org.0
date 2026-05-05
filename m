Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HJeGIhh+mm3OAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 23:30:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10604D3EAE
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 23:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301118.1575457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKNK7-0005Zo-Pz; Tue, 05 May 2026 21:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301118.1575457; Tue, 05 May 2026 21:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKNK7-0005X9-Mu; Tue, 05 May 2026 21:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1301118;
 Tue, 05 May 2026 21:28:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKNK5-0005X3-5n
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 21:28:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKNK4-00B0ey-FL
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 23:28:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fa6112-5cb7-0a2a0a5109dd-0a2a450ccd54-10
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 23:28:56 +0200
Received: from [52.101.56.5]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fa6117-62f1-0a2a450c0019-346538055f62-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 23:28:56 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 21:28:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 21:28:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJiFht+sj/FJN2Ar2GgYWcl7wM4C1CpaMLUEDiFoePyT5sIp33oZJ1aB1ob9qMUws/F+VMR4hYhsaru5h5nqmUPjGql3cYYUyL4aEGhbasNjaVpIvRb5tRwTfQOJ9HXJxK2FXPC96jadRMQKYmfyjWRI9SDmJBwDFmbnRpI0TIHR9m88TAGxvmc2SdB4n6T89rvQiDaSmxGMRBxsJ1c9yCqJQvL/SKWWEm80B9dJyyUHek8NMl+kmkjt+pYGvqnPiqlJfHrhDfvyDCOmlFq4vuTBVHBkeImHbO+IAvuKZ2BeS4eldYSonK+VgDGGWvSznPj4a8oIdGLdnkD1eAxnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N9bbauhr/vAtIL7oTRDyclgRUdKAGEPYY5j+1BUDOI=;
 b=xwbj+VGgY6XVKneW7aVyNecwL4vwBRFKV0/BIGQOSDuu2Si54Oun2Gec+1bYy816LL/LQAv94i+UokTnWkzal26xzSO1sh28lxbRMrI4NXDJg3DeaFz8CuA5eZUzMw2+nSawVKdIws1VrPHyZDfJFiof8nNJ3kpYxvhhmlSaIXnMpyP5Uj5s0RN/Lq6EO8lZC8+DQoD6q0YSEUSC98G1mYjuDzBPAISfloGYUpeua4tpRHpQbqmpC8N0t4qw+WTOjEY9qjlZZwBW1Kkx70IbBHGTiMsTc5hGw7aBn0CTQDd9YVcy2jNuVzZVW/q+p9nh1iXJrvGcoxmsKDUfeh6eKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N9bbauhr/vAtIL7oTRDyclgRUdKAGEPYY5j+1BUDOI=;
 b=iMdNON0C/V3d18U5cJmRHMPjjNRf2jg2szijJ+D41atNDMwLciOkgt4K2GrqJmuyH+SPS9DHWZxSczLGPfGDy4KCS8kyqvRg8IefjvWAhzDC7wVaxycrwaSIwzzYj5OqfbxWDVFjbpN6Aah0OIV9YnM/6/TaXj2uaG7ZH6drz48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dfb47a66-9339-4576-a8a9-874240f514e9@citrix.com>
Date: Tue, 5 May 2026 22:28:47 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v10 2/2] xen: Strip xen.efi by default
To: Jason Andryuk <jason.andryuk@amd.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20251208133945.61375-1-frediano.ziglio@citrix.com>
 <20251208133945.61375-3-frediano.ziglio@citrix.com>
 <089b9287-addb-4736-8174-f8a297de877f@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <089b9287-addb-4736-8174-f8a297de877f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e1b562-002d-4691-443b-08deaaed4d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lk4Iv+cmwhWUL0g/WuWC69zwTNsrZKAdn/9OGoEm43pqiVU02GFmr67crv9ZS5gIXe4Kfiuujt7yOOjLUpcwGerbDXfxUkKusHwKSCP3Mfk3Oxqj395SP2UOKc+F0gWS6afQzJmGQ5CKhruaNBp9QvNEtwfSh11kFiSBYkDCrrZvsyalXJSFKDN4KjtWA3SBDd6JceFtffKvabtJOQBmLhuJaOFYMa0VTdnrJBgPPCybMLLyusaMEq2JDwwD4UNs0xzn2WrUSvCH/XxAlL820g7/Y4d9WwqOqDsCuMYKqPn7+oCW7o4b6au+XO4Go/rEYSEgQVbjf0TR0Wd8uZ2BoqBrxjYkXp/dBiIvI19URdn6FuuctZjF66KW2pZNrR2vQDSdanouQC7mkXbeJsMh+uMfqs1dRK2TxilU2Z+EzLzloAAQu4vyynJnCGv4Hx5XOa7mWHgj57TveJdUEpqKWnw+okFmEGTEeWtXj5ctxGJOcwUi1P5pItKP/JR1U8/bH7KpmQDFiBn30zykLFdZFhH2WVKviOOZaZZgz94nXVf0pkXT74hIdVUOZlEWsx2oXArnT3VzOVizJ/+lRNkYyDItNjVYq6jVh8+Pmp0t2GgIOIZT5oUzmspk8w+KMgn+TTkNM90AJ7uoe1Ezm9CbaU27b6TkeU9pZdSGFPzvPJzYaNIkfakuRjtCYeopffJH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW9qZFN1NENac2VVT1prN3RDL1I5MDBMMkU4SlhSWlFTMWMrY081Z0o3VWNR?=
 =?utf-8?B?aU9EKzJ6LzhlWTJvYXdCVWs2UXFqSjFxSVUrdnVpalp3YnNjTzRZaXVIU3Nm?=
 =?utf-8?B?akhZRi9ZVnZPaml5YWs0d2JFZWZ6OTIwNDRxaGUzdDFDZVJYQnBwTGI4aWZS?=
 =?utf-8?B?SWhJRjdleTRpRTJqVklrb1dWNndkV1B3VkRBLzJ0VExyQ1RxK1NzL1ZlanRw?=
 =?utf-8?B?cmZNdW10M21nYWVtUUZNY2pCWkN3N0E4V290TWQ3VnpFUytOZVRyNlFoUDM2?=
 =?utf-8?B?ZDdodGl0UjNnYWxBcGsyZ0YwODhwYnlNOHY5OGNXUFpOaER2eXFHNzhEbTVz?=
 =?utf-8?B?RWFCWktDbG9YMFVoUCtKc0lBMFVTOWF6UUt0LytpQUpPZzRrTkJNMHNBcGpi?=
 =?utf-8?B?YjZOeFFyK2RFbFFKUm0zbWJRalRXY2FoVUZuSWxUVVBFdWt3WXZuTHBrTTl6?=
 =?utf-8?B?WWQrS3VudHp4V2ZxU3ptdmR0Rld5NzRvY0loK3g0VWZhckpYT0x4MU01Y2U4?=
 =?utf-8?B?c3ZyQ1BYcHp2UWF1SmhrSTFwV3d1eHFXck1qMXZYempFK0Y1OWNWUHVoZVhZ?=
 =?utf-8?B?TzRmdWd5MVpDa3RNencydlN5TTh3YkxGRnpVZnhlbTF6T2tEeFczNlJQT3c1?=
 =?utf-8?B?UEFFRlJ2bEJVckVGbkVDQkxFV2JTcnB1TjNVQ1pmYnlPc0lVd216TjNyREpJ?=
 =?utf-8?B?ZlhwQzNhNTJyU0VNZzhnMVgvbk9PWWE3RnAvVDZBc0JKNG1pMEw4eHhCVFpO?=
 =?utf-8?B?bUUvb1YzTTB1eDFTSndEdmNDSUE0a01ydU5BRWdRZTZ5a2JYVXZ3L05QbVhJ?=
 =?utf-8?B?VUVTQVg3VTBuREQ1UE9jNnIxLzlyR1lGOGlRd21UQlBra20zaE1XNSttOCto?=
 =?utf-8?B?ak55SXE1NVNxVkhpanRDV1dTNWFjM2NjUTVqNHpzR09ialIrWllDREFENTla?=
 =?utf-8?B?Mmg5NmI4amR3Z0NINGFicHhqZUo4YXRMQ3RiSEJFNlVXS09sVjRlMXZQZi9F?=
 =?utf-8?B?Z0E0bFJmaEVqQ3NxZnd6dGpoQkhGZXpzM1JiYm5SOXA4djAyWEtuK3ZjRGor?=
 =?utf-8?B?Qk45NWtCRmlMdWNPNGZmbGVtZ004RUhmZmtPcUk0NnRGb1Z5S2hGVVpLekJO?=
 =?utf-8?B?dUs1dWNPcmpPK3lvQ2FTQTcweXdrcmw0UWZIdlppM1c5TC9VeHVQNXV4a2NW?=
 =?utf-8?B?M0NoM2pIN3RCL1RKODBab3JPYjZDeWt0VGIwbU8zZlpEWlVyNWNzb0w4NmxP?=
 =?utf-8?B?dk5kVHMwbkNTQXZYZWhJWVk3dU5tN2ZyZThFSDA3UStKNlFTaTh6bDVnaXZt?=
 =?utf-8?B?amJSYkxXdC9vMi9BYmhxM3BVQmczVGd6dE9DNVVZSU9RV2RhM1lUQ1g0NjEz?=
 =?utf-8?B?SzdNRFJWaC9LMHJTT08xaVVWaGRCbENzSm8rRjlpZ21ldzJ2RENmVlNaM0pa?=
 =?utf-8?B?SnU5aXEvMDZVMHlSOGxIYjBKdTJnb0JjOEVjNzhCMUFTMlBLY2FzMVJsb0hj?=
 =?utf-8?B?Z3NVcStLbTQ0T3NtUUtNeUZiakwrelQyaWFyMTBNeXZqWEJpeXpTUzIwaWNl?=
 =?utf-8?B?ZzhaZk9NUTZ2cVRtQmhhY0Z5bi8vME5CUGo4T0g1eXNTZVc4MHIrNnVYRTZx?=
 =?utf-8?B?eDliZFM3YnNWTkdkSXN5UHBSUTN4aVlsK2VSdHJmdFFBTmhmbXRZR1M1b2dT?=
 =?utf-8?B?NFZpN3ZkeUgreVMvV0s4MGEwSzROMGhXdGVNVTN3NmxBTHAwTm5LNy96Y3lr?=
 =?utf-8?B?bEdHY2E5UHhGUkhzSFVCZ1JQRCtqbUVtaE83V21Obk1Od2FpeFNhY09ZSjlF?=
 =?utf-8?B?MTNrYnRlRFFrdFlaTUI1VWlTTnRmME5weDRGa3paeWVRdklsMXVXNGIrQ3J1?=
 =?utf-8?B?b3ovTVR4MGJwYzFCbGgya0NUa1FSdkhFOUhYRHZvbTJ6elk1N050dVhoY0hR?=
 =?utf-8?B?eWVLdEFmSFBBUTFwdFZ4MkJrUDVzNXFwb09IcE5KOU0xV2lKbmdNS0Fld2M0?=
 =?utf-8?B?SkR0Y0pqSFhxMXBOYWNlWllNQngyUEt3TTRUQUJnTTg5Yklhcm42dlg5KzBu?=
 =?utf-8?B?TXBidGVsZHVRcG1QYlQzajZCQkxZV1NNZ0hYRjl4bktSZnRkNUVSeEI1WHJt?=
 =?utf-8?B?ajNJRzZwNGxaZEZIRkJhZEtwU3FuYWh0WTVFNytXTzhldENCQkJvWU5XRlZk?=
 =?utf-8?B?enhBaE1keGdOdW9mMVRwMVBVdjNJazk1b1M4QWNMeTlDcU56Y1JWRHNKRUJk?=
 =?utf-8?B?M1AvQjdTZjlleUROVkpLaGYyTDg0QTNWc3RaaTkwTnRJZjBzNW02T0c5SDJt?=
 =?utf-8?B?R2JGL1llRzBmbHVzVHlIcHUvQk1lOWtBMGFTZVRiQmRSWk5vODk4U3Y2US9u?=
 =?utf-8?Q?s1fdWr7Wam/D9LMs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e1b562-002d-4691-443b-08deaaed4d91
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 21:28:51.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5HAHs0XgqfzEx52ntod+2j810VZbOLxTmWyTTjBwyJBXf/oyWG4/q3Aifhoo79DtOjhS3/6HL3RQlthCQV78/jA61OgoVkhk2VFu4SJZpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151
X-purgate-ID: tlsNG-d25034/1778016536-6DB6CCF5-362F71B6/10/73395122804
X-purgate-type: spam
X-purgate-size: 786
X-Rspamd-Queue-Id: B10604D3EAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@cloud.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:freddy77@gmail.com,m:demiobenour@gmail.com,m:marmarek@invisiblethingslab.com,m:stewart.hildebrand@amd.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,cloud.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com,invisiblethingslab.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05/05/2026 10:10 pm, Jason Andryuk wrote:
> On 2025-12-08 08:39, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> For xen.gz file we strip all symbols and have an additional
>> xen-syms.efi file version with all symbols.
>> Make xen.efi more coherent stripping all symbols too.
>> xen-syms.efi can be used for debugging.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>
> While there is some discussion about patch 1, it seems like this patch
> can do in independently of it?

No.  One of the containers in CI has a buggy binutils.

~Andrew

